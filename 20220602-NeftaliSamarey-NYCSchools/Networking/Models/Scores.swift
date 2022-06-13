//
//  Scores.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/12/22.
//

import Foundation

// This is the data model we will use when we serialize it from JSON
public struct Scores: Codable {
    let dbn: String
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
