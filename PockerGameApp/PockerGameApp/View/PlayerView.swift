//
//  PlayerView.swift
//  PockerGameApp
//
//  Created by Jason on 2022/08/01.
//

import UIKit

class PlayerView: UIView, returnDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePlayerLayout()
//        getData(from: )
//        whenUserChoiceStudAndPlayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    let firstPlayer: UILabel = {
        let firstPlayer = UILabel()
        firstPlayer.text = "Player1"
        firstPlayer.textColor = .white
        firstPlayer.font = .systemFont(ofSize: 22, weight: .regular)
        firstPlayer.textAlignment = .left
        return firstPlayer
    }()
    
    let firstCardImage: UIImageView = {
       let firstCardImage = UIImageView()
        firstCardImage.image = UIImage(named: "c2")
        return firstCardImage
    }()
    
    //MARK: - ButtonView에서 data를 받아와서 처리해주는 프로퍼티와 메서드
    
    func dataReceived(data: Int) {
        print(data)
    }
    
//    func whenUserChoiceStudAndPlayer() {
//        if let stud = ButtonView.inputValue.first {
//            if stud == 7 || stud == 5 {
//                print("is collect")
//            }
//        }
//    }
    
    //MARK: - Player Image Layout
    func configurePlayerLayout() {
        self.addSubview(firstPlayer)
        firstPlayer.translatesAutoresizingMaskIntoConstraints = false
        firstPlayer.widthAnchor.constraint(equalToConstant: 70).isActive = true
        firstPlayer.heightAnchor.constraint(equalToConstant: 25).isActive = true
        firstPlayer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstPlayer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        
        self.addSubview(firstCardImage)
        firstCardImage.translatesAutoresizingMaskIntoConstraints = false
        firstCardImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        firstCardImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        firstCardImage.topAnchor.constraint(equalTo: firstPlayer.bottomAnchor).isActive = true
        firstCardImage.leadingAnchor.constraint(equalTo: firstPlayer.leadingAnchor).isActive = true
    }
    
    //MARK: - get InputValue Array
    func getData(from userInput: [Int]) {
        
    }
    
}
