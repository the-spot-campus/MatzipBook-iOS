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
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewCompositionalLayout =
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let sectionType = HomeSectionType(rawValue: sectionIndex) else {
                return nil
            }
            return sectionType.sectionLayout()
        }
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let viewModel: HomeViewModel
    
    // MARK: - Initializer
    
    init(viewModel: HomeViewModel) {
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
        return viewModel.sections.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.sections[section].numberOfItems()
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return viewModel.sections[indexPath.section]
            .cellForItem(at: indexPath, in: collectionView)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let controller: SectionDisplayable = viewModel.sections[indexPath.section]

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return controller.header(
                in: collectionView,
                at: indexPath
            ) ?? UICollectionReusableView()

        case UICollectionView.elementKindSectionFooter:
            let footerView: UICollectionReusableView? = controller.footer(
                in: collectionView,
                at: indexPath
            )
            
            if let footerView = footerView as? HomeSectionFooterView,
               let displayable = controller as? HeaderFooterDisplayable {
                footerView.configure(title: displayable.footerTitle) { [weak self] in
                    if let type = HomeSectionType(rawValue: indexPath.section) {
                        self?.viewModel.didTapSeeAllButton(for: type)
                    }
                }
            }
            return footerView ?? UICollectionReusableView()

        default:
            return UICollectionReusableView()
        }
    }
}
