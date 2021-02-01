//
//  AppGroup.swift
//  astore-sui
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    var id = UUID().uuidString
    let name, artistName, artworkUrl100: String
}

