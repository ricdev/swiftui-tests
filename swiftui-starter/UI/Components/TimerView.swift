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
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
        self.connectedTimer = self.timer.connect()
        return
    }

    func cancelTimer() {
        self.connectedTimer?.cancel()
        return
    }

    func resetCounter() {
        self.secondsElapsed = 0
        return
    }

    func restartTimer() {
        self.secondsElapsed = 0
        self.cancelTimer()
        self.instantiateTimer()
        return
    }
}
