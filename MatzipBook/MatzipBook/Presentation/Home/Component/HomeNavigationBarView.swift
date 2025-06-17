//
//  HomeNavigationBarView.swift
//  MatzipBook
//
//  Created by 심범수 on 6/9/25.
//

import UIKit

import SnapKit
import Then

final class HomeNavigationBarView: UIView {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = UIImageView()
    private let universityNameLabel: UILabel = UILabel()
    private let leftStackView: UIStackView = UIStackView()
    private let searchButton: UIButton = UIButton()
    private let separatorView: UIView = UIView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
        setupLayouts()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setTitle(_ universityName: String?) {
        universityNameLabel.text = universityName
    }
    
    func setRightBarButtonAction(_ target: Any?, action: Selector) {
        searchButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    // MARK: - Setup View
    
    private func setupStyles() {
        backgroundColor = .mainBackgroundColor

        logoImageView.do {
            $0.image = .imgLogo
            $0.contentMode = .scaleAspectFit
        }

        universityNameLabel.do {
            $0.font = .applyFont(.bold, ofSize: 16)
            $0.textColor = .sub1
        }

        leftStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }

        searchButton.setImage(
            .icSearch.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        
        separatorView.backgroundColor = .separatorColor
    }
    
    private func setupLayouts() {
        [logoImageView, universityNameLabel].forEach {
            leftStackView.addArrangedSubview($0)
        }
        
        addSubviews(leftStackView, searchButton, separatorView)
    }

    private func setupConstraints() {
        leftStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
