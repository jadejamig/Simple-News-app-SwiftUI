//
//  ContentView.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI
import SafariServices

private let apiURL = "https://api.lil.software/news"

struct News: Codable {
    var articles: [Article]
}

struct ContentView: View {
    @State var articles: [Article] = []
    @State var loading = true
    
    var body: some View {
        NavigationView {
            VStack {
                if self.loading {
                    ProgressView()
                } else {
                    List {
                        ForEach(self.articles, id: \.self) { article in
                            ArticleView(article: article)
                        }
                    }
                    .navigationTitle("News")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            self.loadNews()
        }
    }
    
    func loadNews() {
        // create the API url (ex: https://api.lil.software/news)
        let request = URLRequest(url: URL(string: apiURL)!)
        
        // Initiate the API request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                // Decode the response into our News struct
                if let decodedResponse = try? JSONDecoder().decode(News.self, from: data) {
                    DispatchQueue.main.async {
                        // set the articles based on the API request
                        self.articles = decodedResponse.articles
                        // no longer loading
                        self.loading = false
                    }
                    
                    return
                }
            }
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
