//
//  RecommendationCellViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

final class RecommendationCellViewModel {
    
    private let recommendation: RecommendedRestaurant
    
    init(recommendation: RecommendedRestaurant) {
        self.recommendation = recommendation
    }
    
    var restaurantImage: UIImage? { recommendation.image }
    var restaurantRating: Double { recommendation.rating }
    var restaurantName: String { recommendation.name }
    var restaurantDescription: String { recommendation.description }
    var foodCategory: String { recommendation.foodCategory }
    var themeCategory: String { recommendation.themeCategory }
}
