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

    func fetchSchoolListRequest() {
        manager.fetchSchoolListAPI { results in
            DispatchQueue.main.async {
                self.completionHandler?(results)
            }
        }
    }
}
