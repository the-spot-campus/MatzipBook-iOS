//
//  HomeSectionLayoutFactory.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

protocol HomeSectionLayoutFactory {
    func layout(for section: HomeSection) -> NSCollectionLayoutSection
}
