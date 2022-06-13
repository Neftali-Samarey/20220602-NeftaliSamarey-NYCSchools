//
//  SchoolDetailDescriptionTextView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/8/22.
//

import UIKit

class SchoolDetailDescriptionTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        self.translatesAutoresizingMaskIntoConstraints = false

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        isEditable = false
        isScrollEnabled = true
        font = UIFont(name: "Roboto-Regular", size: 16)
        textAlignment = .left
        textColor = UIColor.altDeepNavy
        isScrollEnabled = true
    }

    func configure(with details: String) {
        text = details
    }
}
