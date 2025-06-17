//
//  DefaultSectionController.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

final class DefaultSectionController: SectionController {
    
    private let section: HomeSection
    
    let sectionControllers: [HomeSection: SectionController] = [
        .vote: VoteSectionController(),
        .nearbyRanking: DefaultSectionController(section: .nearbyRanking),
        .recommendation: DefaultSectionController(section: .recommendation),
        .hiddenGem: DefaultSectionController(section: .hiddenGem)
    ]
    
    init(section: HomeSection) {
        self.section = section
    }
    
    func numberOfItems() -> Int {
        section.numberOfItems
    }
    
    func cellForItem(
        at indexPath: IndexPath,
        in collectionView: UICollectionView
    ) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: section.cellIdentifier,
            for: indexPath
        )
        
        return cell
    }
    
    func header(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        guard section.hasSupplementaryViews else { return nil }
        
        guard let header: HomeSectionHeaderView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeSectionHeaderView.identifier,
            for: indexPath
        ) as? HomeSectionHeaderView else {
            return HomeSectionHeaderView()
        }
        
        header.configure(title: section.headerTitle)
        
        return header
    }
    
    func footer(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        guard section.hasSupplementaryViews else { return nil }
        
        guard let footer: HomeSectionFooterView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: HomeSectionFooterView.identifier,
            for: indexPath
        ) as? HomeSectionFooterView else {
            return HomeSectionFooterView()
        }
        
        footer.configure(title: section.footerButtonTitle)
        
        return footer
    }
}
