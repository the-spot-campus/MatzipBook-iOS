//
//  HomeSectionLayoutProvider.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

enum HomeLayout {
    static let voteSectionLayout: NSCollectionLayoutSection = VoteSectionLayout().layout()
    static let defaultSectionLayout: NSCollectionLayoutSection = DefaultSectionLayout().layout()
}

final class HomeSectionLayoutProvider: HomeSectionLayoutProviding {
    
    func layout(for section: HomeSectionType) -> NSCollectionLayoutSection {
        switch section {
        case .vote: return HomeLayout.voteSectionLayout
        default: return HomeLayout.defaultSectionLayout
        }
    }
}
