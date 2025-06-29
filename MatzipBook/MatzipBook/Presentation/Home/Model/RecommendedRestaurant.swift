//
//  Recommendation.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

enum RecommendationSectionType {
    case personalRecommendation, hiddenGem
}

struct RecommendedRestaurant {
    let sectionType: RecommendationSectionType
    let image: UIImage?
    var rating: Double
    let name: String
    var description: String
    let foodCategory: String
    let themeCategory: String
}
