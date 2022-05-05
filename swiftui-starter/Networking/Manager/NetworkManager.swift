//
//  NetworkManager.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/18/22.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .development
    static let APIKey = "2696829a81b1b5827d515ff121700838"
    let router = Router<EndpointApi>()

    func getBoutiques(completion: @escaping (_ boutiques: [Boutiques]?, _ error: String?) -> Void) {
        router.request(.boutiques(id: 0)) { data, response, error in

            if error != nil {
                completion(nil, "Please check your network connection.")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        print(jsonData)
                        let apiResponse = try JSONDecoder().decode(BoutiquesApiResponseDTO.self, from: responseData)
                        completion(apiResponse.items, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case let .failure(networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200 ... 299: return .success
        case 401 ... 500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501 ... 599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
