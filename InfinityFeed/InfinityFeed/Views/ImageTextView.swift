//
//  ImageTextView.swift
//  InfinityFeed
//
//  Created by Sofia Lupeko on 21.09.2021.
//

import UIKit

final class ImageTextView: UIView {
    
    private let imageView = UIImageView()
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    private let spacing: Int
    
    init(image: UIImage?, text: String, spacing: Int) {
        if let iconImage = image {
            imageView.image = iconImage
        }
        self.label.text = text
        self.spacing = spacing
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
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
