//
//  HomeLayoutFactory.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

final class HomeLayoutFactory: HomeSectionLayoutFactory {
    
    func layout(for section: HomeSection) -> NSCollectionLayoutSection {
        switch section {
        case .vote: VoteSectionLayout().layout()
        default: DefaultSectionLayout().layout()
        }
    }
}
