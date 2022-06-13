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

    func fetchDesignatedSchoolPerformance() {
        manager.fetchSchoolDetails(with: nil) { result in
            DispatchQueue.main.async {
                self.completionHandler?(result)
            }
        }
    }
}
