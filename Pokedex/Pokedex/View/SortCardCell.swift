//
//  SortCardCell.swift
//  Poxedex
//
//  Created by chvck on 3.11.2023.
//

import UIKit

class CustomPopupView: UIView {
    
    let sortByLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sort by:"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Number"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    

    let checkmark1: UIControl = {
        let view = UIControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8 // Yuvarlak işaretleme kutucuğunun boyutunu ve yuvarlaklığını ayarla
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.red.cgColor
        view.backgroundColor = .clear // Başlangıçta boş olacak
        view.addTarget(self, action: #selector(checkmark1Changed), for: .touchUpInside)
        return view
    }()
    
    let checkmark2: UIControl = {
        let view = UIControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8 // Yuvarlak işaretleme kutucuğunun boyutunu ve yuvarlaklığını ayarla
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.red.cgColor
        view.backgroundColor = .clear // Başlangıçta boş olacak
        view.addTarget(self, action: #selector(checkmark2Changed), for: .touchUpInside)
        return view
    }()
  
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        
        addSubview(sortByLabel)
        addSubview(numberLabel)
        addSubview(nameLabel)
        addSubview(checkmark1)
        addSubview(checkmark2)
  
        
        NSLayoutConstraint.activate([
            
            sortByLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            sortByLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            
            numberLabel.topAnchor.constraint(equalTo: sortByLabel.bottomAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: checkmark1.leadingAnchor, constant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: checkmark2.leadingAnchor, constant: 30),
            
            checkmark1.centerYAnchor.constraint(equalTo: numberLabel.centerYAnchor),
            checkmark1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            checkmark1.widthAnchor.constraint(equalToConstant: 16),
            checkmark1.heightAnchor.constraint(equalToConstant: 16),
            
            checkmark2.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            checkmark2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            checkmark2.widthAnchor.constraint(equalToConstant: 16),
            checkmark2.heightAnchor.constraint(equalToConstant: 16),
            
      
        ])
        
        
        
    }
    
    @objc private func checkmark1Changed() {
        checkmark1.backgroundColor = .red
        checkmark2.backgroundColor = .clear

    }
    
    @objc private func checkmark2Changed() {
        checkmark2.backgroundColor = .red
        checkmark1.backgroundColor = .clear

    }
    
    
    
    
    

  
    
}




