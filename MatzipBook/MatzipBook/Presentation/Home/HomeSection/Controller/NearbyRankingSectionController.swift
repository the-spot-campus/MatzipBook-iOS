//
//  NearbyRankingSectionController.swift
//  MatzipBook
//
//  Created by 심범수 on 6/18/25.
//

import UIKit

final class NearbyRankingSectionController: SectionDisplayable, HeaderFooterDisplayable {
    
    let headerTitle: String?
    let footerTitle: String?
    private let items: [NearbyRanking]
    
    init(
        headerTitle: String?,
        footerTitle: String,
        items: [NearbyRanking]
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
            withReuseIdentifier: NearbyRankingCollectionViewCell.identifier,
            for: indexPath
        ) as? NearbyRankingCollectionViewCell else {
            return UICollectionViewCell()
        }

        let cellData: NearbyRanking = items[indexPath.item]
        let viewModel: NearbyRankingCellViewModel = NearbyRankingCellViewModel(
            nearbyRanking: cellData
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
