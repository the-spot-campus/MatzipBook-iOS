//
//  NearbyRanking.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

struct NearbyRanking {
    var ranking: Int
    let name: String
    let image: UIImage?
    var rating: Double
    var distance: Double
    let foodCategory: String
    let themeCategory: String
    
    var starCount: Int {
        return Int(round(rating))
    }
}
