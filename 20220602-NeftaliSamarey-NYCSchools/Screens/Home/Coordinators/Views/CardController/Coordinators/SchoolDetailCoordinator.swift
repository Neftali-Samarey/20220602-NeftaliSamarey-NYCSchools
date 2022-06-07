//
//  SchoolDetailCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import Foundation

class SchoolDetailCoordinator {

    lazy var viewCoordinator = SchoolDetailViewCoordinator(coordinator: self)
    let viewController: SchoolDetailViewControllerCard

    init(viewController: SchoolDetailViewControllerCard) {
        self.viewController = viewController
    }
}
