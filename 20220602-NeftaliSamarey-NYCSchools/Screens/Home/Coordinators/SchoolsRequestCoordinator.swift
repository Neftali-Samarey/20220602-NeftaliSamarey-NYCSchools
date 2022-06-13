//
//  SchoolsRequestCoordinator.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import Foundation

class SchoolsRequestCoordinator {

    private let manager = NetworkManager()

    var completionHandler: (([Schools]) -> Void)?

    // We perform a call to this method in order to obtain an array of Schools
    func fetchSchoolListRequest() {
        manager.fetchSchoolListAPI { results in
            // Perform operation this on the main thread
            DispatchQueue.main.async {
                // Assign what we've obtained to a completion handler for later use.
                self.completionHandler?(results)
            }
        }
    }
}
