//
//  HomeSectionHeaderView.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

final class HomeSectionHeaderView: BaseCollectionReusableView {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = UILabel()
    
    // MARK: - Helpers
    
    func configure(title: String?) {
        titleLabel.text = title
    }
    
    // MARK: - Setup View
    
    override func setupStyles() {
        titleLabel.do {
            $0.textAlignment = .left
            $0.font = .applyFont(.bold, ofSize: 20)
        }
    }
    
    override func setupLayouts() {
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
