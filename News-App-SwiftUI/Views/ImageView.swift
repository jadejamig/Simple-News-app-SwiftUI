//
//  ImageView.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    
    init(imageURL: String) {
        self.remoteImageURL = RemoteImageURL(imageURL: imageURL)
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: self.remoteImageURL.data) ?? UIImage())
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
    }
    
}

