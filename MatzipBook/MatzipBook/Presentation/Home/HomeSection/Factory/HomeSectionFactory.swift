//
//  HomeSectionFactory.swift
//  MatzipBook
//
//  Created by 심범수 on 6/18/25.
//

import UIKit

struct HomeSectionFactory {
    
    static func makeSections(
        for universityName: String,
        onSeeAll: @escaping (HomeSectionType) -> Void
    ) -> [SectionDisplayable] {
        return [
            makeVoteSection(),
            makeNearbyRankingSection(onSeeAll),
            makePersonalRecommendationSection(userName: "범수", onSeeAll),
            makeHiddenGemSection(generation: "19", onSeeAll)
        ]
    }

    private static func makeVoteSection() -> SectionDisplayable {
        let items: [Vote] = [
            Vote(
                leftRestaurant: Restaurant(name: "그집짬뽕", thumbnail: .imgDummy0),
                rightRestaurant: Restaurant(name: "오일리", thumbnail: .imgDummy1),
                remainingTime: 16
            )
        ]
        
        return VoteSectionController(items: items)
    }

    private static func makeNearbyRankingSection(
        _ onSeeAll: @escaping (HomeSectionType) -> Void
    ) -> SectionDisplayable {
        let items: [NearbyRanking] = []
        
        return NearbyRankingSectionController(
            headerTitle: "주변 맛집 랭킹",
            footerTitle: "주변 맛집 전체보기",
            items: items
        )
    }

    private static func makePersonalRecommendationSection(
        userName: String,
        _ onSeeAll: @escaping (HomeSectionType) -> Void
    ) -> SectionDisplayable {
        let items: [RecommendedRestaurant] = []
        
        return RecommendationSectionController(
            headerTitle: "\(userName)님 취향 추천",
            footerTitle: "취향 추천 전체보기",
            items: items
        )
    }

    private static func makeHiddenGemSection(
        generation: String,
        _ onSeeAll: @escaping (HomeSectionType) -> Void
    ) -> SectionDisplayable {
        let items: [RecommendedRestaurant] = []
        
        return HiddenGemSectionController(
            headerTitle: "\(generation)학번이 추천하는 숨은 찐 맛집",
            footerTitle: "찐 맛집 전체보기",
            items: items
        )
    }
}
