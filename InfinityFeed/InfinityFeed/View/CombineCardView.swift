//
//  CombineCardView.swift
//  InfinityFeed
//
//  Created by Sofia Lupeko on 21.09.2021.
//

import UIKit

class CombineCardView: UIView {
    
    let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    
    let diamondButton = UIButton(type: .system)
    let fullBottomContainer = FullBottomContainer()
    let likeView = UIImageView(image: UIImage(named: "like"))
    let dislikeView = UIImageView(image: UIImage(named: "dislike"))
    
    
    init(frame: CGRect, imageName: String) {
        fotoImageView.image = UIImage(named: imageName)
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        
        addSubview(fotoImageView)
        
        fotoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: topAnchor),
            fotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fotoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        addSubview(fullBottomContainer)
        addSubview(likeView)
        addSubview(dislikeView)
        createReaction()
        createFullBottomContainer()
        createDiamondButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createFullBottomContainer() {
        fullBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullBottomContainer.leadingAnchor.constraint(equalTo: fotoImageView.leadingAnchor),
            fullBottomContainer.trailingAnchor.constraint(equalTo: fotoImageView.trailingAnchor),
            fullBottomContainer.bottomAnchor.constraint(equalTo: fotoImageView.bottomAnchor),
        ])
    }
    
    private func createDiamondButton() {
        diamondButton.backgroundColor = .yellow
        diamondButton.layer.cornerRadius = 30
        diamondButton.clipsToBounds = true
        diamondButton.setImage(UIImage(named: "diamond"), for: .normal)
        diamondButton.tintColor = .black
        diamondButton.contentHorizontalAlignment = .center
        diamondButton.contentVerticalAlignment = .center
        addSubview(diamondButton)
        diamondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            diamondButton.centerYAnchor.constraint(equalTo: fotoImageView.topAnchor, constant: 90),
            diamondButton.centerXAnchor.constraint(equalTo: fotoImageView.trailingAnchor, constant: -60),
            diamondButton.widthAnchor.constraint(equalToConstant: 60),
            diamondButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    private func createReaction() {
        likeView.alpha = 0
        dislikeView.alpha = 0
        likeView.translatesAutoresizingMaskIntoConstraints = false
        dislikeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dislikeView.trailingAnchor.constraint(equalTo: fotoImageView.trailingAnchor, constant: -16),
            dislikeView.centerYAnchor.constraint(equalTo: fotoImageView.centerYAnchor),
            dislikeView.widthAnchor.constraint(equalToConstant: 80),
            dislikeView.heightAnchor.constraint(equalToConstant: 80),
            likeView.leadingAnchor.constraint(equalTo: fotoImageView.leadingAnchor, constant: 16),
            likeView.centerYAnchor.constraint(equalTo: fotoImageView.centerYAnchor),
            likeView.widthAnchor.constraint(equalToConstant: 80),
            likeView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
}
