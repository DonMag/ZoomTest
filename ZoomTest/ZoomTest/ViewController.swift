//
//  ViewController.swift
//  ZoomTest
//
//  Created by Don Mag on 1/6/20.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet var theScrollView: UIScrollView!
	
	let imgView: UIImageView = {
		let v = UIImageView()
		v.translatesAutoresizingMaskIntoConstraints = false
		return v
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let img = UIImage(named: "pic256x256") {
			imgView.image = img
			theScrollView.addSubview(imgView)
			let g = theScrollView.contentLayoutGuide
			NSLayoutConstraint.activate([
				imgView.widthAnchor.constraint(equalToConstant: 256.0),
				imgView.heightAnchor.constraint(equalToConstant: 256.0),
				imgView.topAnchor.constraint(equalTo: g.topAnchor, constant: 0.0),
				imgView.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: 0.0),
				imgView.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 0.0),
				imgView.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: 0.0),
			])
		}
		
		theScrollView.delegate = self
		theScrollView.minimumZoomScale = 0.5
		theScrollView.maximumZoomScale = 5.0
		
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imgView
	}
	
}

