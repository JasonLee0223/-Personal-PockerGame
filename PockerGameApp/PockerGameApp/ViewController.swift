//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Jason on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //Background 설정
    private func setBackground() {
        guard let patternImage: UIImage = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    // Image 생성하여 반환
    private func createCardImage() -> UIImageView {
        let imageCard = UIImageView()
        imageCard.image = UIImage(named: "card-back.png")
        return imageCard
    }
    
    // 카드 7개 만들기
    private func createCardRect() {
        let numberOfCard = 7
        for cardCount in 0...numberOfCard {
            let card = createCardImage()
            
            let cardWidth = getScreenWidth() / CGFloat(numberOfCard)
            let cardHeight = cardWidth * 1.27
            let cardCoordinateX = (CGFloat(cardCount) * cardWidth)
            let cardCoordinateY = CGFloat(50)
            
            card.frame = CGRect(x: cardCoordinateX, y: cardCoordinateY, width: cardWidth, height: cardHeight)
            view.addSubview(card)
        }
    }
    
}
