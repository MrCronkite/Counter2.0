//
//  NetworkService.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import UIKit

protocol NetworkServices {
   func getCoinsData() async throws -> Coins
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

final class NetworkServicesImpl: NetworkServices {

    private enum API {
        static let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
    }

    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder

    init(
        urlSession: URLSession = .shared,
        jsonDecoder: JSONDecoder = JSONDecoder()
    ) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }

    func getCoinsData() async throws -> Coins {
        guard let url = URL(string: API.url) else {
            throw NetworkError.invalidURL
        }

        return try await request(url)
    }
}

extension NetworkServicesImpl {
    private func request<T: Decodable>(_ url: URL) async throws -> T {
        let (data, response) = try await urlSession.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        return try jsonDecoder.decode(T.self, from: data)
    }
}



