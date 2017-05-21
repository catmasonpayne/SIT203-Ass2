//
//  SegueFromLeft.swift
//  BookCase DataBase 2
//
//  Created by Cat Mason-Payne on 20/05/2017.
//  Copyright © 2017 Deakin. All rights reserved.
// This broke :(


// REFERENCE:
// http://stackoverflow.com/questions/40216462/custom-slide-segue-xcode-8-0-swift-3-0


import UIKit

class SegueFromLeft: UIStoryboardSegue {
    
    override func perform(){
        
        let slideView = destination.view
        
        source.view.addSubview(slideView!)
        slideView?.transform = CGAffineTransform(translationX: source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: {
                        slideView?.transform = CGAffineTransform.identity
        }, completion: { finished in
            
            self.source.present(self.destination, animated: false, completion: nil)
            slideView?.removeFromSuperview()
        })
    }
}
