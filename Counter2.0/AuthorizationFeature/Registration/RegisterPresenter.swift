//
//  RegisterPresenter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

protocol RegisterPresenter: AnyObject {

}

final class RegisterPresenterImpl: RegisterPresenter {

    private var view: RegisterViewController

    init(view: RegisterViewController) {
        self.view = view
    }

}
