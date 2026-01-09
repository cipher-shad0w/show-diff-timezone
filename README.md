# Show Diff Timezone

A lightweight macOS menu bar application that displays the current time in different timezones based on your location.

## Features

- **Smart Display**: Automatically shows the relevant timezone:
  - When you're in Europe: Displays Seattle time (PST/PDT)
  - When you're in US Pacific timezone: Displays Berlin time (CET/CEST)
  - In other locations: Shows both Seattle and Berlin times
  
- **Menu Bar Integration**: Runs quietly in your macOS menu bar
- **Low Resource Usage**: Minimal CPU and memory footprint
- **Automatic Updates**: Time updates continuously

## Supported Timezones

- **Seattle**: America/Los_Angeles (12-hour format with AM/PM)
- **Berlin**: Europe/Berlin (24-hour format)

## Requirements

- macOS 12.0 or later
- Xcode 14.0 or later (for building from source)

## Installation

### Homebrew (Recommended)

```bash
brew tap cipher-homebrew/show-diff-timezone
brew install --cask show-diff-timezone
```

### Building from Source

1. Clone the repository:
   ```bash
   git clone https://github.com/cipher-shad0w/show-diff-timezone.git
   cd show-diff-timezone
   ```

2. Open the project in Xcode:
   ```bash
   open show-diff-timezone/show-diff-timezone.xcodeproj
   ```

3. Build and run the project (⌘R)

## Usage

Once running, the app will appear in your macOS menu bar showing the time in the alternate timezone. The display automatically adjusts based on your current timezone:

- **In Europe**: `SEA: 3:45 PM`
- **In US Pacific**: `BER: 15:45`
- **Elsewhere**: `SEA: 3:45 PM | BER: 15:45`

## Technical Details

- Built with SwiftUI
- Uses `MenuBarExtra` for menu bar integration
- Automatic timezone detection using `TimeZone.current`
- Custom date formatters for each timezone

## License

MIT License - see [LICENSE](LICENSE) file for details

## Author

cipher-shad0w

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.