//
//  EndPointType.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/18/22.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
