//
//  JikanAPITop.swift
//  
//
//  Created by HG on 2020/09/22.
//

import Foundation

public struct JikanAPITop<T: Codable>: Codable {
    public let data: T?
}

public enum JikanAPITopFilter: String {
    case airing = "airing"
    case upcoming = "upcoming"
    case bypopularity = "bypopularity"
    case favorite = "favorite"
}

public enum JikanAPITopType: String {
    // Anime
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
}
