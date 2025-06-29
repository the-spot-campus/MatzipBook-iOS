//
//  NearbyRankingCellViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

final class NearbyRankingCellViewModel {
    
    private let nearbyRanking: NearbyRanking
    
    init(nearbyRanking: NearbyRanking) {
        self.nearbyRanking = nearbyRanking
    }
    
    var ranking: Int { nearbyRanking.ranking }
    var restaurantName: String { nearbyRanking.name }
    var restaurantImage: UIImage? { nearbyRanking.image }
    var rating: Double { nearbyRanking.rating }
    var starCount: Int { nearbyRanking.starCount }
    var formattedDistance: String {
        if nearbyRanking.distance < 1.0 {
            let meters: Int = Int(nearbyRanking.distance * 1000)
            return "\(meters)m"
        } else {
            return String(format: "%.1fkm", nearbyRanking.distance)
        }
    }
    
    var foodCategory: String { nearbyRanking.foodCategory }
    var themeCategory: String { nearbyRanking.themeCategory }
}
