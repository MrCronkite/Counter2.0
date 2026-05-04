//
//  RegisterInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation

protocol RegisterInteractor: AnyObject {

}

final class RegisterInteractorImpl: RegisterInteractor {
    
    private let presenter: RegisterPresenter

    init(presenter: RegisterPresenter) {
        self.presenter = presenter
    }
}
