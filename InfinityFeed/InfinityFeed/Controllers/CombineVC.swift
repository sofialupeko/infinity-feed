//
//  CombineVC.swift
//  InfinityFeed
//
//  Created by Denis Valshchikov on 21.09.2021.
//

import UIKit

class CombineVC: UIViewController {
    
    var model: Model
    
    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        createCards()
    }
    
    @objc private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
        if let card = sender.view as? CombineCardView {
            let point = sender.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x,
                                  y: view.center.y + point.y
            )
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if point.x > 0 {
                card.likeView.alpha = rotationAngle * 8
                card.dislikeView.alpha = 0
            } else {
                card.dislikeView.alpha = rotationAngle * -8
                card.likeView.alpha = 0
            }
            
            if sender.state == .ended {
                if card.center.x > self.view.bounds.width {
                    UIView.animate(withDuration: 0.3) {
                        card.center.x += self.view.bounds.width
                        card.alpha = 0
                    } completion: { _ in
                        card.removeFromSuperview()
                        print("like")
                    }
                } else if card.center.x < 0 {
                    UIView.animate(withDuration: 0.3) {
                        card.center.x -= self.view.bounds.width
                        card.alpha = 0
                    } completion: { _ in
                        card.removeFromSuperview()
                        print("dislike")
                    }
                } else {
                    UIView.animate(withDuration: 0.2) {
                        card.center = self.view.center
                        card.transform = .identity
                        card.dislikeView.alpha = 0
                        card.likeView.alpha = 0
                    }
                }
            }
        }
    }
    
    private func createCards() {
        for item in model.imageNames {
            let cardFrame = CGRect(x: 0,
                                   y: 0,
                                   width: view.bounds.width,
                                   height: view.bounds.height
            )
            let card = CombineCardView(frame: cardFrame, imageName: item)
            
            card.center = view.center
            
            let panGestureRecognizer = UIPanGestureRecognizer()
            panGestureRecognizer.addTarget(self, action: #selector(panGestureHandler))
            card.addGestureRecognizer(panGestureRecognizer)
            view.insertSubview(card, at: 0)
        }
        
    }
    
    
}

