//
//  SchoolDetailsViewController.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import UIKit

class DetailViewController: UIViewController {

    var school: Schools?

    lazy var coordinator = DetailCoordinator(controller: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.alabaster

        // Inital configuration of the UI
        coordinator.configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Check if school object is nil, if not, we send it off to the coordinator's configure method for use
        guard let school = school else {
            return
        }

        // We pass thie data to be configured
        coordinator.configure(with: school)
    }
}

// MARK: - Extending DetailViewController so we can use UIViewControllerTransitioningDelegate
extension DetailViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
