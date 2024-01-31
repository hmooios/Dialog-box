//
//  CustomDialogView.swift
//  CustomDialog
//
//  Created by Hmoo Myat Theingi on 30/01/2024.
//

import UIKit

class CustomDialogView: UIView {
    
    var delegate : CustomDialogViewDelegate?

    lazy var messageLabel:UILabel = {
        let label = UILabel()
       // label.text = "Hello world"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var okButton:UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .blue
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
        
        addSubview(messageLabel)
        addSubview(okButton)
        
           messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
           messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
           messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
           
           okButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20).isActive = true
           okButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
           okButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
           okButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
           okButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        okButton.addTarget(self, action: #selector(okButtonAction), for: .touchUpInside)
    }
    
    @objc private func okButtonAction(){
        print("okButtonAction from CustomDialogView")
        delegate?.okButtonTapped()
    }
}
