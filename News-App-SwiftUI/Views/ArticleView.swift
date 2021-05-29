//
//  ArticleView.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI

struct ArticleView: View {
    @State var article: Article
    @State var showWebView = false
    
    var body: some View {
        
        Button(action: {self.showWebView = true}) {
            VStack(alignment: .leading, spacing: 24) {
                HStack(alignment: .top, spacing: 16) {
                    ImageView(imageURL: self.article.image ?? "")
                        .frame(width: 128, height: 96)
                        .background(Color(UIColor.systemFill))
                        .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.article.title)
                            .font(.system(.headline, design: .serif))
                        Text(self.article.source)
                            .font(.callout)
                            .lineLimit(1)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: self.$showWebView) {
            WebView(url: URL(string: self.article.url)!)
                .edgesIgnoringSafeArea(.all)
        }
        
    }
}
