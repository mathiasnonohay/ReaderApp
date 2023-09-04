//
//  PDFViewController.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 30/08/2023.
//

import UIKit
import WebKit
import PDFKit

class PDFViewController: UIViewController, UINavigationControllerDelegate {
    
    private var pdfFilePath: String = ""
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    lazy var pdfView: PDFView = {
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .horizontal
        pdfView.minScaleFactor = pdfView.scaleFactor
        pdfView.maxScaleFactor = pdfView.scaleFactorForSizeToFit
        pdfView.usePageViewController(true)
        return pdfView
    }()
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.pdfView.autoScales = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfView)
        self.view.addSubview(webView)
        PDFHelper.generatePDFFromHtml(webView: self.webView)
        
        NSLayoutConstraint.activate([
            
            pdfView.topAnchor.constraint(equalTo: self.view.topAnchor),
            pdfView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pdfView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            pdfView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        webView.navigationDelegate = self
    }
    
    func previewPDF() {
        if let pdfURL = URL(string: self.pdfFilePath),
           let document = PDFDocument(url: pdfURL) {
            pdfView.document = document
        }
        
    }
    
}

extension PDFViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.pdfFilePath = PDFHelper.generatePDFAndSaveToDisk(formatter: webView.viewPrintFormatter()) ?? ""
            self.previewPDF()
        })
    }
    
}
