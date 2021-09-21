//
//  ImageTextView.swift
//  InfinityFeed
//
//  Created by Denis Valshchikov on 21.09.2021.
//

import UIKit

class ImageTextView: UIView {
    
    let imageView = UIImageView()
    let label = UILabel()
    let spacing: Int


    override init(frame: CGRect) {
        self.spacing = 0
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage?, text: String, spacing: Int) {
        if let iconImage = image {
            imageView.image = iconImage
            imageView.frame = CGRect(origin: .zero, size: iconImage.size)
        }
        
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        self.spacing = spacing
        super.init(frame: .zero)
        configuration()
    }
    
    
    private func configuration() {
        
        addSubview(imageView)
        addSubview(label)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat(spacing))
        ])
    }
}
