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
    
    // MARK: - Setup View
    
    override func setupStyles() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func setupLayouts() {
        view.addSubview(navigationBarView)
    }
    
    override func setupConstraints() {
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
