//
//  ContentView.swift
//  TransparentVideoPlayer
//
//  Created by Om Chachad on 02/01/26.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var player = AVPlayer(
        url: Bundle.main.url(forResource: "AirPodsPro", withExtension: "mov")!
    )
    
    var body: some View {
        VStack {
            TransparentVideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
