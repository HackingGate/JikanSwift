//
//  JikanAPIService.swift
//
//
//  Created by HG on 2020/09/20.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

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
            if arg.count > 0 && arg != "/" {
                url.appendPathComponent(arg)
            }
        }
        return url
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
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completionHandler(.failure(.networkError(error: error)))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.noResponse))
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                completionHandler(.success(object))
            } catch let error {
                #if DEBUG
                print("JSON Decoding Error: \(error)")
                #endif
                completionHandler(.failure(.jsonDecodingError(error: error)))
            }
        }
        task.resume()
    }
}
