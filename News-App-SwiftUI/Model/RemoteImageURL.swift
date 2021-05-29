//
//  RemoteImageURL.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI

class RemoteImageURL: ObservableObject {
    @Published var data = Data()
    
    // load our image URL
    init(imageURL: String) {
        guard let url = URL(string: imageURL.replacingOccurrences(of: "http://", with: "https://")) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let _ = response {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
        .resume()
    }
}

