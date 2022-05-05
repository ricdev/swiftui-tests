//
//  TimerView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import Combine
import SwiftUI

struct TimerView: View {
    @State var secondsElapsed = 0
    @State var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State var connectedTimer: Cancellable?

    var body: some View {
        VStack {
            Text("\(self.secondsElapsed) seconds elapsed")
            Button("Stop Timer", action: {
                self.cancelTimer()
            })
            Button("Continue Timer", action: {
                self.instantiateTimer()
            })
            Button("Restart Timer", action: {
                self.restartTimer()
            })
        }.onAppear {
            self.instantiateTimer()
        }.onDisappear {
            self.cancelTimer()
        }.onReceive(self.timer) { _ in
            self.secondsElapsed += 1
            print("time: \(self.secondsElapsed)")
        }
    }

    func instantiateTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
        connectedTimer = timer.connect()
    }

    func cancelTimer() {
        connectedTimer?.cancel()
    }

    func resetCounter() {
        secondsElapsed = 0
    }

    func restartTimer() {
        secondsElapsed = 0
        cancelTimer()
        instantiateTimer()
    }
}
