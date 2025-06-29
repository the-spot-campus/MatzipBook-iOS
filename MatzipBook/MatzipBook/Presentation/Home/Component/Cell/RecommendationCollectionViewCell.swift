//
//  RecommendationCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/16/25.
//

import UIKit

final class RecommendationCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Bindings
    
    func configure(with viewModel: RecommendationCellViewModel) {}
    
    // MARK: - Setup View
    
    override func setupStyles() {
        contentView.backgroundColor = .systemBlue
    }
}
