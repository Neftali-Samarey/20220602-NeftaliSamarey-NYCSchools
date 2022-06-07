//
//  NetworkManager.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import Foundation

class NetworkManager {

    func getSchools(completion: @escaping (Swift.Result<[Schools], Error>) -> ()) {

        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let _data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let schoolData = try decoder.decode([Schools].self, from: _data)

                completion(.success(schoolData))

            } catch let error {
                completion(.failure(error))
            }
        }

        request.resume()
    }

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

    func fetchSchoolList() -> [Schools]? {
        var schoolList: [Schools]?
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        let request = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let _data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let schoolData = try decoder.decode([Schools].self, from: _data)

                schoolList = schoolData

            } catch let error {
                print("There was an error fetching this item. Error: \(error)")
            }
        }

        request.resume()

        return schoolList
    }
}
