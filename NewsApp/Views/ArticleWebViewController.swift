//
//  ArticleWebViewController.swift
//  NewsApp
//
//  Created by Misha on 08.09.2021.
//

import WebKit

class ArticleWebViewController: UIViewController {
    var urlString: String = ""
    let webView = WKWebView()
    
    override func viewDidLoad() {
        webView.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
       // webView.delegate = self
        self.view.addSubview(webView)
    }
}
