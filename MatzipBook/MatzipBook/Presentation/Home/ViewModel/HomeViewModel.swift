//
//  HomeViewModel.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import Foundation

final class HomeViewModel {
    
    var universityName: String = "부경대학교"
    private(set) var sections: [SectionDisplayable] = []
    
    init() {
        self.sections = HomeSectionFactory.makeSections(
            for: universityName
        ) { [weak self] section in
            self?.didTapSeeAllButton(for: section)
        }
    }
    
    func didTapSearchButton() {
        print("DEBUG: Search button tapped")
    }
    
    func didTapSeeAllButton(for section: HomeSectionType) {
        print("DEBUG: See all button tapped for section >>> \(section)")
    }
}
