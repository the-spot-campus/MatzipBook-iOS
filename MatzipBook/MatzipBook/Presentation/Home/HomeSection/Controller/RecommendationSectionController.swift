//
//  RecommendationSectionController.swift
//  MatzipBook
//
//  Created by 심범수 on 6/18/25.
//

import UIKit

final class RecommendationSectionController: SectionDisplayable, HeaderFooterDisplayable {
    
    let headerTitle: String?
    let footerTitle: String?
    private let items: [RecommendedRestaurant]
    
    init(
        headerTitle: String?,
        footerTitle: String,
        items: [RecommendedRestaurant]
    ) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.items = items
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func cellForItem(
        at indexPath: IndexPath,
        in collectionView: UICollectionView
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PersonalRecommendationCollectionViewCell.identifier,
            for: indexPath
        ) as? PersonalRecommendationCollectionViewCell else {
            return UICollectionViewCell()
        }

        let cellData: RecommendedRestaurant = items[indexPath.item]
        let viewModel: PersonalRecommendationCellViewModel = PersonalRecommendationCellViewModel(
            personalRecommendation: cellData
        )
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func header(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeSectionHeaderView.identifier,
            for: indexPath
        ) as? HomeSectionHeaderView else {
            return nil
        }

        header.configure(title: headerTitle)
        
        return header
    }
    
    func footer(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        guard let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: HomeSectionFooterView.identifier,
            for: indexPath
        ) as? HomeSectionFooterView else {
            return nil
        }

        footer.configure(title: footerTitle)
        
        return footer
    }
}
