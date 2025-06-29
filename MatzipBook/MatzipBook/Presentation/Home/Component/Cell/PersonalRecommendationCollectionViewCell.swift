//
//  PersonalRecommendationCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/16/25.
//

import UIKit

final class PersonalRecommendationCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Bindings
    
    func configure(with viewModel: PersonalRecommendationCellViewModel) {}
    
    // MARK: - Setup View
    
    override func setupStyles() {
        contentView.backgroundColor = .systemBlue
    }
}
