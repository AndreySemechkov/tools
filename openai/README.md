# OpenAI Interactive Chat Tool

CLI tool for interacting with OpenAI models with customizable response formats and AI personalities.

## Requirements

- Python 3.x
- OpenAI Python v0.27.0
- OpenAI API key
- Click package

## Installation

```bash
export OPENAI_API_KEY="your-api-key"
pip install openai==0.27.0 click
```

## Usage

```bash
python chat.py [OPTIONS]
```

### Options
- `--format`: Specify output format
- `--style`: Set AI personality (default: Jim Carrey in Ace Ventura)
- `--model`: Choose OpenAI model (default: gpt-3.5-turbo)

### Supported Models
- gpt-3.5-turbo
- gpt-4
- gpt-4-32k
- gpt-4-1106-preview

### Features
- Interactive prompt input
- Load prompts from files using `/path/to/file` or `~/path/to/file`
- Type "exit" to quit

## Example

```bash
python chat.py --style "Shakespeare" --model "gpt-4"
Enter your prompt: What's the weather like?
```

# Audio Translation Tool

CLI tool for translating audio files to text using OpenAI's Whisper API. Supports automatic format conversion and handles multiple audio formats.

## Requirements

- Python 3.x
- OpenAI API key set as environment variable
- Dependencies: `openai`, `pydub`

## Installation

```bash
export OPENAI_API_KEY="your-api-key"
pip install openai pydub
```

## Usage

```bash
python translate.py <input_file>
```

The script will:
1. Convert audio to compatible format if needed
2. Translate non-English audio to English text
3. Save transcription to `<input_file>_text`

## Supported Formats

Input: Any format supported by `pydub`
Output: mp3, mp4, mpeg, mpga, m4a, wav, webm (opus)

## Example

```bash
python translate.py recording.ogg
# Creates recording_text with English transcription
```
