//
//  VoteSectionController.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

final class VoteSectionController: SectionController {
    
    func numberOfItems() -> Int { 1 }
    
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
