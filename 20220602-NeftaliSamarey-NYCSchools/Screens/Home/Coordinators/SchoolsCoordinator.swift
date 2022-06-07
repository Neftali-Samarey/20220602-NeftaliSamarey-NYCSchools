//
//  SchoolsCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import Foundation

class SchoolsCoordinator {

    lazy var viewCoordinator = SchoolsViewCoordinator(coordinator: self)
    let requestCoordinator = SchoolsRequestCoordinator()
    let viewController: SchoolsViewController

    var completionHandler: (([Schools]) -> Void)?

    init(viewController: SchoolsViewController) {
        self.viewController = viewController
    }

    func configure() {
        viewCoordinator.configureTableView()
        viewCoordinator.configureNavigationBar()
    }

    func reloadData() {
        viewCoordinator.reloadData()
    }

    func fetchSchools() {
        // request
        requestCoordinator.fetchSchoolListRequest()

        requestCoordinator.completionHandler = { result in
            self.completionHandler?(result)
        }
    }
}
