//
//  Article.swift
//  News-App-SwiftUI
//
//  Created by Anselm Jade Jamig on 5/29/21.
//

import SwiftUI

struct Article: Codable, Hashable {
    var title: String
    var url: String
    var image: String?
    var source: String
}

