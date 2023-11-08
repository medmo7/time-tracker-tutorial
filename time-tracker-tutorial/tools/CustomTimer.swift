import Foundation

/// Timer used to increment the tracked time each minute
class CustomTimer {

    private var timer: Timer? = nil
    
    private var timerStopped = false
    private var frequency: TimeInterval = 1.0

    private var startDate: Date?
    
    var update: () -> Void
    
    /**
     Initialize a new timer.
     Use `startTracking()` to start the timer.
     
     */
    init(timer: Timer? = nil, timerStopped: Bool = false, startDate: Date? = nil, update: @escaping () -> Void) {
        self.timer = timer
        self.timerStopped = timerStopped
        self.startDate = startDate
        self.update = update
    }
    
    
    /// Start the timer.
    func startTracking() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            if let self = self {
                self.update()
            }
        }
        if (timer != nil){ // add the timer to a background thread separete from the main one to keep the timer running
            RunLoop.current.add(timer!, forMode: .common)
        }
    }
    
    /// Stop the timer.
    func stopTracking() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
}
