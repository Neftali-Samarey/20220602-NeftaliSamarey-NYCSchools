//
//  DetailViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import Foundation

class DetailViewCoordinator {

    let stackView = DetailViewStackView()

    let coordinator: DetailCoordinator

    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
    }

    func configureUI() {
        let controller = coordinator.controller
        controller.view.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -10).isActive = true
    }

    func configure(with detail: Schools) {
        //
    }
}
