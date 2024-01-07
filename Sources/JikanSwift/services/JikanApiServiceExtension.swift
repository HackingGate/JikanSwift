//
//  JikanApiServiceExtension.swift
//  
//
//  Created by HG on 2020/09/22.
//

extension JikanAPIService {
    // https://docs.api.jikan.moe/#tag/anime
    public func loadAnime<T: Codable>(id: Int,
                          request: JikanAPIAnimeRequest,
                          params: [String: String]?,
                          completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["anime", String(id), request.rawValue])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
    // https://docs.api.joe/#tag/top
    public func loadTop<T: Codable>(type: JikanAPITopType,
                                    page: Int,
                                    subtype: JikanAPITopSubtype,
                                    params: [String: String]?,
                                    completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["top", type.rawValue, String(page), subtype.rawValue])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
}
