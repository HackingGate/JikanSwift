//
//  JikanAPITop.swift
//  
//
//  Created by HG on 2020/09/22.
//

import Foundation

public struct JikanAPITop<T: Codable>: Codable {
    public let top: T?
}

public enum JikanAPITopType: String {
    case anime = "anime"
    case manga = "manga"
    case people = "people"
    case characters = "characters"
}

public enum JikanAPITopSubtype: String {
    // Anime
    case airing = "airing"
    case upcoming = "upcoming"
    case tv = "tv"
    case movie = "movie"
    case ova = "ova"
    case special = "special"
    // Manga
    case manga = "manga"
    case novels = "novels"
    case oneshots = "oneshots"
    case doujin = "doujin"
    case manhwa = "manhwa"
    case manhua = "manhua"
    // Both
    case bypopularity = "bypopularity"
    case favorite = "favorite"
}
