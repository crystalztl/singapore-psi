//
//  File.swift
//  SingaporePSITests
//
//  Created by Zhang Tianli on 26/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Foundation
@testable import Singapore_PSI

class TestUtil {
    static func getTestRegions() -> [Region] {
        let central = TestUtil.getTestRegion(name: "central", psiIndex: 60, latitude: 1.3573500000000001, longitude: 103.81999999999999)
        let north = TestUtil.getTestRegion(name: "north", psiIndex: 23, latitude: 1.4180299999999999, longitude: 103.81999999999999)
        let west = TestUtil.getTestRegion(name: "west", psiIndex: 45, latitude: 1.3573500000000001, longitude: 103.7)
        let east = TestUtil.getTestRegion(name: "east", psiIndex: 109, latitude: 1.3573500000000001, longitude: 103.94)
        let south = TestUtil.getTestRegion(name: "south", psiIndex: 67, latitude: 103.81999999999999, longitude: 1.2958700000000001)

        return [central, north, south, west, east]
    }
    
    static func getTestRegion(name: String, psiIndex: Double, latitude: Double, longitude: Double) -> Region {
        let region = Region()
        region.name = name
        region.psiIndex = psiIndex
        let location = Location()
        location.latitude = latitude
        location.longitude = longitude
        region.label_location = location
        return region
    }
}
