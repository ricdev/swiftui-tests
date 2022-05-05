//
//  EndPoint.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/18/22.
//

import Foundation

enum NetworkEnvironment {
    case development
}

public enum EndpointApi {
    case boutiques(id: Int)
}

extension EndpointApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .development: return "https://raw.githubusercontent.com/ricdev/swiftui-tests/main/json/"
        }
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }

    var path: String {
        switch self {
        case .boutiques(id: _):
            return "boutique_brief.json"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
//        case .boutiques(id: <#T##Int#>):
//            return .requestParameters(bodyParameters: nil,
//                                      bodyEncoding: .urlEncoding,
//                                      urlParameters: ["page":page,
//                                                      "api_key":NetworkManager.APIKey])
        default:
            return .request
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
