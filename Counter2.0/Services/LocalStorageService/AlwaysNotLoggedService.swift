//
//  AlwaysNotLoggedService.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation

struct AlwaysNotLoggedService: LocalStorageService {

    func getLoggedToken() -> String? {
        nil
    }
}
