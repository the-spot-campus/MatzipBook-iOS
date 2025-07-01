//
//  HiddenGemCellViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

final class HiddenGemCellViewModel {
    
    private let hiddenGem: RecommendedRestaurant
    
    init(hiddenGem: RecommendedRestaurant) {
        self.hiddenGem = hiddenGem
    }
    
    var restaurantImage: UIImage? { hiddenGem.image }
    var restaurantRating: Double { hiddenGem.rating }
    var restaurantName: String { hiddenGem.name }
    var restaurantDescription: String { hiddenGem.description }
    var foodCategory: String { hiddenGem.foodCategory }
    var themeCategory: String { hiddenGem.themeCategory }
}
