//
//  JikanAPIService.swift
//
//
//  Created by HG on 2020/09/20.
//

import Foundation

public struct JikanAPIService {
    let baseURL = URL(string: "https://api.jikan.moe/v3")!
    public static let shared = JikanAPIService()
    let decoder = JSONDecoder()
    public enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }
    func urlBuilder(_ args: [String]) -> URL {
        var url = self.baseURL
        for arg in args {
            // Workaround fix URL can't end with "/".
            if (arg.count > 0 && arg != "/") {
                url.appendPathComponent(arg)
            }
        }
        return url
    }
    public func loadAnime<T: Codable>(id: Int,
                          request: String,
                          params: [String: String]?,
                          completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let url = urlBuilder(["anime", String(id), request])
        self.GET(queryURL: url,
                 params: params,
                 completionHandler: completionHandler)
    }
    func GET<T: Codable>(queryURL: URL,
                                params: [String: String]?,
                                completionHandler: @escaping (Result<T, APIError>) -> Void) {
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
        }
        task.resume()
    }
}
