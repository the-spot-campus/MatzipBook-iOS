//
//  SectionDisplayable.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

protocol SectionDisplayable {
    func numberOfItems() -> Int
    
    func cellForItem(
        at indexPath: IndexPath,
        in collectionView: UICollectionView
    ) -> UICollectionViewCell
    
    func header(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView?
    
    func footer(
        in collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UICollectionReusableView?
}
