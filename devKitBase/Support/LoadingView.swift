//
//  LoadingView.swift
//  chargeup
//
//  Created by Megat Syafiq on 14/08/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit

class LoadingView{
    
    static var indicator = UIActivityIndicatorView(style: .whiteLarge)
    static var overlay = UIView()
    
    static func addLoading(for viewController: UIViewController){
        if let view = viewController.view, let window = UIApplication.shared.keyWindow {
            // this will be the alignment view for the activity indicator
            var superView: UIView = view
            
            overlay.frame = CGRect(x: 0.0, y: 0.0, width: window.frame.width, height: window.frame.height)
            overlay.layer.backgroundColor = UIColor.black.cgColor
            overlay.alpha = 0.5
            
            overlay.center = window.center
            overlay.isHidden = false
            window.addSubview(overlay)
            window.bringSubviewToFront(overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
            
            indicator.center = superView.center
            indicator.isHidden = false
            indicator.startAnimating()
            
            superView.addSubview(indicator)
            superView.bringSubviewToFront(indicator)
            
            // also indicate network activity in the status bar
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    static func startLoading(for viewController: UIViewController) {
        addLoading(for: viewController)
    }
    
    static func stopLoading() {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
        overlay.removeFromSuperview()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
