//
//  CustomButton.swift
//  Calculator_App
//
//  Created by Sudhansh Gupta on 16/11/22.
//

import UIKit

final class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView() {
        layer.cornerRadius = bounds.height / 2
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        setTitleColor(.white, for: .normal)
    }
}
