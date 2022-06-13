//
//  SchoolsViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import UIKit
import SKActivityIndicatorView

class SchoolsViewCoordinator {

    private lazy var tableView = SchoolsTableView()
    private lazy var activityView = UIActivityIndicatorView(style: .medium)

    private lazy var detailViewController = DetailViewController()

    let coordinator: SchoolsCoordinator

    init(coordinator: SchoolsCoordinator) {
        self.coordinator = coordinator
    }

    func configureTableView() {
        let controller = coordinator.viewController

        tableView.delegate = controller
        tableView.dataSource = controller

        controller.view.addSubview(tableView)

        tableView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: 0).isActive = true
    }

    func configureNavigationBar() {
        coordinator.viewController.title = "NYC Schools"
        coordinator.viewController.navigationController?.navigationBar.prefersLargeTitles = true
    }

    func reloadData() {
        tableView.reloadData()
        SKActivityIndicator.dismiss()
    }

    func showProgressIndicator() {
        SKActivityIndicator.show("Loading Data...")
    }


    // MARK: - View Controller
    func pushSchoolDetails(with details: Schools) {
        detailViewController.school = details
        coordinator.viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
