//
//  SchoolDetailViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import Foundation

class SchoolDetailViewCoordinator {

    private let stackView = SchoolsDetailCardStackView()
    private var scores: Scores?

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
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -275).isActive = true
    }

    // Assign the scores property with the new information obtained
    func configure(with scores: Scores) {
        self.scores = scores

        configureUIScores()
    }

    // Now we need to configure the UI
    private func configureUIScores() {
        guard let scores = scores else {
            return
        }

        // Finally, configure the StackView elements
        stackView.configure(with: scores)
    }
}
