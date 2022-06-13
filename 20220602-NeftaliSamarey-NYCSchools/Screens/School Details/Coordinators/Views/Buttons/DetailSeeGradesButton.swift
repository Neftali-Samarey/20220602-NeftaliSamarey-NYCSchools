//
//  DetailSeeGradesButton.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import UIKit

class DetailSeeGradesButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Private method, non-accessible and only configures the buttons styles
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("See Academic Grades", for: .normal)
        self.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor.altDeepNavy
        self.layer.cornerRadius = 8
    }
}
