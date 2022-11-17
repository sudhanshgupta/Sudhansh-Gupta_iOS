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
    
    var recentOperation: OperationType = .nope
    var isOperationStart = false
    var inputNumber = "" {
        didSet {
            txtLabel.text = inputNumber == "" ? "0" : inputNumber
        }
    }
    var resultNumber = ""
    var lhsNumber = 0.0
    var rhsNumber = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonAction(_ sender: CustomButton) {
        switch sender.tag {
        case 0...9: // Number 0 -> 9
            inputNumber += "\(sender.tag)"
        case 10: // Dot
            inputNumber += "."
        case 11: // Equal
            applyOperation(operation: recentOperation)
        case 12: // Addition
            applyOperation(operation: .addition)
        case 13: // Subtraction
            applyOperation(operation: .subtraction)
        case 14: // Multiplication
            applyOperation(operation: .multiplication)
        case 15: // Division
            applyOperation(operation: .division)
        case 16: // Modulus
            applyOperation(operation: .modulus)
        case 17: // clear input value
            inputNumber = ""
        case 18: // clear all value
            inputNumber = ""
            resultNumber = ""
            lhsNumber = 0.0
            rhsNumber = 0.0
            recentOperation = .nope
        default:
            break
        }
    }
    
    fileprivate func applyOperation(operation: OperationType) {
        if operation == .modulus {
            if inputNumber != "" {
                lhsNumber = Double(inputNumber) ?? 0.0
                inputNumber = ""
                resultNumber = "\(lhsNumber / 100)"
                txtLabel.text = resultNumber
            }
        } else {
            if recentOperation != .nope {
                if inputNumber != "" {
                    rhsNumber = Double(inputNumber) ?? 0.0
                    inputNumber = ""
                    
                    switch operation {
                    case .addition:
                        resultNumber = "\(lhsNumber + rhsNumber)"
                    case .subtraction:
                        resultNumber = "\(lhsNumber - rhsNumber)"
                    case .multiplication:
                        resultNumber = "\(lhsNumber * rhsNumber)"
                    case .division:
                        resultNumber = "\(lhsNumber / rhsNumber)"
                    case .modulus:
                        break
                    case .nope:
                        break
                    }
                    
                    lhsNumber = Double(resultNumber) ?? 0.0
                    if Double(resultNumber)!.truncatingRemainder(dividingBy: 1) == 0 {
                        resultNumber = "\(Int(Double(resultNumber)!))"
                    }
                    txtLabel.text = resultNumber
                }
            } else {
                lhsNumber = Double(inputNumber) ?? 0.0
                inputNumber = ""
            }
            recentOperation = operation
        }
    }
}
