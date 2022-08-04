//
//  ViewController.swift
//  PockerGameApp
//
//  Created by Jason on 2022/02/24.
//

import UIKit

class ViewController: UIViewController, returnDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackground()
        print("ViewController의 메모리에 View가 Load됨")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createButtonView()
        print("ViewController의 view가 Load됨")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController의 view가 화면에 나타남")
    }
    
    //Background 설정
    private func setBackground() {
        guard let patternImage: UIImage = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    // Screen의 Coordinate Value 찾기
    private func getScreenWidth() -> CGFloat {
        let bounds: CGRect = UIScreen.main.bounds // (0.0, 0.0, 390.0, 844.0)
        return bounds.width
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
    
    // MARK: - Step3
    private func testAboutCarddeck() {
        print("> 카드 초기화")
        var deck = Deck()
        
        if deck.count() == 52 {
            print("카드 전체를 초기화했습니다")
            print("총 \( deck.count() )장의 카드가 있습니다.")
        } else {
            print("카드 초기화에 실패하였습니다.")
        }
        
        print()
        print("> 카드 섞기")
        deck.shuffle()
        print("전체 \( deck.count() )장의 카드를 섞었습니다.")
        
        print()
        print("> 카드 하나 뽑기")
        let currentCount = deck.count()
        print( deck.removeOne() )
        
        if currentCount-1 == deck.count() {
            print("총 \(deck.count())장의 카드가 남아있습니다.")
        } else {
            print("잘못된 카드 뽑기가 실행되었습니다.")
        }
        
        print()
        print("> 카드 리셋")
        deck.reset()
        if deck.count() == 52 {
            print("리셋된 카드는 \(deck.count())입니다.")
        } else {
            print("잘못된 리셋이 실행되었습니다.")
        }
    }
    
    // MARK: - step5
    private func createButtonView() {
        let customButtonView = ButtonView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: 200))
        view.addSubview(customButtonView)
        customButtonView.delegate = self
    }
    
    func dataReceived(data: Int) {
        print("\(data)")
    }
    
    private func createPlayerView() {
        let customPlayerView = PlayerView(frame: CGRect(x:0, y: 200, width: UIScreen.main.bounds.width, height: 650))
        view.addSubview(customPlayerView)
    }
    
}
