//
//  FullBottomContainer.swift
//  InfinityFeed
//
//  Created by Sofia Lupeko on 21.09.2021.
//

import UIKit

final class FullBottomContainer: UIView {
    private var starContainer: ImageTextView
    private var nameContainer: ImageTextView
    private let buyButton: ActionButton = {
        let button = ActionButton()
        button.setImage(UIImage(named: "buy"), for: .normal)
        button.setTitle("Buy", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    private let shareButton: ActionButton = {
        let button = ActionButton()
        button.setImage(UIImage(named: "share"), for: .normal)
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return button
    }()
    private let mainHashtag: UILabel = {
        let label = UILabel()
        label.text = "For #Ice_Bucket_Challenge"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    private let hashtags: UILabel = {
        let label = UILabel()
        label.text = "#Ice #Bucket #Challenge"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    private let gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        let midBlack = UIColor(white: 0, alpha: 0.35)
        gradient.type = .axial
        gradient.colors = [
            UIColor.clear.cgColor,
            midBlack.cgColor,
            UIColor.black.cgColor
        ]
        gradient.locations = [0, 0.25, 1]
        return gradient
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    override init(frame: CGRect) {
        nameContainer = ImageTextView(
            image: UIImage(named: "icon"),
            text: "@Wade Warren",
            spacing: 12
        )
        starContainer = ImageTextView(
            image: UIImage(named: "stars"),
            text: "Butterfly make",
            spacing: 4
        )
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.layer.addSublayer(gradient)
        addSubview(starContainer)
        addSubview(nameContainer)
        addSubview(mainHashtag)
        addSubview(hashtags)
        addSubview(buyButton)
        addSubview(shareButton)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        nameContainer.translatesAutoresizingMaskIntoConstraints = false
        starContainer.translatesAutoresizingMaskIntoConstraints = false
        mainHashtag.translatesAutoresizingMaskIntoConstraints = false
        hashtags.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            starContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            starContainer.topAnchor.constraint(equalTo: self.topAnchor),
            nameContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameContainer.topAnchor.constraint(equalTo: starContainer.bottomAnchor, constant: 18),
            mainHashtag.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainHashtag.topAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: 8),
            hashtags.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            hashtags.topAnchor.constraint(equalTo: mainHashtag.bottomAnchor, constant: 12),
            hashtags.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            buyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buyButton.topAnchor.constraint(equalTo: self.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            shareButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 19)  
        ])
    }
}
