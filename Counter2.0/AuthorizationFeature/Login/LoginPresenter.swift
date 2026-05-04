//
//  LoginPresenter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

protocol LoginPresenter: AnyObject {

}

class LoginPresenterImpl: LoginPresenter {

    private var view: LoginViewController

    init(view: LoginViewController) {
        self.view = view
    }

}
