//
//  SchoolDetailViewControllerCard.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import UIKit

class SchoolDetailViewControllerCard: UIViewController {

    var school: Schools?

    public var hasSetPointOrigin = false
    public var pointOrigin: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let school = school else {
            return
        }

        // configure view
    }

    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
}
