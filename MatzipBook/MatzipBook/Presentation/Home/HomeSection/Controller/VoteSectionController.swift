//
//  VoteSectionController.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

final class VoteSectionController: SectionDisplayable {
    
    private let items: [Vote]
    
    init(items: [Vote]) {
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
            withReuseIdentifier: VoteCollectionViewCell.identifier,
            for: indexPath
        ) as? VoteCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let cellData: Vote = items[indexPath.item]
        let viewModel: VoteCellViewModel = VoteCellViewModel(vote: cellData)
        cell.configure(with: viewModel)
        
        return cell
    }

    func header(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        return nil
    }

    func footer(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView? {
        return nil
    }
}
