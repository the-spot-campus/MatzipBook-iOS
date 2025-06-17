//
//  VoteCollectionViewCell.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

final class VoteCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    
    private let leftNameImageView: UIImageView = UIImageView()
    private let leftNameLabel: UILabel = UILabel()
    
    private let rightNameImageView: UIImageView = UIImageView()
    private let rightNameLabel: UILabel = UILabel()
    
    private let leftButton: UIButton = UIButton(type: .system)
    private let vsImageView: UIImageView = UIImageView()
    private let rightButton: UIButton = UIButton(type: .system)
    
    private let timeImageView: UIImageView = UIImageView()
    private let timeLabel: UILabel = UILabel()
    private let timeStackView: UIStackView = UIStackView()
    
    private let bubbleStackView: UIStackView = UIStackView()
    private let voteButtonStackView: UIStackView = UIStackView()
    
    // MARK: - Setup View
    
    override func setupStyles() {
        contentView.do {
            $0.backgroundColor = .boxColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
        configureLabel(
            titleLabel,
            text: MatzipText.Vote.title,
            textColor: .mainOrange,
            fontName: .bold,
            ofSize: 28
        )
        
        configureLabel(
            subtitleLabel,
            text: MatzipText.Vote.subtitle,
            textColor: .sub1,
            fontName: .regular,
            ofSize: 14
        )
        
        configureBubbleImageView(leftNameImageView)
        configureBubbleImageView(rightNameImageView)
        
        configureLabel(
            leftNameLabel,
            text: "그집짬뽕0927",
            fontName: .bold,
            ofSize: 14,
            lines: 2
        )
        
        configureLabel(
            rightNameLabel,
            text: "오일리",
            fontName: .bold,
            ofSize: 14,
            lines: 2
        )
        
        configureVoteButton(leftButton, image: .imgDummy0)
        configureVoteButton(rightButton, image: .imgDummy1)
        [bubbleStackView, voteButtonStackView].forEach { $0.configureStackView() }
        configureDefaultImageView(vsImageView, image: .imgVs)
        configureDefaultImageView(timeImageView, image: .icClock)
        
        configureLabel(
            timeLabel,
            text: "16시간 남음",
            textColor: .sub2,
            fontName: .bold,
            ofSize: 12
        )
        
        timeStackView.configureStackView(distribution: .fill, spacing: 4)
    }
    
    override func setupLayouts() {
        [timeImageView, timeLabel].forEach {
            timeStackView.addArrangedSubview($0)
        }
        
        [leftNameImageView, rightNameImageView].forEach {
            bubbleStackView.addArrangedSubview($0)
        }
        
        [leftButton, rightButton].forEach {
            voteButtonStackView.addArrangedSubview($0)
        }
        
        contentView.addSubviews(
            titleLabel,
            subtitleLabel,
            bubbleStackView,
            voteButtonStackView,
            vsImageView,
            timeStackView
        )
        
        leftNameImageView.addSubview(leftNameLabel)
        rightNameImageView.addSubview(rightNameLabel)
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        leftNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(leftNameImageView).offset(-5)
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
        
        rightNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(rightNameImageView).offset(-5)
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
        
        bubbleStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.lessThanOrEqualTo(50)
        }
        
        voteButtonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(bubbleStackView.snp.bottom)
        }
        
        vsImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(voteButtonStackView)
            $0.size.equalTo(100)
        }
        
        timeStackView.snp.makeConstraints {
            $0.top.equalTo(voteButtonStackView.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().inset(25)
            $0.bottom.equalToSuperview().inset(18)
        }
    }
}

// MARK: - UI Helpers

private extension VoteCollectionViewCell {
    
    func configureLabel(
        _ label: UILabel,
        text: String? = nil,
        textColor: UIColor = .black,
        alignment: NSTextAlignment = .center,
        fontName: FontName,
        ofSize: CGFloat,
        lines: Int = 1
    ) {
        label.text = text
        label.textColor = textColor
        label.textAlignment = alignment
        label.font = .applyFont(fontName, ofSize: ofSize)
        label.numberOfLines = lines
    }
    
    func configureDefaultImageView(_ imageView: UIImageView, image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
    }
    
    func configureBubbleImageView(_ imageView: UIImageView) {
        imageView.do {
            $0.image = .imgBubble.withRenderingMode(.alwaysOriginal)
            $0.contentMode = .scaleAspectFill
            $0.layer.shadowRadius = 10
            $0.layer.shadowOpacity = 1
            $0.layer.shadowOffset = .zero
            $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.13).cgColor
        }
    }
    
    func configureVoteButton(_ button: UIButton, image: UIImage) {
        button.do {
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.contentMode = .scaleAspectFit
            $0.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
}
