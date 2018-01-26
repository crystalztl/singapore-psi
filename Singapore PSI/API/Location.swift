//
//  Location.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 24/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Foundation
import HandyJSON

public class Location: HandyJSON {
    public required init() {}
    public var longitude : Double?
    public var latitude: Double?
    
    public static func ==(lhs: Location, rhs: Location) -> Bool {
        return (lhs.longitude == rhs.longitude) && (lhs.latitude == rhs.latitude)
    }
}
