//
//  GameView.swift
//  PockerGameApp
//
//  Created by Jason on 2022/08/26.
//

import UIKit

class PlayerCardView: UIView {
    
    let name = UILabel()
    let cardStachView = UIStackView()
    let cards: [UIImageView] = (0..<7).map{ _ in UIImageView() }
    let winnerMark = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        attribute()
    }
    
    private func attribute() {
        
        self.backgroundColor = .black
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        
        cardStachView.spacing = 0
        cardStachView.axis = .horizontal
        cardStachView.distribution = .fillEqually
        
        name.font = .systemFont(ofSize: 25)
        name.textColor = .white
        
        cards.forEach{
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 5
        }
        
        winnerMark.image = UIImage(named: "winner")
        winnerMark.isHidden = true
    }
    
    func layout() {
        self.contentScaleFactor = 2
        self.addSubview(name)
        let nameHeight = 30.0
        name.frame = CGRect(x: 15, y: 5, width: 10, height: nameHeight)
        
        self.addSubview(winnerMark)
        self.addSubview(cardStachView)
        let offset = 10.0
        let cardWidth = (self.frame.width - offset * 2) / 7.0
        cardStachView.frame = CGRect(x: offset, y: name.frame.maxY + 10.0,
                                     width: cardWidth * 7.0, height: cardWidth * 1.27)
        cards.enumerated().forEach { index, view in
            cardStachView.addArrangedSubview(view)
        }
    }
    
    func resetPockerBoard(pockerStud: PokerGame.Stud, name: String?) {
        self.alpha = name != nil ? 1: 0
        self.name.text = name
        self.name.sizeToFit()
        
        winnerMark.frame = CGRect(x: self.name.frame.maxX + 5.0, y: 5, width: 30, height: 30)
        winnerMark.isHidden = true
        
        cards.enumerated().forEach {
            $1.alpha = $0 < pockerStud.cardCount ? 1 : 0
            $1.image = UIImage(named: "card-back")
        }
    }
    
    func setCard(at index: Int, card: Card) {
        cards[index].image = UIImage(named: "\(card)")
    }
    
    func setWinner(winner: String?) {
        winnerMark.isHidden = !(winner != nil && name.text == winner)
    }
}


