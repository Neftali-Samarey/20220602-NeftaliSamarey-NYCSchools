//
//  DetailViewStackView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import UIKit

class DetailViewStackView: UIStackView {

    private let textview = SchoolDetailDescriptionTextView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        spacing = 10
        distribution = .fill

        addArrangedSubview(textview)

        textview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        textview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 20).isActive = true
    }

    func configure(with description: String) {
        textview.text = description
    }
}
