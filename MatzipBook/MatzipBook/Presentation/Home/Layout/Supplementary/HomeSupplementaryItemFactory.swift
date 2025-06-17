//
//  HomeSupplementaryItemFactory.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

enum HeaderSupplementaryItemFactory {
    static func create() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(50)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
}

enum FooterSupplementaryItemFactory {
    static func create() -> NSCollectionLayoutBoundarySupplementaryItem {
        NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(50)
            ),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
    }
}
