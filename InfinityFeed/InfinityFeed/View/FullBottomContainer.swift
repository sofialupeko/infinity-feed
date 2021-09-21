//
//  FullBottomContainer.swift
//  InfinityFeed
//
//  Created by Denis Valshchikov on 21.09.2021.
//

import UIKit

class FullBottomContainer: UIView {
    var starContainer = ImageTextView()
    var nameContainer = ImageTextView()
    let buyButton = ActionButton()
    let shareButton = ActionButton()
    let mainHashtag = UILabel()
    let hashtags = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameContainer = ImageTextView(image: UIImage(named: "icon"), text: "@Wade Warren", spacing: 12)
        starContainer = ImageTextView(image: UIImage(named: "stars"), text: "Butterfly make", spacing: 4)
        createMainHashtag()
        createHashtags()
        createBuyButton()
        createShareButton()
        
        
        addSubview(starContainer)
        addSubview(nameContainer)
        addSubview(mainHashtag)
        addSubview(hashtags)
        addSubview(buyButton)
        addSubview(shareButton)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createMainHashtag() {
        mainHashtag.text = "For #Ice_Bucket_Challenge"
        mainHashtag.font = UIFont.systemFont(ofSize: 16)
        mainHashtag.textColor = .white
    }
    private func createHashtags() {
        hashtags.text = "#Ice #Bucket #Challenge"
        hashtags.font = UIFont.systemFont(ofSize: 12)
        hashtags.textColor = .white
    }
    private func createBuyButton() {
        buyButton.setImage(UIImage(named: "buy"), for: .normal)
        buyButton.setTitle("Buy", for: .normal)
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    }
    private func createShareButton() {
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        shareButton.setTitle("Share", for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    }
    
    private func configure() {
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
