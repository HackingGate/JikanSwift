//
//  JikanApiServiceExtension.swift
//  
//
//  Created by HG on 2020/09/22.
//

extension JikanAPIService {
    // https://docs.api.jikan.moe/#tag/anime
    public func getAnimeFull<T: Codable>(id: Int,
                          request: JikanAPIAnimeRequest,
                          params: [String: String]?,
                          completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["anime", String(id), request.rawValue])
        GET(queryURL: url,
            params: params,
            completionHandler: completionHandler)
    }
    // https://docs.api.joe/#tag/top
    public func getTopAnime<T: Codable>(type: JikanAPITopType,
                                    filter: JikanAPITopFilter,
                                    page: Int,
                                    params: [String: String]?,
                                    completionHandler: @escaping (Result<T, APIError>) -> Void) {
        var updatedParams = params ?? [String: String]()
        updatedParams["page"] = String(page)
        updatedParams["type"] = type.rawValue
        updatedParams["filter"] = filter.rawValue

        let url = urlBuilder(["top", "anime"])
        GET(queryURL: url,
            params: updatedParams,
            completionHandler: completionHandler)
    }
}
