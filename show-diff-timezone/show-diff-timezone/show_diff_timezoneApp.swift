import SwiftUI

extension DateFormatter {
    static let seattleFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
        formatter.dateFormat = "h:mm a"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    static let berlinFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Europe/Berlin")
        formatter.dateFormat = "H:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

@main
struct show_diff_timezoneApp: App {
    private var currentTimeZone: TimeZone {
        TimeZone.current
    }
    
    private var isInEurope: Bool {
        let identifier = currentTimeZone.identifier
        return identifier.hasPrefix("Europe/")
    }
    
    private var isInUSPacific: Bool {
        let identifier = currentTimeZone.identifier
        return identifier == "America/Los_Angeles" || 
               identifier == "America/Vancouver" ||
               identifier == "US/Pacific"
    }
    
    var body: some Scene {
        MenuBarExtra {
            EmptyView()
        } label: {
            if isInEurope {
                Text("SEA: \(DateFormatter.seattleFormatter.string(from: Date()))")
            } else if isInUSPacific {
                Text("BER: \(DateFormatter.berlinFormatter.string(from: Date()))")
            } else {
                // Fallback: show both
                Text("SEA: \(DateFormatter.seattleFormatter.string(from: Date())) | BER: \(DateFormatter.berlinFormatter.string(from: Date()))")
            }
        }
    }
}
