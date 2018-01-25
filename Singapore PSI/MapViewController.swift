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
    
    var mapView: GMSMapView!
    let psiService = PSIService.instance
    
    override func loadView() {
        super.loadView()
        let camera = GMSCameraPosition.camera(withLatitude: 1.35216, longitude: 103.8198, zoom: 10.7)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isUserInteractionEnabled = false
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshDataAndMarker()
    }
    
    func refreshDataAndMarker(){
        showProgress();
        psiService.getPSI(dateTime: Date()) { [weak self] (response) in
            DispatchQueue.main.async {
                self?.hideProgress()
                if let psiResponse = response,
                    let regions = self?.psiService.fillPsiIndexInRegions(psiResponse: psiResponse) {
                    self?.drawMaker(with: regions)
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
                
                let psiInfo = UILabel(frame:CGRect(origin: CGPoint(x: 0, y: 30), size: CGSize(width: 80, height: 20)))
                psiInfo.text = "\(Int(region.psiIndex ?? 0.0))"
                psiInfo.font = UIFont.boldSystemFont(ofSize: 20.0)
                psiInfo.textColor = .green
                psiInfo.textAlignment = NSTextAlignment.center
                
                var imageViewForMarker: UIImageView
                imageViewForMarker = UIImageView(frame:CGRect(origin: CGPoint(x: 0, y: 5), size: CGSize(width: 80, height: 60)))
                imageViewForMarker.image = UIImage(named:"infoWindow")
                
                imageViewForMarker.addSubview(title)
                imageViewForMarker.addSubview(psiInfo)
                infoWindow.addSubview(imageViewForMarker)

                UIGraphicsBeginImageContextWithOptions(infoWindow.frame.size, false, UIScreen.main.scale)
                infoWindow.layer.render(in: UIGraphicsGetCurrentContext()!)
                let imageConverted: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                
                marker.position = CLLocationCoordinate2D(latitude: location.latitude!, longitude: location.longitude!)
                marker.title = region.name
                marker.snippet = "\(region.psiIndex ?? 0.0)"
                marker.map = mapView
                marker.icon = imageConverted
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideProgress()
    }
    
}
