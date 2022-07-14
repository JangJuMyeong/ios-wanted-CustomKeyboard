//
//  ReviewTableViewHeader.swift
//  CustomKeyboard
//
//  Created by Mac on 2022/07/12.
//

import UIKit

class ReviewTableViewHeader: UITableViewHeaderFooterView {
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .lightGray
        
        return image
    }()
    
    let reviewTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.placeholder = "이 테마가 마음에 드시나요?"
        textField.addLeftPadding()
        textField.textColor = .secondaryLabel
        textField.backgroundColor = .secondarySystemBackground
        
        return textField
    }()
    
    private let writeButton: UIButton = {
        let button = UIButton()
        button.setTitle("작성", for: .normal)
        button.tintColor = .label
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray
        
        return button
    }()
    
    func setup() {
        layout()
    }
}

extension ReviewTableViewHeader {
    private func layout() {
        [
            profileImage,
            reviewTextField,
            writeButton
        ].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            
            reviewTextField.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            reviewTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: inset),
            reviewTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -74),
            reviewTextField.heightAnchor.constraint(equalToConstant: 40),
            
            writeButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            writeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            writeButton.widthAnchor.constraint(equalToConstant: 50),
            writeButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
