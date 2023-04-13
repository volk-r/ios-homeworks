//
//  CustomButton.swift
//  Navigation
//
//  Created by Roman Romanov on 13.04.2023.
//

import UIKit

class CustomButton: UIButton {

    var buttonAction: (() -> Void)?
    
    init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        buttonAction?()
    }

}
