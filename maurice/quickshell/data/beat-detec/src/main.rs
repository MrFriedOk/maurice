use stratum_dsp::{analyze_audio, AnalysisConfig}

fn analyze_audio(s,sr,cfg) -> Result<()> {
    println!("hi");

    Ok(())
}

fn main() {
    let samples: Vec<f32> = vec![]; // Your audio data
let sample_rate = 44100;

// Analyze
let result = analyze_audio(&samples, sample_rate, AnalysisConfig::default())?;

println!("BPM: {:.2} (confidence: {:.2})", result.bpm, result.bpm_confidence);
println!("Key: {:?} (confidence: {:.2})", result.key, result.key_confidence);
}
