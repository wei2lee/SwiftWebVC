//
//  SwiftModalWebVC.swift
//
//  Created by Myles Ringle on 24/06/2015.
//  Transcribed from code used in SVWebViewController.
//  Copyright (c) 2015 Myles Ringle & Oliver Letterer. All rights reserved.
//

import UIKit

public class SwiftModalWebVC: UINavigationController {
    
    public enum SwiftModalWebVCTheme {
        case lightBlue, lightBlack, dark
    }
    public enum SwiftModalWebVCDismissButtonStyle {
        case arrow, cross
    }
    
    weak var webViewDelegate: UIWebViewDelegate? = nil
    
    public convenience init(urlString: String) {
        self.init(pageURL: URL(string: urlString)!)
    }
    
    public convenience init(urlString: String, theme: SwiftModalWebVCTheme, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle) {
        self.init(pageURL: URL(string: urlString)!, theme: theme, dismissButtonStyle: dismissButtonStyle)
    }
    
    public convenience init(pageURL: URL) {
        self.init(request: URLRequest(url: pageURL))
    }
    
    public convenience init(pageURL: URL, theme: SwiftModalWebVCTheme, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle) {
        self.init(request: URLRequest(url: pageURL), theme: theme, dismissButtonStyle: dismissButtonStyle)
    }
    
    public init(request: URLRequest, theme: SwiftModalWebVCTheme = .dark, dismissButtonStyle: SwiftModalWebVCDismissButtonStyle = .arrow) {
        let webViewController = SwiftWebVC(aRequest: request)
        webViewController.storedStatusColor = UINavigationBar.appearance().barStyle
        
        let doneButton = UIBarButtonItem(title: "\u{2190} MY AIA", style: UIBarButtonItemStyle.plain,target: webViewController, action: #selector(SwiftWebVC.doneButtonTapped))
        
        switch theme {
        case .lightBlue:
            doneButton.tintColor = nil
            webViewController.buttonColor = nil
            webViewController.titleColor = UIColor.black
            UINavigationBar.appearance().barStyle = UIBarStyle.default
        case .lightBlack:
            doneButton.tintColor = UIColor.darkGray
            webViewController.buttonColor = UIColor.darkGray
            webViewController.titleColor = UIColor.black
            UINavigationBar.appearance().barStyle = UIBarStyle.default
        case .dark:
            doneButton.tintColor = UIColor.white
            webViewController.buttonColor = UIColor.white
            webViewController.titleColor = UIColor.groupTableViewBackground
            UINavigationBar.appearance().barStyle = UIBarStyle.blackOpaque
        }
        
        webViewController.navigationItem.leftBarButtonItem = doneButton
        super.init(rootViewController: webViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
}
