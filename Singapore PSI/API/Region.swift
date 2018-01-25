//
//  Region.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 24/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Foundation
import HandyJSON

public class Region: HandyJSON {
    public required init() {}
    public var name : String?
    public var label_location: Location?
    public var psiIndex: Double?
}
