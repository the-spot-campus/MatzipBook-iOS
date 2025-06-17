//
//  HomeSectionFooterView.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

final class HomeSectionFooterView: BaseCollectionReusableView {
    
    // MARK: - Properties

    private let seeAllButton: UIButton = UIButton(type: .system)

    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAddTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton() {
        onTap?()
    }
    
    // MARK: - Helpers
    
    func configure(
        title: String?,
        onTap: (() -> Void)? = nil
    ) {
        seeAllButton.setAttributedTitle(
            NSAttributedString(
                string: title ?? "전체보기",
                attributes: [
                    .foregroundColor: UIColor.mainLight2,
                    .font: UIFont.applyFont(.bold, ofSize: 12)
                ]
            ),
            for: .normal
        )
        
        self.onTap = onTap
    }
    
    private func setAddTargets() {
        seeAllButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // MARK: - Setup View
    
    override func setupStyles() {
        var config: UIButton.Configuration = UIButton.Configuration.plain()
        config.baseForegroundColor = .mainLight2
        config.image = UIImage(systemName: "chevron.right")?.withConfiguration(
            UIImage.SymbolConfiguration(pointSize: 10, weight: .bold)
        )
        config.imagePadding = 4
        config.imagePlacement = .trailing
        config.cornerStyle = .capsule

        seeAllButton.configuration = config
        seeAllButton.clipsToBounds = true
        seeAllButton.layer.cornerRadius = 12
        seeAllButton.layer.borderColor = UIColor.mainLight2.cgColor
        seeAllButton.layer.borderWidth = 2
        seeAllButton.tintColor = .mainLight2
    }
    
    override func setupLayouts() {
        addSubview(seeAllButton)
    }
    
    override func setupConstraints() {
        seeAllButton.snp.makeConstraints {
            $0.centerY.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
