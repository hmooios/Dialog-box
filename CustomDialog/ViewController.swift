//
//  ViewController.swift
//  CustomDialog
//
//  Created by Hmoo Myat Theingi on 30/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var showCalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Calculation", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var showDialogButton : UIButton = {
        let button = UIButton()
        button.setTitle("Show Dialog", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var dialogView : CustomDialogView = {
        let view = CustomDialogView()
        view.delegate = self
        view.messageLabel.text = "Hello World"
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var calculateView: CustomCalculateView = {
        let view = CustomCalculateView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        calculateView.calculationResultHandler = {  result in
                   print("Result of adding is \(result)")
               }
    }
    
    private func setUpUI(){
        view.backgroundColor = .white
        
        view.addSubview(showDialogButton)
        
        showDialogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showDialogButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        showDialogButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showDialogButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(showCalculateButton)
        
        showCalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showCalculateButton.bottomAnchor.constraint(equalTo: showDialogButton.topAnchor, constant: -20).isActive = true
        showCalculateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showCalculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        view.addSubview(dialogView)
        
        dialogView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dialogView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        dialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        showDialogButton.addTarget(self, action: #selector(showDialogButtonTapped), for: .touchUpInside)
        
        view.addSubview(calculateView)
        
        calculateView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calculateView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        calculateView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        showCalculateButton.addTarget(self, action: #selector(showCalculateButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func showDialogButtonTapped(){
        print("showDialogButtonTapped from ViewController")
        dialogView.isHidden = false
    }
    @objc func showCalculateButtonTapped(){
        print("showCalculateButtonTapped from ViewController")
        calculateView.isHidden = false
    }
}

extension ViewController: CustomDialogViewDelegate{
    
    func okButtonTapped() {
        dialogView.isHidden = true
    }
    
}

