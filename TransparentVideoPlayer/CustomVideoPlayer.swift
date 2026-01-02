//
//  CustomVideoPlayer.swift
//  TransparentVideoPlayer
//
//  Created by Om Chachad on 02/01/26.
//

import SwiftUI
import AVKit

final class TransparentPlayerView: NSView {
    override var wantsUpdateLayer: Bool { true }

    private let playerLayer = AVPlayerLayer()

    init(player: AVPlayer) {
        super.init(frame: .zero)
        wantsLayer = true

        playerLayer.player = player
        playerLayer.backgroundColor = NSColor.clear.cgColor
        playerLayer.isOpaque = false
        playerLayer.videoGravity = .resizeAspect

        layer?.addSublayer(playerLayer)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func layout() {
        super.layout()
        playerLayer.frame = bounds
    }
}

struct TransparentVideoPlayer: NSViewRepresentable {
    let player: AVPlayer

    func makeNSView(context: Context) -> TransparentPlayerView {
        TransparentPlayerView(player: player)
    }

    func updateNSView(_ nsView: TransparentPlayerView, context: Context) {}
}

