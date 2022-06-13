//
//  NetworkManager.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import Foundation

class NetworkManager {

    // Fetches the general list of schools
    func fetchSchoolListAPI(callback: @escaping ([Schools]) -> Void) {

        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let _data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let schoolData = try decoder.decode([Schools].self, from: _data)

                DispatchQueue.main.async {
                    callback(schoolData)
                }

            } catch let error {
                print("There was an error fetching this item. Error: \(error)")
            }
        }

        request.resume()
    }

    // Fetches a target school via an ID
    func fetchSchoolDetails(with identifier: String? = nil, completion: @escaping ([Scores]) -> Void) {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        // let targetResult = all.filter{$0.keys.contains("sections")}

        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let detailData = try decoder.decode([Scores].self, from: data)

                DispatchQueue.main.async {
                    completion(detailData)
                }
            } catch let error {
                print("There was an error getting school details \(error)")
            }
        }

        request.resume()
    }
}
