//
//  ViewController.swift
//  MobiddictionLottieTutorial
//
//  Created by soroush safari on 2/3/17.
//  Copyright © 2017 soroush safari. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let animationView = LOTAnimationView.animationNamed("MD Logo Animation")
    
    let stringArray = ["soroush safari", "developer : soroush", "instagram.com/galssofcode", "animation swift", "soroush safari"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 667)
        animationView?.contentMode = .scaleAspectFill
        
        animationView?.loopAnimation = true
        
        self.view.addSubview(animationView!)
        
        setupScrollView()
        
    }
    
    func handlePan (recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let progress = translation.x / self.view.bounds.size.width
        
        animationView?.animationProgress = progress
    }
    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 5, height: scrollView.frame.size.height)
        
        for i in 0 ... 4 {
            let label = UILabel(frame: CGRect(x: scrollView.center.x + CGFloat(i) * self.view.frame.size.width - 130, y: 50, width: 260, height: 30))
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
            label.textAlignment = .center
            label.text = stringArray[i]
            
            scrollView.addSubview(label)
        }
        
        self.view.bringSubview(toFront: scrollView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView?.animationProgress = progress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

