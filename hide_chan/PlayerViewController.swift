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
		let playerViewController = AVPlayerViewController()
		self.view.addSubview(playerViewController.view)
		playerViewController.view.frame = self.view.frame
		let radioURL = URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1721052")
		let player = AVPlayer(url: radioURL!)
		playerViewController.player = player
		player.play()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
 
}
