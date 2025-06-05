//
//  MainTabBarController.swift
//  MatzipBook
//
//  Created by RAFA on 5/30/25.
//

import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - Properties

    private var customTabBarView: UIView = UIView(frame: .zero)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        configureTabBarView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupTabBarFrame()
    }

    // MARK: - UI

    private func setupTabBarFrame() {
        let height: CGFloat = view.safeAreaInsets.bottom + 68
        var frame: CGRect = tabBar.frame
        frame.size.height = height
        frame.origin.y = view.frame.size.height - height

        tabBar.frame = frame
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()

        customTabBarView.frame = tabBar.frame
    }

    private func setupViewControllers() {
        viewControllers = MainTab.allCases.map { tab in
            let viewController: UIViewController = tab.viewController
            viewController.tabBarItem = UITabBarItem(
                title: nil,
                image: tab.icon?.withRenderingMode(.alwaysOriginal),
                selectedImage: tab.selectedIcon?.withRenderingMode(.alwaysOriginal)
            )

            viewController.tabBarItem.imageInsets = UIEdgeInsets(
                top: 5,
                left: 0,
                bottom: -5,
                right: 0
            )

            return viewController
        }
    }

    private func configureTabBarView() {
        customTabBarView.frame = tabBar.frame
        customTabBarView.backgroundColor = UIColor.mainBackgroundColor
        customTabBarView.layer.masksToBounds = false
        customTabBarView.layer.cornerRadius = 24
        customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTabBarView.layer.shadowColor = UIColor.shadowColor.cgColor
        customTabBarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        customTabBarView.layer.shadowOpacity = 1
        customTabBarView.layer.shadowRadius = 10

        DispatchQueue.main.async {
            self.customTabBarView.layer.shadowPath = UIBezierPath(
                roundedRect: self.customTabBarView.bounds,
                cornerRadius: 24
            ).cgPath
        }

        view.addSubview(customTabBarView)
        view.bringSubviewToFront(tabBar)
    }
}
