//
//  SchoolDetailRequestCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import Foundation

class SchoolDetailRequestCoordinator {

    private let manager = NetworkManager()
    var completionHandler: (([Scores]) -> Void)?

    // Call this from main referencing coordinator
    func fetchDesignatedSchoolPerformance() {
        // Access the manager to perform the API fetch request
        manager.fetchSchoolDetails(with: nil) { result in
            // Perform operation assignment on main thread
            DispatchQueue.main.async {
                // Completion handler is assigned the result
                self.completionHandler?(result)
            }
        }
    }
}
