//
//  BaseCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

import SnapKit
import Then

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
        setupLayouts()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 뷰의 시각적 속성(스타일)을 설정합니다.
    ///
    /// 이 메서드는 `backgroundColor`, `font`, `textColor`, `cornerRadius` 등
    /// 레이아웃이나 계층 구조에 영향을 주지 않는 **시각적인 속성만을 설정**하는 데 사용됩니다.
    ///
    /// 예:
    /// ```swift
    /// titleLabel.textColor = .labelPrimary
    /// titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
    /// layer.cornerRadius = 12
    /// ```
    func setupStyles() {
        contentView.backgroundColor = .mainBackgroundColor
    }
    
    /// 뷰의 계층 구조를 설정합니다.
    ///
    /// 이 메서드는 서브뷰를 상위 뷰에 추가하는 작업을 담당하며,
    /// `addSubview`, `addArrangedSubview` 등을 통해 **뷰의 구조를 구성**합니다.
    /// 일반적으로 제약 조건 설정 전에 호출됩니다.
    ///
    /// 예:
    /// ```swift
    /// contentView.addSubview(titleLabel)
    /// stackView.addArrangedSubview(subtitleLabel)
    /// ```
    func setupLayouts() {}
    
    /// 오토레이아웃 제약 조건을 설정합니다.
    ///
    /// 이 메서드는  뷰 간의 위치, 크기, 정렬 관계 등의 **제약 조건을 정의**합니다.
    /// `setupLayouts()` 이후 호출되어야 하며, 레이아웃의 정확한 동작을 위해 필수입니다.
    ///
    /// 예:
    /// ```swift
    /// titleLabel.snp.makeConstraints {
    ///     $0.top.equalToSuperview().inset(16)
    ///     $0.leading.trailing.equalToSuperview().inset(20)
    /// }
    /// ```
    func setupConstraints() {}
}
