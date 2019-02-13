//
//  Alert.swift
//  chargeup
//
//  Created by Megat Syafiq on 14/08/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    static func showDefaultAlert(for viewController: UIViewController, title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
  
        
        //to change font of title and message.
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "Avenir-Heavy", size: 15.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 12.0)!]
        if title != nil {
                    let titleAttrString = NSMutableAttributedString(string: title!, attributes: titleFont)
                    alert.setValue(titleAttrString, forKey: "attributedTitle")
        }
        
        if message != nil {
                    let messageAttrString = NSMutableAttributedString(string: message!, attributes: messageFont)
                    alert.setValue(messageAttrString, forKey: "attributedMessage")
        }

        alert.view.tintColor = UIColor.red
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
