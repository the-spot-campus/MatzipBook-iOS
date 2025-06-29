//
//  HomeSectionType.swift
//  MatzipBook
//
//  Created by 심범수 on 6/18/25.
//

import UIKit

enum HomeSectionType: Int {
    case vote, nearbyRanking, personalRecommendation, hiddenGem
}

extension HomeSectionType {
    
    func sectionLayout() -> NSCollectionLayoutSection {
        switch self {
        case .vote: return HomeLayout.voteSectionLayout
        default: return HomeLayout.defaultSectionLayout
        }
    }
}
