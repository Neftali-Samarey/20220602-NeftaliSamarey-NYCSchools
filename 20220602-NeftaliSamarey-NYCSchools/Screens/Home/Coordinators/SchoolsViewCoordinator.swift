//
//  SchoolsViewCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import UIKit

class SchoolsViewCoordinator {

    private lazy var tableView = SchoolsTableView()
    private lazy var activityView = UIActivityIndicatorView(style: .medium)
    private lazy var detailCardSlider = SchoolDetailViewControllerCard()

    let coordinator: SchoolsCoordinator

    init(coordinator: SchoolsCoordinator) {
        self.coordinator = coordinator

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        detailCardSlider.view.addGestureRecognizer(panGesture)
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
    }

    // MARK: Slider
    func presentSchoolDetails(with details: Schools) {
        let controller = coordinator.viewController
        detailCardSlider.modalPresentationStyle = .custom
        detailCardSlider.transitioningDelegate = controller
        detailCardSlider.school = details

        controller.present(detailCardSlider, animated: true, completion: nil)
    }

    @objc
    func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: detailCardSlider.view)
        let dragPercentage = max(0, sender.translation(in: detailCardSlider.view).y) / detailCardSlider.view.frame.height

        // View is not allowed to be dragged upward
        guard translation.y >= 0 else {
            return
        }

        // Constrain dragging view up/down
        detailCardSlider.view.frame.origin = CGPoint(x: 0, y: detailCardSlider.pointOrigin!.y + translation.y)

        switch sender.state {
        case .ended:
            let dragVelocity = sender.velocity(in: detailCardSlider.view)

            if dragPercentage > 0.5 || dragVelocity.y >= 1300 {
                self.detailCardSlider.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.1) {
                    self.detailCardSlider.view.frame.origin = self.detailCardSlider.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }

        default:
            break
        }
    }
}
