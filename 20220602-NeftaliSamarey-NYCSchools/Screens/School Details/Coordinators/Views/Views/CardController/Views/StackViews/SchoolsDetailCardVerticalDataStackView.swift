//
//  SchoolsDetailCardVerticalDataStackView.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/13/22.
//

import UIKit

class SchoolsDetailCardVerticalDataStackView: UIStackView {

    private let satTestTakersStackView = SchoolsDetailCardVerticalDataSATTestStackView()
    private let criticalWritingStackView = SchoolsDetailCardVerticalDataSATReadingCriticalStackView()
    private let mathAverageStackView = SchoolsDetailCardVerticalDataMathAvgStackView()
    private let reaadingAverageStackView = SchoolsDetailCardVerticalDataReadingAvgStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false

        configureStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStackView() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 0
        alignment = .leading

        addArrangedSubview(satTestTakersStackView)
        addArrangedSubview(criticalWritingStackView)
        addArrangedSubview(mathAverageStackView)
        addArrangedSubview(reaadingAverageStackView)
    }

    func configure(with score: Scores) {
        satTestTakersStackView.configure(with: score.num_of_sat_test_takers ?? "N/A")
        criticalWritingStackView.configure(with: score.sat_critical_reading_avg_score ?? "N/A")
        mathAverageStackView.configure(with: score.sat_math_avg_score ?? "N/A")
        reaadingAverageStackView.configure(with: score.sat_writing_avg_score ?? "N/A")
    }
}
