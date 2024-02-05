//
//  CustomCalculateView.swift
//  CustomDialog
//
//  Created by Hmoo Myat Theingi on 05/02/2024.
//

import UIKit

class CustomCalculateView: UIView {
    
    var calculationResultHandler: ((Int) -> Void)?

    lazy var textfield1: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter a number"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var textfield2: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter a number"
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        addSubview(textfield1)
        
        textfield1.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        textfield1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        textfield1.widthAnchor.constraint(equalToConstant: 140).isActive = true
        textfield1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(textfield2)
        
        textfield2.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        textfield2.leadingAnchor.constraint(equalTo: textfield1.trailingAnchor, constant: 10).isActive = true
        textfield2.widthAnchor.constraint(equalToConstant: 140).isActive = true
        textfield2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(addButton)
        
        addButton.topAnchor.constraint(equalTo: textfield1.bottomAnchor, constant: 20).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        
    }
    
    @objc private func addButtonTapped() {
            if let number1 = Int(textfield1.text ?? ""), let number2 = Int(textfield2.text ?? "") {
                let result = number1 + number2
                calculationResultHandler?(result)
                isHidden = true
            } else {
                isHidden = true
                print("Invalid input. Please enter valid integers in both fields.")
            }
        }
    
    
    
}
