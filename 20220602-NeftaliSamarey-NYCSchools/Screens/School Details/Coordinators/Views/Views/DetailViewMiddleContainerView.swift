//
//  DetailViewMiddleContainerView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/13/22.
//

import UIKit

class DetailViewMiddleContainerView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.deepNavy

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 8

        addSubview(titleLabel)

        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }

    func configure(with title: String) {
        titleLabel.text = title
    }
}
