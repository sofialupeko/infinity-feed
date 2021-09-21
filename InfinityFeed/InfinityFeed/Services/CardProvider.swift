//
//  CardProvider.swift
//  InfinityFeed
//
//  Created by Sofia Lupeko on 21.09.2021.
//

import Foundation

final class CardProvider {
    private static let images = [
        "previewCard",
        "pers1",
        "pers2",
        "pers3",
        "pers4",
        "pers5",
        "pers6",
        "pers7",
        "pers8"
    ]
    
    func makeCard() -> CardInfo {
        let maxImageIndex = Int(
            arc4random_uniform(UInt32(Self.images.count))
        )
        return CardInfo(imageName: Self.images[maxImageIndex])
    }
}
