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
    private let detailsStackView = SchoolsDetailCardVerticalDataStackView()

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
        distribution = .fill
        spacing = 10
        alignment = .center

        addArrangedSubview(dragView)
        addArrangedSubview(titleLabel)
        addArrangedSubview(detailsStackView)

        dragView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        dragView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        dragView.layer.cornerRadius = 2.5

        titleLabel.heightAnchor.constraint(equalToConstant: 115).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant:UIScreen.main.bounds.size.width - 20).isActive = true

        detailsStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 20).isActive = true
        detailsStackView.heightAnchor.constraint(equalToConstant: 200).isActive = true

    }

    func configure(with detail: Scores) {
        self.titleLabel.text = detail.school_name ?? "Name Unavailable"
        self.detailsStackView.configure(with: detail)
    }
}
