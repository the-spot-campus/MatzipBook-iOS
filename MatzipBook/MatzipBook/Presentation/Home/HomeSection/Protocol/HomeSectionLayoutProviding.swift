//
//  HomeSectionLayoutProviding.swift
//  MatzipBook
//
//  Created by 심범수 on 6/17/25.
//

import UIKit

protocol HomeSectionLayoutProviding {
    func layout(for section: HomeSectionType) -> NSCollectionLayoutSection
}
