//
//  SchoolsDetailCardStackView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/8/22.
//

import UIKit

class SchoolsDetailCardStackView: UIStackView {

    // MARK: - UI Elements

    let dragView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray

        return view
    }()

    private let titleLabel = SchoolDetailViewTitleLabel()
    // private let descriptionLabel = SchoolDetailViewDescriptionLabel()
    private let descriptionTextView = SchoolDetailDescriptionTextView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStackView() {
        axis = .vertical
        distribution = .fillProportionally
        spacing = 10
        alignment = .center

        addArrangedSubview(dragView)
        addArrangedSubview(titleLabel)
        addArrangedSubview(descriptionTextView)

        dragView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        dragView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        dragView.layer.cornerRadius = 2.5

//        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 10).isActive = true
//        // titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
//        // titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true

    }

    func configure(with detail: Schools) {
        titleLabel.configure(with: detail.school_name)
        descriptionTextView.configure(with: detail.overview_paragraph)
    }
}
