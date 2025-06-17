//
//  HomeSection.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import Foundation

enum HomeSection: Int, CaseIterable {
    case vote, nearbyRanking, recommendation, hiddenGem
    
    var headerTitle: String? {
        switch self {
        case .vote: return nil
        case .nearbyRanking: return "주변 맛집 랭킹"
        case .recommendation: return "범수님 취향 추천"
        case .hiddenGem: return "19학번이 추천하는 숨은 찐 맛집"
        }
    }
    
    var footerButtonTitle: String? {
        switch self {
        case .vote: return nil
        case .nearbyRanking: return "주변 맛집 전체보기"
        case .recommendation: return "취향 추천 전체보기"
        case .hiddenGem: return "찐 맛집 전체보기"
        }
    }
    
    var numberOfItems: Int {
        return 1
    }
    
    var hasSupplementaryViews: Bool {
        return self != .vote
    }
}

extension HomeSection {
    
    var cellIdentifier: String {
        switch self {
        case .vote: return VoteCollectionViewCell.identifier
        case .nearbyRanking: return NearbyRankingCollectionViewCell.identifier
        case .recommendation: return RecommendationCollectionViewCell.identifier
        case .hiddenGem: return HiddenGemCollectionViewCell.identifier
        }
    }
}
