//
//  Helper.swift
//  ZeptoCust
//
//  Created by Megat Syafiq on 08/10/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import Foundation
import UIKit
import Material
import Reachability
import MessageUI

public class Helper {
    
   
    static let helper = Helper()
    let reachbility = Reachability()!

    public func checkConnection() {
        
        DispatchQueue.main.async {
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(note:)), name: .reachabilityChanged, object: self.reachbility)
            do{
                try self.reachbility.startNotifier()
            }catch{
                print("could not start reachability notifier")
            }
        }
    }
    
    public func navigationConfig(title: String, vc: UIViewController) {
        vc.navigationItem.title = title
        vc.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    public func webPrompt(urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    public func sendEmail(subject: String, messageBody: String, recipients: [String], viewcontroller: UIViewController ) {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = viewcontroller as? MFMailComposeViewControllerDelegate
        mail.setSubject(subject)
        mail.setMessageBody(messageBody, isHTML: true)
        mail.setToRecipients(recipients)
        viewcontroller.present(mail, animated: true, completion: nil)
    }
    
    public func callPhone(phoneNumber: String) {
        let url: NSURL = URL(string: "TEL://\(phoneNumber)")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            // Helper.helper.switchToViewController(Navigation: "mainVC")
            print("Reachable via WiFi")
        case .cellular:
            // Helper.helper.switchToViewController(Navigation: "mainVC")
            print("Reachable via Cellular")
        case .none:
        
//            Helper.helper.switchToViewController(Navigation: "noWifi")
            print("Network not reachable")
        }
    }
    
//    func switchToNavigationViewController(Navigation : String ) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let naviVC = storyboard.instantiateViewController(withIdentifier: Navigation) as! UINavigationController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = naviVC
//
//    }
//
//    func switchToTabViewController(Navigation : String ) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let naviVC = storyboard.instantiateViewController(withIdentifier: Navigation) as! UITabBarController
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = naviVC
//
//    }
//
//    func switchToViewController(Navigation : String ) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let naviVC = storyboard.instantiateViewController(withIdentifier: Navigation)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = naviVC
//
//    }
    
    public func shadowButton(globeButton : UIButton) {
        globeButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        globeButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        globeButton.layer.shadowOpacity = 1.0
        globeButton.layer.shadowRadius = 0.0
        globeButton.layer.masksToBounds = false
        globeButton.layer.cornerRadius = 5.0
    }
    
    public func iconTextField (textField : UITextField, imageName : String) {
        
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: imageName)
        
        let leftView = UIView()
        leftView.addSubview(leftImageView)
        
        leftView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        leftImageView.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        textField.leftViewMode = .always
        textField.leftView = leftView
        
        //add border bottom
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
    }
    
}
