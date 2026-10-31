import mixxx_analyzer
import os

# Analyze a single file

result = mixxx_analyzer.analyze("/home/fried/Music/kingGnu/aizo/King Gnu - AIZO.flac")
while True:
    print(result.bpm)  # 138.0
