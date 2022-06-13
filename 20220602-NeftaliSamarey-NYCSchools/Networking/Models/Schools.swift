//
//  Schools.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import Foundation

// This is the model we will use for when we make a network call to organize the JSON file we get back and serialize.
public struct Schools: Codable {

    let dbn: String
    let school_name: String
    let boro: String
    let overview_paragraph: String
    let primary_address_line_1: String
    let borough: String?
    let city: String?
    let zip: String?
    let state_code: String?
    let latitude: String?
    let longitude: String?
    /*let school_10th_seats: String
    let academicopportunities1: String
    let academicopportunities2: String
    let ell_programs: String
    let neighborhood: String
    let campus_name: String
    let building_code: String
    let location: String
    let phone_number: String
    let fax_number: String
    let school_email: String
    let website: String
    let subway: String
    let bus: String
    let grades2018: String
    let finalgrades: String
    let total_students: String
    let extracurricular_activities: String
    let primary_address_line_1: String */
}
