//
//  BodyWebViewController.swift
//  VajroCodeTask_Jeyanthinathan
//
//  Created by AMBINO4526 on 06/08/22.
//

import Foundation
import UIKit
import WebKit

class BodyWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var htmlContent: String?
    
    override func viewDidLoad() {
        setupWebView()
    }
    
    private func setupWebView() {
        webView.uiDelegate = self
        webView.allowsLinkPreview = false
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        if let content = htmlContent,
           !content.isEmpty {
            webView.loadHTMLString(content, baseURL: Bundle.main.bundleURL)
        }
    }
}

extension BodyWebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
}
