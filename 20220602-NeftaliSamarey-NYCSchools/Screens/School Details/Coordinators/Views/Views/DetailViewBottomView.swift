//
//  DetailViewBottomView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import UIKit

protocol DetailViewBottomViewDelegate: AnyObject {
    func didSelectViewGrades()
}

class DetailViewBottomView: UIView {

    let button = DetailSeeGradesButton()
    weak var delegate: DetailViewBottomViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear

        addSubview(button)

        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true

        // configure the recognizer for the button
        button.addTarget(self, action: #selector(didSelectItem), for: .touchUpInside)
    }

    @objc
    func didSelectItem() {
        self.delegate?.didSelectViewGrades()
    }
}
