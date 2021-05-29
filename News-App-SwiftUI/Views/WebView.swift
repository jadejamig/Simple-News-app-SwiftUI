//
//  WebView.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    // to display an article's website
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        let webview = SFSafariViewController(url: url)
        return webview
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {
        // nothing to do
    }
}
