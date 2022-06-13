//
//  DetailCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import Foundation

class DetailCoordinator {

    lazy var viewCoordinartor = DetailViewCoordinator(coordinator: self)
    let controller: DetailViewController

    init(controller: DetailViewController) {
        self.controller = controller
    }

    // Configure the UI
    func configureUI() {
        viewCoordinartor.configureUI()
    }

    // Configure the School data
    func configure(with details: Schools) {
        viewCoordinartor.configure(with: details)
    }
}
