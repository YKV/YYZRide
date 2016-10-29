//
//  WebVC.swift
//  YYZRide
//
//  Created by Yevhen Kim on 2016-10-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController, UIWebViewDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var webVC: UIWebView!
    
    let url = URL(string: "http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=83f6e69ae554e410VgnVCM10000071d60f89RCRD&camera=true")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webVC.delegate = self
        loadURL(url: url!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webVC.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        webVC.stopLoading()
        webVC.delegate = nil
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func loadURL(url: URL) {
        let request = URLRequest(url: url)
        webVC.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    @IBAction func backToMapPressed(_ sender: UIBarButtonItem) {
        let vc: MapVC! = self.storyboard?.instantiateViewController(withIdentifier: "MapID") as! MapVC
        _ = self.navigationController?.popToViewController(vc, animated: true)
        
    }
}
