//
//  WebViewViewController.swift
//  MyWebKitView
//
//  Created by ACT on 11/10/21.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    private let webview: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webview = WKWebView(frame: .zero, configuration: configuration)
        return webview
        
    }()
    
    private let url: URL
    
    init(url: URL, title: String) {
        self.url = url
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webview)
        webview.load(URLRequest(url: url))
        configureButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webview.frame = view.bounds
    }
    
    private func configureButtons() {
                                                           
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self,
            action:
            #selector(didTapRefresh))
                                                           
    }
                                                           
    @objc private func didTapRefresh() {
        webview.load(URLRequest(url: url))
        
    }
}
