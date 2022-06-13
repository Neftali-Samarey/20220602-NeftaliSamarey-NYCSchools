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

        coordinator.configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let school = school else {
            return
        }

        coordinator.configure(with: school)
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
