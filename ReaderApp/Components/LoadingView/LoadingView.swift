//
//  LoadingView.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 04/09/2023.
//

import UIKit

class LoadingView {
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    public func showLoading(_ view: UIView) {
        overlayView.frame = view.bounds // Set X and Y whatever you want
        overlayView.backgroundColor = .white
        
        activityIndicator.center = view.center
        
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
