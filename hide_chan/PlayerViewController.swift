//
//  AVPlayerViewController.swift
//  hide_chan
//
//  Created by bookair17 on 10/25/17.
//  Copyright © 2017 routeflags. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: AVPlayerViewController {
	
	var radioURL: URL?

	override func viewDidLoad() {
		super.viewDidLoad()
//        let url = URL(fileURLWithPath: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
////        let url = URL(fileURLWithPath: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1721052")
//        let assets = AVAsset.init(url: url)
//        let playerItem = AVPlayerItem.init(asset: assets)
//        let player = AVPlayer(playerItem: playerItem)
//        self.player = player
//        self.player?.play()
        
        radioURL = URL(string: "https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8")
        let player = AVPlayer(url: radioURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
 
}
