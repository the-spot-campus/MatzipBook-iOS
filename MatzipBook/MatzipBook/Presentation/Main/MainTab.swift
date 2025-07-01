//
//  MainTab.swift
//  MatzipBook
//
//  Created by RAFA on 5/30/25.
//

import UIKit

enum MainTab: Int, CaseIterable {
    case home, location, bookmark, profile

    var icon: UIImage? {
        switch self {
        case .home: return .icHomeUnselected
        case .location: return .icLocationUnselected
        case .bookmark: return .icBookmarkUnselected
        case .profile: return .icPersonUnselected
        }
    }

    var selectedIcon: UIImage? {
        switch self {
        case .home: return .icHomeSelected
        case .location: return .icLocationSelected
        case .bookmark: return .icBookmarkSelected
        case .profile: return .icPersonSelected
        }
    }

    var viewController: UIViewController {
        switch self {
        case .home:
            let viewModel: HomeViewModel = HomeViewModel()
            let homeVC: HomeViewController = HomeViewController(viewModel: viewModel)
            return UINavigationController(rootViewController: homeVC)
        case .location:
            return UINavigationController(rootViewController: MapViewController())
        case .bookmark:
            return UINavigationController(rootViewController: BookmarkViewController())
        case .profile:
            return UINavigationController(rootViewController: ProfileViewController())
        }
    }
}
