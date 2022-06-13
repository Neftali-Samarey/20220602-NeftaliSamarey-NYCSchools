//
//  SchoolDetailViewTitleLabel.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import UIKit

class SchoolDetailViewTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "Roboto-Medium", size: 26)
        numberOfLines = 0
        textAlignment = .left
        textColor = UIColor.deepNavy
    }

    func configure(with text: String) {
        self.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
