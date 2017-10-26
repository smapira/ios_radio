//
//  ViewController.swift
//  hide_chan
//
//  Created by KatsuyaEndoh on 2017/10/25.
//  Copyright © 2017年 KatsuyaEndoh. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SwiftGifOrigin

class ViewController: UIViewController {

	
	var tuner = 0
	let stations = [
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=492072"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1075005"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1476226"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1308805"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1709502"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1566708"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1354328"),
		URL(string: "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1762369")
	]
	var player: AVPlayer?
	func adjust_tuner() -> Int{
		print(tuner)
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
		if self.player == nil{
			do {
				try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
				try AVAudioSession.sharedInstance().setActive(true)
				self.player = AVPlayer(playerItem: AVPlayerItem(asset: nextAsset))
				self.player?.play()
				
			} catch let error as NSError {
				print("Error: \(error.localizedDescription)")
			}
		}
		self.player?.replaceCurrentItem(with: AVPlayerItem(asset: nextAsset))

	}
	
	func prevButtonAction(sender: UIButton!) {
		tuner -= 1
		let nextAsset = AVURLAsset(url: stations[adjust_tuner()]!)
		if self.player == nil{
			do {
				try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
				try AVAudioSession.sharedInstance().setActive(true)
				self.player = AVPlayer(playerItem: AVPlayerItem(asset: nextAsset))
				self.player?.play()
				
			} catch let error as NSError {
				print("Error: \(error.localizedDescription)")
			}
		}
		self.player?.replaceCurrentItem(with: AVPlayerItem(asset: nextAsset))
	}
	
	func centerButtonAction(sender: UIButton!) {
		self.player?.pause()
		self.player = nil
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
		
		let centerButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 3, height: self.view.frame.height / 3))
		centerButton.center = self.view.center
		centerButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 122/255, alpha: 0)
		centerButton.addTarget(self, action: #selector(centerButtonAction), for: .touchUpInside)
		self.view.addSubview(centerButton)
	}
	
	func generateBackground(){
		let gifImage = UIImage.gif(name: "377158fca2b73b083fd0aa4a4f703930")
		let imageView = UIImageView(image: gifImage)
		let rect:CGRect = CGRect(x:0, y:0, width:imageView.frame.width, height:imageView.frame.height)
		imageView.frame = rect;
		imageView.center = self.view.center
		self.view.addSubview(imageView)
		self.view.backgroundColor = .black
		
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
		label.center = CGPoint(
			x: self.view.frame.width - 110,
			y: self.view.frame.height - 15
		)
		label.textColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
		label.textAlignment = .right
		label.font = label.font.withSize(13)
		label.text = "Imaged by abduzeedo.com"
		self.view.addSubview(label)
		
	}
	
	func generatePlayer(){
		let playerViewController = AVPlayerViewController()
		self.view.addSubview(playerViewController.view)
		playerViewController.view.frame = self.view.frame
		playerViewController.view.isHidden = true
		let firstAsset = AVURLAsset(url: stations[tuner]!)
		let firstPlayerItem = AVPlayerItem(asset: firstAsset)
		playerViewController.player = self.player
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
			try AVAudioSession.sharedInstance().setActive(true)
			self.player = AVPlayer(playerItem: firstPlayerItem)
			self.player?.play()

		} catch let error as NSError {
			print("Error: \(error.localizedDescription)")
		}
		
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

