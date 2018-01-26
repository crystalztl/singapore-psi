//
//  File.swift
//  SingaporePSITests
//
//  Created by Zhang Tianli on 26/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import XCTest
import GoogleMaps

@testable import Singapore_PSI
class MapViewControllerTests: XCTestCase {
    var viewController: MapViewController!
    var refreshButton: UIButton!
    var timestampLabel: UILabel!
    var mapView: GMSMapView!
    let storyboard = UIStoryboard(name:"Main", bundle: .main)
    
    override func setUp() {
        super.setUp()
        viewController = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let  _ = viewController.view
        let _ = viewController.viewDidLoad()
        refreshButton = viewController.refreshButton
        timestampLabel = viewController.timestampLabel
        mapView = viewController.mapView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldLoadUIElement() {
        XCTAssertNotNil(mapView, "mapView should not be nil")
        XCTAssertNotNil(refreshButton, "refreshButton should not be nil")
        XCTAssertNotNil(timestampLabel, "timestampLabel should not be nil")
        
    }
    
    func testShouldShowTimestampCorrectly()  {
        self.viewController.timestamp = "2018-01-26T21:00:00+08:00"
        XCTAssertEqual(viewController.timestampLabel.text, "Updated on: 2018-01-26T21:00:00+08:00")
    }
}
