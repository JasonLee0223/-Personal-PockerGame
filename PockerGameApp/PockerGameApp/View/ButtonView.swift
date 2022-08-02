//
//  CardView.swift
//  PockerGameApp
//
//  Created by Jason on 2022/05/19.
//

import UIKit

class ButtonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStudButtonLayout()
        configurePeopleButtonLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private(set) var inputValue = [Int]()
    
    let sevenStudButton: UIButton = {
        let sevenStud = UIButton()
        sevenStud.setTitle("7 Cards", for: .normal)
        sevenStud.setTitleColor(.white, for: .normal)
        sevenStud.layer.borderWidth = 1
        sevenStud.layer.borderColor = UIColor.white.cgColor
        sevenStud.layer.cornerRadius = 10
        return sevenStud
    }()
    
    let fiveStudButton: UIButton = {
        let fiveStud = UIButton()
        fiveStud.setTitle("5 Cards", for: .normal)
        fiveStud.setTitleColor(.white, for: .normal)
        fiveStud.layer.borderWidth = 1
        fiveStud.layer.borderColor = UIColor.white.cgColor
        fiveStud.layer.cornerRadius = 10
        return fiveStud
    }()
    
    let twoPeopleButton: UIButton = {
        let twoPeople = UIButton()
        twoPeople.setTitle("2명", for: .normal)
        twoPeople.setTitleColor(.white, for: .normal)
        twoPeople.layer.borderWidth = 1
        twoPeople.layer.borderColor = UIColor.white.cgColor
        twoPeople.layer.cornerRadius = 5
        return twoPeople
    }()
    
    let threePeopleButton: UIButton = {
        let threePeople = UIButton()
        threePeople.setTitle("3명", for: .normal)
        threePeople.setTitleColor(.white, for: .normal)
        threePeople.layer.borderWidth = 1
        threePeople.layer.borderColor = UIColor.white.cgColor
        threePeople.layer.cornerRadius = 5
        return threePeople
    }()
    
    let fourPeopleButton: UIButton = {
        let fourPeople = UIButton()
        fourPeople.setTitle("4명", for: .normal)
        fourPeople.setTitleColor(.white, for: .normal)
        fourPeople.layer.borderWidth = 1
        fourPeople.layer.borderColor = UIColor.white.cgColor
        fourPeople.layer.cornerRadius = 5
        return fourPeople
    }()
    
    //MARK: - Stud Button Layout
    func configureStudButtonLayout() {
        self.addSubview(sevenStudButton)
        sevenStudButton.translatesAutoresizingMaskIntoConstraints = false
        sevenStudButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        sevenStudButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sevenStudButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        sevenStudButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 125).isActive = true
        sevenStudButton.addTarget(self, action: #selector(receiveInput(value:)), for: .touchUpInside)
        
        self.addSubview(fiveStudButton)
        fiveStudButton.translatesAutoresizingMaskIntoConstraints = false
        fiveStudButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fiveStudButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fiveStudButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        fiveStudButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -125).isActive = true
        fiveStudButton.addTarget(self, action: #selector(receiveInput(value:)), for: .touchUpInside)
    }
    
    //MARK: - People Button Layout
    func configurePeopleButtonLayout() {
        self.addSubview(twoPeopleButton)
        twoPeopleButton.translatesAutoresizingMaskIntoConstraints = false
        twoPeopleButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        twoPeopleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        twoPeopleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 135).isActive = true
        twoPeopleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 125).isActive = true
        twoPeopleButton.addTarget(self, action: #selector(receiveInput(value:)), for: .touchUpInside)
        
        self.addSubview(threePeopleButton)
        threePeopleButton.translatesAutoresizingMaskIntoConstraints = false
        threePeopleButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        threePeopleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        threePeopleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 135).isActive = true
        threePeopleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 170).isActive = true
        threePeopleButton.addTarget(self, action: #selector(receiveInput(value:)), for: .touchUpInside)
        
        self.addSubview(fourPeopleButton)
        fourPeopleButton.translatesAutoresizingMaskIntoConstraints = false
        fourPeopleButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        fourPeopleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fourPeopleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 135).isActive = true
        fourPeopleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -125).isActive = true
        fourPeopleButton.addTarget(self, action: #selector(receiveInput(value:)), for: .touchUpInside)
    }
    
    //MARK: - addTarget Method
    @objc func receiveInput(value sender: UIButton) {
        guard let digit = sender.currentTitle?.first else { return }
        guard let convertToInt = Int(String(digit)) else { return }
        if digit != " " {
            inputValue.append(convertToInt)
        }
        
        switch convertToInt {
        case 7:
            sevenStudButton.backgroundColor = .white
            sevenStudButton.setTitleColor(.black, for: .normal)
        case 5:
            fiveStudButton.backgroundColor = .white
            fiveStudButton.setTitleColor(.black, for: .normal)
        case 2:
            twoPeopleButton.backgroundColor = .white
            twoPeopleButton.setTitleColor(.black, for: .normal)
        case 3:
            threePeopleButton.backgroundColor = .white
            threePeopleButton.setTitleColor(.black, for: .normal)
        case 4:
            fourPeopleButton.backgroundColor = .white
            fourPeopleButton.setTitleColor(.black, for: .normal)
        default:
            print("This value is outside the set range.")
        }
    }
    
}
