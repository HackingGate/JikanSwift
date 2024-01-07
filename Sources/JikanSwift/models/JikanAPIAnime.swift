//
//  JikanAPIAnime.swift
//  
//
//  Created by HG on 2020/09/21.
//

import Foundation

public struct JikanAPIAnime: Codable, Identifiable {
    public let id: Int // mal_id
    public let url: String
    public let images: JikanAPIImages
    public let title: String
    public let titleEnglish: String?
    public let titleJapanese: String?
    public let titleSynonyms: [String]?
    public let episodes: Int?
    public let airing: Bool?
    public let synopsis: String?

    enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case images = "images"
        case title = "title"
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case titleSynonyms = "title_synonyms"
        case episodes = "episodes"
        case airing = "airing"
        case synopsis = "synopsis"
    }
}

public struct JikanAPIImages: Codable {
    public let jpg: JikanAPIImage
    public let webp: JikanAPIImage
}

public struct JikanAPIImage: Codable {
    public let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
    }
}

public enum JikanAPIAnimeRequest: String {
    case all = "/"
}
