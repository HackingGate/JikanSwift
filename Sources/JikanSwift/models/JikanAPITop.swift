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
