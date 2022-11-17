//
//  Calculator_AppTests.swift
//  Calculator_AppTests
//
//  Created by Sudhansh Gupta on 16/11/22.
//

import XCTest
@testable import Calculator_App

final class Calculator_AppTests: XCTestCase {
    func test_applyOperation_addition() {
        expect("22") {
            InputModel(operationType: .addition,
                       lhsNumber: 2,
                       rhsNumber: 20)
        }
    }
    
    func test_applyOperation_substraction() {
        expect("18") {
            InputModel(operationType: .subtraction,
                       lhsNumber: 20,
                       rhsNumber: 2)
        }
    }
    
    func test_applyOperation_multiplication() {
        expect("40") {
            InputModel(operationType: .multiplication,
                       lhsNumber: 20,
                       rhsNumber: 2)
        }
    }
    
    func test_applyOperation_division() {
        expect("10") {
            InputModel(operationType: .division,
                       lhsNumber: 20,
                       rhsNumber: 2)
        }
    }
    
    func test_applyOperation_modulus() {
        expect("0.2") {
            InputModel(operationType: .modulus,
                       lhsNumber: 20,
                       rhsNumber: 0)
        }
    }
    
    // MARK: - Helpers
    private func expect(_ result: String,
                        using input: () -> (InputModel)) {
        let controller = OperationController()
        XCTAssertEqual(controller.applyOperation(on: input()), result)
    }
}
