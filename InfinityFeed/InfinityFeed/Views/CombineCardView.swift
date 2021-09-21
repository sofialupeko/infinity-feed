//
//  CombineCardView.swift
//  InfinityFeed
//
//  Created by Sofia Lupeko on 21.09.2021.
//

import UIKit

final class CombineCardView: UIView {
    
    internal let likeView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "like"))
        imageView.alpha = 0
        return imageView
    }()
    internal let dislikeView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dislike"))
        imageView.alpha = 0
        return imageView
    }()
    private let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let diamondButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.setImage(UIImage(named: "diamond"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        return button
    }()
    private let fullBottomContainer = FullBottomContainer()
    
    
    init(frame: CGRect, imageName: String) {
        fotoImageView.image = UIImage(named: imageName)
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .tertiarySystemBackground
        
        addSubview(fotoImageView)
        addSubview(fullBottomContainer)
        addSubview(likeView)
        addSubview(dislikeView)
        addSubview(diamondButton)
        
        diamondButton.translatesAutoresizingMaskIntoConstraints = false
        likeView.translatesAutoresizingMaskIntoConstraints = false
        dislikeView.translatesAutoresizingMaskIntoConstraints = false
        fotoImageView.translatesAutoresizingMaskIntoConstraints = false
        fullBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: topAnchor),
            fotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fotoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
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
        NSLayoutConstraint.activate([
            fullBottomContainer.leadingAnchor.constraint(equalTo: fotoImageView.leadingAnchor),
            fullBottomContainer.trailingAnchor.constraint(equalTo: fotoImageView.trailingAnchor),
            fullBottomContainer.bottomAnchor.constraint(equalTo: fotoImageView.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            diamondButton.centerYAnchor.constraint(equalTo: fotoImageView.topAnchor, constant: 90),
            diamondButton.centerXAnchor.constraint(equalTo: fotoImageView.trailingAnchor, constant: -60),
            diamondButton.widthAnchor.constraint(equalToConstant: 60),
            diamondButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
