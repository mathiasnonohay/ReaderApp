//
//  PDFHelper.swift
//  ReaderApp
//
//  Created by Mathias Nonohay on 30/08/2023.
//

import Foundation
import WebKit
import PDFKit

class PDFHelper {
    
    static func generatePDFFromHtml(webView: WKWebView) {
        let path = Bundle.main.path(forResource: "mockHtml", ofType: "html")
        let url = URL(filePath: path!)
        webView.load(URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData))
    }
    
    static func generatePDFAndSaveToDisk(formatter: UIViewPrintFormatter) -> String? {
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(formatter, startingAtPageAt: 0)
        
        let page = CGRect(x: 20, y: 20, width: 580, height: 760)
        let printable = page.insetBy(dx: 0, dy: 0)
        
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
        
        for i in 1...render.numberOfPages {
            UIGraphicsBeginPDFPage()
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext()
        return self.saveToDisk(pdfData: pdfData) ?? nil
    }
    
    static func saveToDisk(pdfData: NSMutableData) -> String? {
        let fileManager = FileManager.default
        let documentFolder = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        guard let folderURL = documentFolder?.appending(path: "PDF") else { return nil }
        let folderExists = try? folderURL.checkResourceIsReachable()
        do {
            if folderExists != true {
                try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: false)
            }
            
            let fileURL = folderURL.appending(path: "Sample.pdf")
            pdfData.write(to: fileURL, atomically: true)
            return fileURL.absoluteString
        } catch {
            print(error)
            return nil
        }
    }
    
}
