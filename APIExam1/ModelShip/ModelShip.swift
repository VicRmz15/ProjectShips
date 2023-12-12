//
//  ModelShip.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 29/11/23.
//

import Foundation

struct ModelShip : Codable {
    var flight_number : Int?
    var mission_name : String?
    var mission_id: [String]?
    var upcoming : Bool?
    var launch_year : String?
    var launch_date_unix : Int?
    var launch_date_utc : String?
    var launch_date_local : String?
    var is_tentative : Bool?
    var tentative_max_precision : String?
    var tbd : Bool?
    var launch_window : Int?
    var rocket: Rocket?
    var ships: [String]?
    var telemetry: Telemetry?
    var launch_site: LaunchSite?
    var launch_success: Bool?
    var launch_failure_details: LaunchFailureDetails?
    var links: Links?
    var details: String?
    var static_fire_date_utc: String?
    var static_fire_date_unix: Int64?
    var timeline: Timeline?
    var last_date_update: String?
    var last_ll_launch_date: String?
    var last_ll_update: String?
    var last_wiki_launch_date: String?
    var last_wiki_revision: String?
    var last_wiki_update: String?
    var launch_date_source: String?
}

struct Rocket : Codable {
    
    var rocket_id : String?
    var rocket_name : String?
    var rocket_type : String?
    var first_stage: FirstStage?
    var second_stage: SecondStage?
    var fairings: Fairings?
    
}

struct FirstStage : Codable {
    
    var cores : [Core]
}

struct Core : Codable {
    
    var core_serial : String?
    var flight : Int?
    var block : Int?
    var gridfins: Bool?
    var legs : Bool?
    var reused : Bool?
    var land_success : Bool?
    var landing_intent : Bool?
    var landing_type : String?
    var landing_vehicle : String?
    
}

struct SecondStage: Codable{
    
    var block: Int?
    var payloads: [Payloads]?
}

struct Payloads: Codable{
    
    var payload_id: String?
    var norad_id: [Int]?
    var reused: Bool?
    var customers: [String]?
    var nationality: String?
    var manufacturer: String?
    var payload_type: String?
    var payload_mass_kg: Float?
    var payload_mass_lbs: Float?
    var orbit: String?
    var orbit_params: OrbitParams?
    
}

struct OrbitParams: Codable{
    var reference_system: String?
    var regime: String?
    var longitude: Float?
    var semi_major_axis_km: Double?
    var eccentricity: Double?
    var periapsis_km: Float?
    var apoapsis_km: Float?
    var inclination_deg: Float?
    var period_min: Double?
    var lifespan_years: Double?
    var epoch: String?
    var mean_motion: Double?
    var raan: Double?
    var arg_of_pericenter: Double?
    var mean_anomaly: Double?
}

struct Fairings: Codable{
    var reused: Bool?
    var recovery_attempt: Bool?
    var recovered: Bool?
    var ship: String?
}

struct Telemetry: Codable{
    var flight_club: String?
}

struct LaunchSite: Codable{
    var site_id: String?
    var site_name: String?
    var site_name_long: String?
}

struct LaunchFailureDetails: Codable{
    var time: Int?
    var altitude: Int?
    var reason: String?
}

struct Links: Codable{
    var mission_patch: String?
    var mission_patch_small: String?
    var reddit_campaign: String?
    var reddit_launch: String?
    var reddit_recovery: String?
    var reddit_media: String?
    var presskit: String?
    var article_link: String?
    var wikipedia: String?
    var video_link: String?
    var youtube_id: String?
    var flickr_images: [String]?
}

struct Timeline: Codable{
    var webcast_liftoff: Int?
}
