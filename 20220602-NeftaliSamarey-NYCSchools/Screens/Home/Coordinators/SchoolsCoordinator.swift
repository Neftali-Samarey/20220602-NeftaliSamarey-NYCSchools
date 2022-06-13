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

    // Configures and sets up some UI components i.e tableView, navigation bar, etc.
    func configure() {
        viewCoordinator.configureTableView()
        viewCoordinator.configureNavigationBar()
    }

    // Calls the viewCoordinator's reloadData method to reload the tableview
    func reloadData() {
        viewCoordinator.reloadData()
    }

    // Performs a fetch request to the API manager found on the request coordinator
    func fetchSchools() {
        // request
        requestCoordinator.fetchSchoolListRequest()

        requestCoordinator.completionHandler = { result in
            self.completionHandler?(result)
        }
    }

    func pushSchoolDetails(with details: Schools) {
        viewCoordinator.pushSchoolDetails(with: details)
    }
}
