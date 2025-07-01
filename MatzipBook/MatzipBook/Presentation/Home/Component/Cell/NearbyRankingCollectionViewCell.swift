//
//  NearbyRankingCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

final class NearbyRankingCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Bindings
    
    func configure(with viewModel: NearbyRankingCellViewModel) {}
    
    // MARK: - Setup View
    
    override func setupStyles() {
        contentView.backgroundColor = .systemGreen
    }
}
