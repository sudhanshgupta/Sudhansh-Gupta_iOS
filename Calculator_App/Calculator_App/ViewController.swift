//
//  ViewController.swift
//  Calculator_App
//
//  Created by Sudhansh Gupta on 15/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var txtLabel: UILabel!
    @IBOutlet private var buttonCollection: [CustomButton]!
    
    private var inputModel = InputModel()
    private var operationController = OperationController()
    private var recentOperation: OperationType = .nope
    
    private var inputNumber = "" {
        didSet {
            txtLabel.text = inputNumber == "" ? "0" : inputNumber
        }
    }
    private var resultNumber = "" {
        didSet {
            txtLabel.text = resultNumber
        }
    }
    
    @IBAction func buttonAction(_ sender: CustomButton) {
        switch sender.tag {
        case 0...9: // Number 0 -> 9
            inputNumber += "\(sender.tag)"
        case 10: // Dot
            inputNumber += "."
        case 11: // Equal
            resultNumber =  operationController.applyOperation(on: inputModel)
        case 12: // Addition
            setModelData(operation: .addition)
        case 13: // Subtraction
            setModelData(operation: .subtraction)
        case 14: // Multiplication
            setModelData(operation: .multiplication)
        case 15: // Division
            setModelData(operation: .division)
        case 16: // Modulus
            setModelData(operation: .modulus)
        case 17: // clear input value
            inputNumber = ""
        case 18: // clear all value
            inputNumber = ""
            recentOperation = .nope
            inputModel.operationType = .nope
            inputModel.lhsNumber = 0.0
            inputModel.rhsNumber = 0.0
        default:
            break
        }
    }
    
    fileprivate func setModelData(operation: OperationType) {
        if operation == .modulus {
            if inputNumber != "" {
                inputModel.lhsNumber = Double(inputNumber) ?? 0.0
                inputModel.operationType = operation
                inputNumber = ""
                resultNumber =  operationController.applyOperation(on: inputModel)
            }
        } else {
            if recentOperation != .nope {
                if inputNumber != "" {
                    inputModel.rhsNumber = Double(inputNumber) ?? 0.0
                    inputModel.operationType = operation
                    inputNumber = ""
                    
                    resultNumber =  operationController.applyOperation(on: inputModel)
                    
                    inputModel.lhsNumber = Double(resultNumber) ?? 0.0
                }
            } else {
                inputModel.lhsNumber = Double(inputNumber) ?? 0.0
                inputNumber = ""
            }
            recentOperation = operation
        }
    }
}
