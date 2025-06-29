//
//  HomeViewController.swift
//  MatzipBook
//
//  Created by RAFA on 5/30/25.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let navigationBarView: HomeNavigationBarView = HomeNavigationBarView()
    private let layoutFactory: HomeSectionLayoutFactory = HomeLayoutFactory()
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewCompositionalLayout =
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let section = HomeSection(rawValue: sectionIndex) else { return nil }
            return self?.layoutFactory.layout(for: section)
        }
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let viewModel: HomeViewModelProtocol
    
    // MARK: - Initializer
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegates()
        registerCells()
        bindViewModel()
    }
    
    // MARK: - Actions
    
    @objc private func didTapSearch() {
        viewModel.didTapSearchButton()
    }
    
    // MARK: - Bindings
    
    private func bindViewModel() {
        navigationBarView.setTitle(viewModel.universityName)
        navigationBarView.setRightBarButtonAction(self, action: #selector(didTapSearch))
    }
    
    // MARK: - Helpers
    
    private func setDelegates() {
        collectionView.dataSource = self
    }
    
    private func registerCells() {
        let cellTypes: [UICollectionViewCell.Type] = [
            VoteCollectionViewCell.self,
            NearbyRankingCollectionViewCell.self,
            PersonalRecommendationCollectionViewCell.self,
            HiddenGemCollectionViewCell.self
        ]
        
        cellTypes.forEach {
            collectionView.register($0, forCellWithReuseIdentifier: $0.identifier)
        }
        
        let headerFooterTypes: [(viewType: UICollectionReusableView.Type, kind: String)] = [
            (HomeSectionHeaderView.self, UICollectionView.elementKindSectionHeader),
            (HomeSectionFooterView.self, UICollectionView.elementKindSectionFooter)
        ]
        
        headerFooterTypes.forEach {
            collectionView.register(
                $0.viewType,
                forSupplementaryViewOfKind: $0.kind,
                withReuseIdentifier: $0.viewType.identifier
            )
        }
    }
    
    // MARK: - Setup View
    
    override func setupStyles() {
        super.setupStyles()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        collectionView.backgroundColor = .clear
        collectionView.contentInset.bottom = 60
    }
    
    override func setupLayouts() {
        view.addSubviews(navigationBarView, collectionView)
    }
    
    override func setupConstraints() {
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        HomeSection(rawValue: section)?.numberOfItems ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let sectionType = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        let identifier: String = sectionType.cellIdentifier
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let sectionType = HomeSection(rawValue: indexPath.section),
              sectionType.hasSupplementaryViews
        else {
            return UICollectionReusableView()
        }
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HomeSectionHeaderView.identifier,
                for: indexPath
            ) as? HomeSectionHeaderView else {
                return UICollectionReusableView()
            }
            header.configure(title: sectionType.headerTitle)
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HomeSectionFooterView.identifier,
                for: indexPath
            ) as? HomeSectionFooterView else {
                return UICollectionReusableView()
            }
            
            footer.configure(title: sectionType.footerButtonTitle) {
                self.viewModel.didTapSeeAllButton(for: sectionType)
            }
            
            return footer
            
        default: return UICollectionReusableView()
        }
    }
}
