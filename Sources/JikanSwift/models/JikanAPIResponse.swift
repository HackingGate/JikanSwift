//
//  JikanAPIResponse.swift
//  
//
//  Created by HG on 2020/09/21.
//

import Foundation

public struct JikanAPIResponse<T: Codable>: Codable {
    public let data: T?
    public let error: Bool
    public let code: String
    public let message: String?
}
