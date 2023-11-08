//
//  TrackerMenu.swift
//  finishIt
//
//  Created by BOURGA Mohamed on 23/05/2023.
//

import SwiftUI


struct ContentView: View {
    
    
    
    @State var isTimerOn: Bool = false
    @State var trackingGoal: Int = 360
    @State var trackedTime: Int = 0
    @State var timer: CustomTimer?
    
    
    
    // MARK: Functions
    // ==============
    
    
    /**
     - Increments trackedTime by one second
     */
    func updateTrackedTimer(){
        trackedTime += 1
    }
    
    
    
    /// Toggles `isTimerOn` state and  start the time counting process
    private func startTimer(){
        if timer != nil {
            isTimerOn = true
            timer!.startTracking()
        }
        
    }
    
    /// Toggle `isTimerOn` state and  stops the time counting process
    private func stopTimer(){
        if timer != nil {
            isTimerOn = false
            timer!.stopTracking()
        }
        
    }
    
    
    
    
    // MARK: Rendering
    // ===============
    var body: some View {
        VStack{
            
            // the tracker area:
            Circle()
                .strokeBorder(lineWidth: 10)
                .foregroundColor(Color.gray)
                .background(Color.white)
                .overlay{
                    TimeArc(trackedTime: trackedTime, timeGoal: trackingGoal)
                        .rotation(Angle(degrees: -90)) // To make it start from the top
                        .stroke(Color.orange,
                                style:StrokeStyle(lineWidth: 10,lineCap: .round))
                        .cornerRadius(25)
                }
                .padding()
            
            Spacer()
            
            
            
            Button(action: isTimerOn ? stopTimer : startTimer, label: {
                HStack{
                    Image(systemName: isTimerOn ? "pause.fill": "play.fill")
                        .font(.title)
                    Text(isTimerOn ? "stop": "start")
                        .font(.title)
                }
                .foregroundColor(Color.white)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(6)
                .shadow(color: Color.black.opacity(0.1), radius: 5,x: 1,y: 1)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
        }
        .frame(width: 310)
        .padding()
        .background(Color.white)
        .onAppear{
            timer = CustomTimer(update: updateTrackedTimer)
        }
    }
        
    
}


#Preview {
    ContentView()
}

