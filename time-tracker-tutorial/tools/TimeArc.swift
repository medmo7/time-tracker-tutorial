import SwiftUI

struct TimeArc: Shape {
    
    let trackedTime: Int
    let timeGoal: Int
    
    /// computed property : Use timeGoal to calculate the degrees of a single arc.
    private var degreesPerMinute: Double {
           360.0 / Double(timeGoal)
       }
    
    /// When you draw a path, you’ll need an angle for the start and end of the arc. The additional 1.0 degree is for visual separation between arc segments.
    private var startAngle: Angle {
            Angle(degrees: 0)
        }
    
    private var endAngle: Angle { // The subtracted 1.0 degree is for visual separation between arc segments.
            Angle(degrees: startAngle.degrees + degreesPerMinute * Double(trackedTime))
        }
    
    func path(in rect: CGRect) -> Path {
        ///The path(in:) function takes a CGRect parameter. The coordinate system contains an origin in the lower left corner, with positive values extending up and to the right
        let diameter = min(rect.size.width, rect.size.height) - 12.0
        let radius = diameter / 2.0
        ///The CGRect structure supplies two properties that provide the x- and y-coordinates for the center of the rectangle.
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
        }
    }

}
