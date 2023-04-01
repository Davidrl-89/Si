//
//  SeriesModel.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 30/3/23.
//

import Foundation

// MARK: - Series
struct Series: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataClassSerie
}

// MARK: - DataClass
struct DataClassSerie: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Serie]
}

// MARK: - Result
struct Serie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [URLElement]
    let startYear, endYear: Int
    let rating, type: String
    let modified: String
    let thumbnail: Thumbnail
    let creators: Creators
    let characters: Characters
    let stories: Stories
    let comics, events: Characters
//    let next, previous: JSONNull?
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]
    let returned: Int
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}

//// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}

// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: TypeEnum
//}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
//struct Thumbnail: Codable {
//    let path: String
//    let thumbnailExtension: String
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//// MARK: - URLElement
//struct URLElement: Codable {
//    let type: String
//    let url: String
//}



