//
//  ViewController.swift
//  CustomDialog
//
//  Created by Hmoo Myat Theingi on 30/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
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
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUpUI(){
        view.backgroundColor = .white
        
        view.addSubview(showDialogButton)
        
        
        showDialogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showDialogButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        showDialogButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showDialogButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(dialogView)
        
        dialogView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dialogView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dialogView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        dialogView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        showDialogButton.addTarget(self, action: #selector(showDialogButtonTapped), for: .touchUpInside)
    }
    
    @objc func showDialogButtonTapped(){
        print("showDialogButtonTapped from ViewController")
        dialogView.isHidden = false
    }

}

extension ViewController: CustomDialogViewDelegate{
    
    func okButtonTapped() {
        dialogView.isHidden = true
    }
    
}

