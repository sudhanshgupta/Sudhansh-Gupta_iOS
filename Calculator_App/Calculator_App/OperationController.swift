//
//  OperationController.swift
//  Calculator_App
//
//  Created by Sudhansh Gupta on 17/11/22.
//

import Foundation

class OperationController {
    
    func applyOperation(on inputModel: InputModel) -> String {
        var resultNumber = "0.0"
        switch inputModel.operationType {
        case .addition:
            resultNumber = "\(inputModel.lhsNumber + inputModel.rhsNumber)"
        case .subtraction:
            resultNumber = "\(inputModel.lhsNumber - inputModel.rhsNumber)"
        case .multiplication:
            resultNumber = "\(inputModel.lhsNumber * inputModel.rhsNumber)"
        case .division:
            resultNumber = "\(inputModel.lhsNumber / inputModel.rhsNumber)"
        case .modulus:
            resultNumber = "\(inputModel.lhsNumber / 100)"
        case .nope:
            break
        }
        if Double(resultNumber)!.truncatingRemainder(dividingBy: 1) == 0 {
            resultNumber = "\(Int(Double(resultNumber)!))"
        }
        return resultNumber
    }
}
