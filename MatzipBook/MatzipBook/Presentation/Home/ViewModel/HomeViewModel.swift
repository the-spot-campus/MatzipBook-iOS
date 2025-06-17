//
//  HomeViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import Foundation

protocol HomeViewModelProtocol {
    var universityName: String { get }
    func didTapSearchButton()
    func didTapSeeAllButton(for section: HomeSection)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var universityName: String { return "부경대학교" }
    
    func didTapSearchButton() {
        print("DEBUG: Search button tapped")
    }
    
    func didTapSeeAllButton(for section: HomeSection) {
        print("DEBUG: See all button tapped for section >>> \(section.cellIdentifier)")
    }
}
