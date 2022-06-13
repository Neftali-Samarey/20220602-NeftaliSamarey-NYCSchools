//
//  SchoolDetailCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import Foundation

class SchoolDetailCoordinator {

    lazy var viewCoordinator = SchoolDetailViewCoordinator(coordinator: self)
    let requestCoordinator = SchoolDetailRequestCoordinator()
    let viewController: SchoolDetailViewControllerCard

    var completionHandler: (([Scores]) -> Void)?
    var result: [Scores]?
    var score: Scores?

    init(viewController: SchoolDetailViewControllerCard) {
        self.viewController = viewController

        viewCoordinator.configureUI()
    }

    func configure(with details: Schools) {
        // viewCoordinator.configure(with: details)
    }

    func fetchDetails(with dbn: String) {

        // Fetch the school details (all of the JSON for now)
        requestCoordinator.fetchDesignatedSchoolPerformance()

        // Grab the completion handler to obtain the data and extract here
        requestCoordinator.completionHandler = { result in
            if result.isEmpty {
                return
            }

            self.indexResult(with: dbn, result: result)
        }
    }

    private func indexResult(with dbn: String, result: [Scores]) {
        let filteredResult = result.filter{ $0.dbn.contains(dbn) }

        // Align the elements from the filtered result
        for i in filteredResult.enumerated() {
            if i.element.dbn == dbn {
                self.score = Scores(dbn: i.element.dbn,
                                    school_name: i.element.school_name,
                                    num_of_sat_test_takers: i.element.num_of_sat_test_takers,
                                    sat_critical_reading_avg_score: i.element.sat_critical_reading_avg_score,
                                    sat_math_avg_score: i.element.sat_math_avg_score,
                                    sat_writing_avg_score: i.element.sat_writing_avg_score)
            }
        }

        // Send the data back to the view coordinator now that we've configured it.
        guard let score = score else {
            print("An error occured")
            return
        }

        viewCoordinator.configure(with: score)
    }
}
