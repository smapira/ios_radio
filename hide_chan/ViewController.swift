//
//  ViewController.swift
//  hide_chan
//
//  Created by bookair17 on 10/25/17.
//  Copyright © 2017 routeflags. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var label: UILabel?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		

		label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
		label?.center = CGPoint(
			x: self.view.frame.width  / 2,
			y: self.view.frame.height / 2
		)
		label?.textAlignment = .center
		label?.text = "Hello, World."
		
		self.view.addSubview(label!)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

