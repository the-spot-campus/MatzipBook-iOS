//
//  PersonalRecommendationCellViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

final class PersonalRecommendationCellViewModel {
    
    private let personalRecommendation: RecommendedRestaurant
    
    init(personalRecommendation: RecommendedRestaurant) {
        self.personalRecommendation = personalRecommendation
    }
    
    var restaurantImage: UIImage? { personalRecommendation.image }
    var restaurantRating: Double { personalRecommendation.rating }
    var restaurantName: String { personalRecommendation.name }
    var restaurantDescription: String { personalRecommendation.description }
    var foodCategory: String { personalRecommendation.foodCategory }
    var themeCategory: String { personalRecommendation.themeCategory }
}
