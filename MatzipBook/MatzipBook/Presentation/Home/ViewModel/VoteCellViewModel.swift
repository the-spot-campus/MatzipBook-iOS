//
//  VoteCellViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/29/25.
//

import UIKit

final class VoteCellViewModel {
    
    private let vote: Vote
    
    init(vote: Vote) {
        self.vote = vote
    }
    
    var leftRestaurantName: String { vote.leftRestaurant.name }
    var leftRestaurantImage: UIImage? {
        vote.leftRestaurant.thumbnail ?? .imgDummy0
    }
    var rightRestaurantName: String { vote.rightRestaurant.name }
    var rightRestaurantImage: UIImage? {
        vote.rightRestaurant.thumbnail ?? .imgDummy1
    }
    var remainingTime: Int { vote.remainingTime }
}
