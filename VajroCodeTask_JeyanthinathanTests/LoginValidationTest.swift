//
//  LoginValidationTest.swift
//  VajroCodeTask_JeyanthinathanTests
//
//  Created by AMBINO4526 on 06/08/22.
//

import XCTest

class LoginValidationTest: XCTestCase {

    func testValidations() {
        let email = "a@bv.com"
        XCTAssertTrue(email.isValidEmail())
        
        let password = "Qwerty123!"
        XCTAssertTrue(password.isValidPassword())
    }
}
