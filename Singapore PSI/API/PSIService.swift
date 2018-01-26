//
//  PSIService.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 24/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Foundation
import Alamofire

public class PSIService {
    private static let _instance = PSIService()
    
    public static var instance: PSIService {
        return _instance
    }
    
    public func getPSI(dateTime: Date, completion:@escaping (PSIResponse?) -> Void) {
        let dateFormat = DateFormat.pattern("yyyy-MM-dd'T'HH:mm:ss")
        let dateTimeString = dateTime.format(dateFormat, humanFriendly: false)
        var request = URLRequest(url: URL(string: ApiUtils.baseUrl+"?\(ApiUtils.dateTimeKeyName)=\(dateTimeString)")!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(ApiUtils.psiApiKey, forHTTPHeaderField: ApiUtils.apiKeyName)
        
        Alamofire.request(request)
            .validate()
            .response { (response) -> Void in
                guard response.error == nil, let usableData = response.data else {
                    completion(nil)
                    return
                }
                
                let response : PSIResponse = usableData.deserialize()!
                completion(response)
                
        }
    }
    
    public func fillPsiIndexInRegions(psiResponse: PSIResponse) -> [Region]? {
        
        guard let regions = psiResponse.region_metadata, let items = psiResponse.items else {
            return nil
        }
        
        regions.filter{$0.name == "central"}[0].psiIndex = items[0].readings?.psi_twenty_four_hourly?.central
        regions.filter{$0.name == "west"}[0].psiIndex = items[0].readings?.psi_twenty_four_hourly?.west
        regions.filter{$0.name == "east"}[0].psiIndex = items[0].readings?.psi_twenty_four_hourly?.east
        regions.filter{$0.name == "north"}[0].psiIndex = items[0].readings?.psi_twenty_four_hourly?.north
        regions.filter{$0.name == "south"}[0].psiIndex = items[0].readings?.psi_twenty_four_hourly?.south
        
        return regions
    }
    
    public func getTimestamp(psiResponse: PSIResponse) -> String? {
        guard let items = psiResponse.items,
            items.count > 0,
            let timestamp = items[0].timestamp else {
                return nil
        }
        return timestamp
    }
    
}



