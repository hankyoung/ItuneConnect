//
//  ItuneData.swift
//  ItuneConnect
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 knb. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItuneData {
    let resultCount: Int
    let results: [Result]

    init(_ json: JSON) {
        self.resultCount = json["resultCount"].intValue
        self.results = json["results"].arrayValue.map { Result($0) }
    }
}

// MARK: - Result
class Result {
    let artistName: String
    let trackName: String
    let trackViewURL: String
    let previewURL: String
    let artworkUrl100: String
    let trackPrice: Double
    let releaseDate: String
    let country: String
    let currency: String
    let primaryGenreName: String

    init(_ json: JSON) {
        self.artistName = json["artistName"].stringValue
        self.trackName = json["trackName"].stringValue
        self.trackViewURL = json["trackViewUrl"].stringValue
        self.previewURL = json["previewUrl"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].stringValue
        self.trackPrice = json["trackPrice"].doubleValue
        self.releaseDate = json["releaseDate"].stringValue
        self.country = json["country"].stringValue
        self.currency = json["currency"].stringValue
        self.primaryGenreName = json["primaryGenreName"].stringValue
    }
}
