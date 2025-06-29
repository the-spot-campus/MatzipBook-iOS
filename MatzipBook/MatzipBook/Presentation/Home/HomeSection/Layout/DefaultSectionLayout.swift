//
//  DefaultSectionLayout.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

final class DefaultSectionLayout: SectionLayoutProviding {
    
    func layout() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)
        )
        let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: itemSize,
            subitems: [item]
        )
        
        let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 20,
            bottom: 20,
            trailing: 20
        )
        section.boundarySupplementaryItems = [
            HomeHeaderLayout.create(),
            HomeFooterLayout.create()
        ]
        
        return section
    }
}
