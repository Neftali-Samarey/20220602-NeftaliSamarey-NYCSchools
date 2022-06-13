//
//  SchoolDetailViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import Foundation

class SchoolDetailViewCoordinator {

    private let stackView = SchoolsDetailCardStackView()

    let coordinator: SchoolDetailCoordinator

    init(coordinator: SchoolDetailCoordinator) {
        self.coordinator = coordinator
    }

    func configureUI() {
        guard let view = coordinator.viewController.view else {
            return
        }

        view.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }

    func configure(with school: Schools) {
        stackView.configure(with: school)
    }
}
