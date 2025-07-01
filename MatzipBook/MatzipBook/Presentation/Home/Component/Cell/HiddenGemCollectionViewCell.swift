//
//  HiddenGemCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/16/25.
//

import UIKit

final class HiddenGemCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Bindings
    
    func configure(with viewModel: HiddenGemCellViewModel) {}
    
    // MARK: - Setup View
    
    override func setupStyles() {
        contentView.backgroundColor = .systemIndigo
    }
}
