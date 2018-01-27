//
//  MapViewControllerSpec.swift
//  SingaporePSITests
//
//  Created by Zhang Tianli on 27/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Quick
import Nimble
import GoogleMaps

@testable import Singapore_PSI

class MapViewControllerSpec: QuickSpec {
    override func spec() {
        var viewController: MapViewController!
        var refreshButton: UIButton!
        var timestampLabel: UILabel!
        var mapView: GMSMapView!
        let storyboard = UIStoryboard(name:"Main", bundle: .main)
        
        describe("viewDidLoad"){
            beforeEach {
                viewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
                let  _ = viewController.view
                let _ = viewController.viewDidLoad()
                refreshButton = viewController.refreshButton
                timestampLabel = viewController.timestampLabel
                mapView = viewController.mapView
            }
            
            it("Should load all UI element"){
                expect(mapView).toNot(beNil())
                expect(refreshButton).toNot(beNil())
                expect(timestampLabel).toNot(beNil())
            }
            
            it("Should show time stamp correctly"){
                viewController.timestamp = "2018-01-26T21:00:00+08:00"
                expect(viewController.timestampLabel.text).to(equal("Updated on: 2018-01-26T21:00:00"))
            }
            
        }
        
        
    }
}
