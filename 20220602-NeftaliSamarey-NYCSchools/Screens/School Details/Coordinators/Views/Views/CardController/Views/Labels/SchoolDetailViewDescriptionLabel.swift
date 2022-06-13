//
//  SchoolDetailViewDescriptionLabel.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/8/22.
//

import UIKit

class SchoolDetailViewDescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "Roboto-Regular", size: 16)
        numberOfLines = 0
        textAlignment = .left
        textColor = UIColor.altDeepNavy
    }

    func configure(with text: String) {
        self.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
