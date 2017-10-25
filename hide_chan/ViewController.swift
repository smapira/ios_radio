//
//  ViewController.swift
//  hide_chan
//
//  Created by bookair17 on 10/25/17.
//  Copyright © 2017 routeflags. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

	var label: UILabel?

	// todo background image
	// button event
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 122/255, alpha: 1)
		
		let playerViewController = AVPlayerViewController()
		self.view.addSubview(playerViewController.view)
				playerViewController.view.frame = self.view.frame
		playerViewController.view.isHidden = true
		let radioURL = URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1721052")
		let radioURL2 = URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1709502")

		
		
		
		let firstAsset = AVURLAsset(url: radioURL!)
		let firstPlayerItem = AVPlayerItem(asset: firstAsset)
		
		let player = AVPlayer(playerItem: firstPlayerItem)
		
		let secondAsset = AVURLAsset(url: radioURL2!)
		let secondPlayerItem = AVPlayerItem(asset: secondAsset)
		
		player.replaceCurrentItem(with: secondPlayerItem)
		
		
		
		
//		let player = AVPlayer(url: radioURL!)
		playerViewController.player = player
		playerViewController.view.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 122/255, alpha: 0)
//		
//		do {
//			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//			print("AVAudioSession Category Playback OK")
//			do {
//				try AVAudioSession.sharedInstance().setActive(true)
//				print("AVAudioSession is Active")
//			} catch let error as NSError {
//				print(error.localizedDescription)
//			}
//		} catch let error as NSError {
//			print(error.localizedDescription)
//		}
		player.play()
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

