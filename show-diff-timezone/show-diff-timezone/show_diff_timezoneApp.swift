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

class TimeViewModel: ObservableObject {
    @Published var currentTime = Date()
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        // Update immediately
        currentTime = Date()
        
        // Then update every minute
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.currentTime = Date()
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}

@main
struct show_diff_timezoneApp: App {
    @StateObject private var timeViewModel = TimeViewModel()
    
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
                Text("SEA: \(DateFormatter.seattleFormatter.string(from: timeViewModel.currentTime))")
            } else if isInUSPacific {
                Text("BER: \(DateFormatter.berlinFormatter.string(from: timeViewModel.currentTime))")
            } else {
                // Fallback: show both
                Text("SEA: \(DateFormatter.seattleFormatter.string(from: timeViewModel.currentTime)) | BER: \(DateFormatter.berlinFormatter.string(from: timeViewModel.currentTime))")
            }
        }
    }
}
