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
    public let imageURL: String
    public let trailerURL: String?
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
        case imageURL = "image_url"
        case trailerURL = "trailer_url"
        case title = "title"
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case titleSynonyms = "title_synonyms"
        case episodes = "episodes"
        case airing = "airing"
        case synopsis = "synopsis"
    }
}

public enum JikanAPIAnimeRequest: String {
    case all = "/"
    case charactersStaff = "/characters_staff"
    case episodes = "episodes"
    case news = "news"
    case pictures = "pictures"
    case videos = "videos"
    case stats = "stats"
    case forum = "forum"
    case moreinfo = "moreinfo"
    case reviews = "reviews"
    case recommendations = "recommendations"
    case userupdates = "userupdates"
}
