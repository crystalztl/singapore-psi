//
//  PSIResponse.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 24/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Foundation
import HandyJSON

public class PSIResponse: HandyJSON {
    public required init() {}
    public var region_metadata: [Region]?
    public var items: [Item]?
}

public class Item: HandyJSON {
    public required init() {}
    public var timestamp: String?
    public var readings: Readings?
}

public class Readings: HandyJSON {
    public required init() {}
    public var o3_sub_index: ReadingIndex?
    public var pm10_twenty_four_hourly: ReadingIndex?
    public var co_sub_index: ReadingIndex?
    public var pm10_sub_index: ReadingIndex?
    public var pm25_twenty_four_hourly: ReadingIndex?
    public var so2_sub_index: ReadingIndex?
    public var co_eight_hour_max: ReadingIndex?
    public var so2_twenty_four_hourly: ReadingIndex?
    public var no2_one_hour_max: ReadingIndex?
    public var pm25_sub_index: ReadingIndex?
    public var psi_twenty_four_hourly: ReadingIndex?
    public var o3_eight_hour_max: ReadingIndex?
    public var psi_three_hourly: ReadingIndex?
}

public class ReadingIndex: HandyJSON {
    public required init() {}
    public var national: Double?
    public var south: Double?
    public var north: Double?
    public var east: Double?
    public var central: Double?
    public var west: Double?
}
