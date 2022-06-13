//
//  SchoolsDetailCardVerticalDataSATReadingCriticalStackView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/13/22.
//

import UIKit

class SchoolsDetailCardVerticalDataSATReadingCriticalStackView: UIStackView {

    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit

        return imageview
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Medium", size: 17.0)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStackView() {
        axis = .horizontal
        distribution = .fill
        spacing = 10

        // Configure Imageview
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        if let image = UIImage(named: "readingAvg") {
            imageView.image = image
        }

        addArrangedSubview(imageView)
        addArrangedSubview(descriptionLabel)
    }

    func configure(with description: String) {
        descriptionLabel.text = "Critical Reading Average Score: \(description)"
    }
}
