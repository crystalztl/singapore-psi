//
//  MapViewController.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 24/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var refreshButton: UIButton!
    @IBOutlet var timestampLabel: UILabel!
    
    let psiService = PSIService.instance
    
    var regions: [Region]? = nil {
        didSet{
            if let new = self.regions {
                self.drawMaker(with: new)
            }
        }
    }
    
    var timestamp: String? = nil {
        didSet{
            self.timestampLabel.text = "Updated on: " + (self.timestamp ?? " ")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Singapore PSI"
        let camera = GMSCameraPosition.camera(withLatitude: 1.35216, longitude: 103.8198, zoom: 10.7)
        mapView.camera = camera
        mapView.isUserInteractionEnabled = false
        bringViewToMostFront(view: refreshButton)
        bringViewToMostFront(view: timestampLabel)
        
        refreshData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideProgress()
    }
    
    func refreshData(){
        showProgress();
        psiService.getPSI(dateTime: Date()) { [weak self] (response) in
            DispatchQueue.main.async {
                self?.hideProgress()
                if let psiResponse = response,
                    let regions = self?.psiService.fillPsiIndexInRegions(psiResponse: psiResponse) {
                    print("\(psiResponse.toJSONString() ?? " ")")
                    self?.regions = regions
                    self?.timestamp = self?.psiService.getTimestamp(psiResponse: psiResponse)
                }
            }
        }
    }
    
    func drawMaker(with regions: [Region]) {
        for region in regions {
            let marker = GMSMarker()
            if let location = region.label_location {
                let infoWindow = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 80, height: 65)))
                infoWindow.backgroundColor = .gray
                
                let title = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 80, height: 20)))
                title.text = region.name
                title.font = UIFont(name: title.font.fontName, size: 12)
                title.textAlignment = NSTextAlignment.center
                
                let line = UIView(frame: CGRect(origin: CGPoint(x: 8, y: 22), size: CGSize(width: 64, height: 1)))
                line.backgroundColor = .lightGray
                
                let psiInfo = UILabel(frame:CGRect(origin: CGPoint(x: 0, y: 30), size: CGSize(width: 80, height: 20)))
                let psiIndex = Int(region.psiIndex ?? 0.0)
                psiInfo.text = "\(psiIndex)"
                psiInfo.font = UIFont.boldSystemFont(ofSize: 20.0)
                psiInfo.textColor = determineColor(psiIndex: psiIndex)
                psiInfo.textAlignment = NSTextAlignment.center
                
                var imageViewForMarker: UIImageView
                imageViewForMarker = UIImageView(frame:CGRect(origin: CGPoint(x: 0, y: 5), size: CGSize(width: 80, height: 60)))
                imageViewForMarker.image = UIImage(named:"infoWindow")
                
                imageViewForMarker.addSubview(title)
                imageViewForMarker.addSubview(line)
                imageViewForMarker.addSubview(psiInfo)
                infoWindow.addSubview(imageViewForMarker)
                
                UIGraphicsBeginImageContextWithOptions(infoWindow.frame.size, false, UIScreen.main.scale)
                infoWindow.layer.render(in: UIGraphicsGetCurrentContext()!)
                let imageConverted: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                
                marker.position = CLLocationCoordinate2D(latitude: location.latitude!, longitude: location.longitude!)
                marker.map = mapView
                marker.icon = imageConverted
            }
        }
    }
    
    
    
    private func determineColor(psiIndex: Int) -> UIColor {
        
        var color = UIColor()
        if psiIndex <= 50 {
            color = .healthy
        }else if psiIndex >= 100{
            color = .unhealthy
        }else{
            color = .moderate
        }
        return color
    }
    
    func bringViewToMostFront(view: UIView){
        view.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    
}

extension MapViewController: UIGestureRecognizerDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        guard let point = touch?.location(in: refreshButton) else { return }
        print("Hiting: \(point.debugDescription)")
        if point.x > 0 && point.y > 0 {
            refreshData()
        }
    }
}
