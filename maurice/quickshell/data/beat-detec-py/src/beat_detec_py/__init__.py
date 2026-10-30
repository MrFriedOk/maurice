import subprocess, time
import numpy as np

RATE, CHUNK = 44100, 1024  # ~23 ms per chunk
LO_HZ, HI_HZ = 40, 150  # kick range
SENS, FLOOR, COOLDOWN, ALPHA = 1.3, 0.02, 0.15, 0.03

proc = subprocess.Popen(
    [
        "parec",
        "-d",
        "@DEFAULT_MONITOR@",
        "--format=s16le",
        f"--rate={RATE}",
        "--channels=1",
        "--latency-msec=20",
    ],
    stdout=subprocess.PIPE,
)

win = np.hanning(CHUNK)
freqs = np.fft.rfftfreq(CHUNK, 1 / RATE)
mask = (freqs >= LO_HZ) & (freqs <= HI_HZ)

avg, last = 0.0, 0.0
while True:
    raw = proc.stdout.read(CHUNK * 2)
    if len(raw) < CHUNK * 2:
        break
    x = np.frombuffer(raw, dtype=np.int16).astype(np.float32) / 32768
    spec = np.abs(np.fft.rfft(x * win))
    band = spec[mask].mean() / CHUNK * 2  # roughly 0..1

    now = time.time()
    beat = band > avg * SENS and band > FLOOR and now - last > COOLDOWN
    if beat:
        last = now
        print("beat", flush=True)
    avg += (band - avg) * ALPHA
