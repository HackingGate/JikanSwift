//
//  JikanApiServiceExtension.swift
//  
//
//  Created by HG on 2020/09/22.
//

extension JikanAPIService {
    // https://jikan.docs.apiary.io/#reference/0/anime
    public func loadAnime<T: Codable>(id: Int,
                          request: String,
                          params: [String: String]?,
                          completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["anime", String(id), request])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
    // https://jikan.docs.apiary.io/#reference/0/top
    public func loadTop<T: Codable>(type: String,
                                    page: Int,
                                    subtype: String,
                                    params: [String: String]?,
                                    completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["top", type, String(page), subtype])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
}
