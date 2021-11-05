//
//  ActivityIndicator.swift
//  Qpony_zadanie
//
//  Created by Kacper Kita on 05/11/2021.
//

import Foundation
import UIKit

fileprivate var activityView: UIView?

extension UIViewController {
    
    func startActivityIndicator() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = .lightGray
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = activityView?.center ?? CGPoint(x: 0, y: 0)
        activityIndicator.startAnimating()
        activityView?.addSubview(activityIndicator)
        
        guard let activity = activityView else {return}
        
        self.view.addSubview(activity)
    }
    
    func stopActivityIndicator() {
        activityView?.removeFromSuperview()
        activityView = nil
    }
}
