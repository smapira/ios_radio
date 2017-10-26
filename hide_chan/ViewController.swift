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
import SwiftGifOrigin

class ViewController: UIViewController {

	var tuner = 0
	let stations = [
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1075005"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=492072"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=709809"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1476226"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1308805"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1709502"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1566708"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1354328"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1762369"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1202496"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1267299"),
	]
	var player: AVPlayer?
	
	func adjust_tuner() -> Int{
		if tuner >= stations.count {
			tuner = 0
		}else if tuner < 0 {
			tuner = stations.count - 1
		}
		return tuner
	}
	
	func nextButtonAction(sender: UIButton!) {
		tuner += 1
		let nextAsset = AVURLAsset(url: stations[adjust_tuner()]!)
		self.player?.replaceCurrentItem(with: AVPlayerItem(asset: nextAsset))

	}
	
	func prevButtonAction(sender: UIButton!) {
		tuner -= 1
		let nextAsset = AVURLAsset(url: stations[adjust_tuner()]!)
		self.player?.replaceCurrentItem(with: AVPlayerItem(asset: nextAsset))
	}
	
	func generateButtons(){
		let nextButton = UIButton(frame: CGRect(x: self.view.frame.width / 2, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height))
		nextButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 122/255, alpha: 0)
		nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
		self.view.addSubview(nextButton)
		
		let prevButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height))
		prevButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 122/255, alpha: 0)
		prevButton.addTarget(self, action: #selector(prevButtonAction), for: .touchUpInside)
		self.view.addSubview(prevButton)
	}
	
	func generateBackground(){
		let gifImage = UIImage.gif(name: "1f815c749d9cbb566ea34c2c6a5f161f")
		let imageView = UIImageView(image: gifImage)
		
		let rect:CGRect = CGRect(x:0, y:0, width:imageView.frame.width * 0.75, height:imageView.frame.height * 0.75)
		imageView.frame = rect;
		imageView.center = self.view.center
		self.view.addSubview(imageView)
		self.view.backgroundColor = .black
	}
	
	func generatePlayer(){
		let playerViewController = AVPlayerViewController()
		self.view.addSubview(playerViewController.view)
		playerViewController.view.frame = self.view.frame
		playerViewController.view.isHidden = true
		let firstAsset = AVURLAsset(url: stations[tuner]!)
		let firstPlayerItem = AVPlayerItem(asset: firstAsset)
		self.player = AVPlayer(playerItem: firstPlayerItem)
		playerViewController.player = self.player
		self.player?.play()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		generateButtons()
		generateBackground()
		generatePlayer()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}

