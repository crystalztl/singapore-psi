//
//  PSIServiceSpec.swift
//  SingaporePSITests
//
//  Created by Zhang Tianli on 26/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import Quick
import Nimble
@testable import Singapore_PSI

// Quick has following issues with me:
//1. Not working well with cocoapods in swift 4 and XCode 9 project as they need swift 3.2 version. Through it has workaround which modify the podfile the change the swift version for them still has wired issue.
//2. Has symbol(s) not found for architecture x86_64 issue:  Undefined symbols for architecture x86_64:
//"__T0Sa9HandyJSONA2ARzlE11deserializeSayxSgGSgSSSg4from_AF14designatedPathtFZfA0_", referenced from:
//__T017SingaporePSITests14PSIServiceSpecC4specyyFyycfU_yycfU_ in PSIServiceSpec.o
//"__T0Sa9HandyJSONA2ARzlE11deserializeSayxSgGSgSSSg4from_AF14designatedPathtFZ", referenced from:
//__T017SingaporePSITests14PSIServiceSpecC4specyyFyycfU_yycfU_ in PSIServiceSpec.o
// To save time, I choose to rewrite tests using XCTest instead.

class PSIServiceSpec: QuickSpec {
    override func spec() {
        let psiService = PSIService.instance
        let validPsiRespinseString = "{\"items\":[{\"timestamp\":\"2018-01-26T21:00:00+08:00\",\"readings\":{\"pm25_twenty_four_hourly\":{\"east\":11,\"national\":13,\"south\":10,\"central\":13,\"north\":13,\"west\":10},\"psi_twenty_four_hourly\":{\"east\":45,\"national\":52,\"south\":40,\"central\":52,\"north\":52,\"west\":40},\"o3_eight_hour_max\":{\"east\":19,\"national\":51,\"south\":13,\"central\":7,\"north\":25,\"west\":51},\"co_eight_hour_max\":{\"east\":0.27000000000000002,\"national\":0.54000000000000004,\"south\":0.54000000000000004,\"central\":0.54000000000000004,\"north\":0.48999999999999999,\"west\":0.46000000000000002},\"so2_twenty_four_hourly\":{\"east\":3,\"national\":7,\"south\":4,\"central\":2,\"north\":4,\"west\":7},\"pm10_twenty_four_hourly\":{\"east\":26,\"national\":29,\"south\":19,\"central\":27,\"north\":29,\"west\":21},\"so2_sub_index\":{\"east\":2,\"national\":5,\"south\":2,\"central\":1,\"north\":3,\"west\":5},\"o3_sub_index\":{\"east\":8,\"national\":21,\"south\":6,\"central\":3,\"north\":11,\"west\":21},\"pm25_sub_index\":{\"east\":45,\"national\":52,\"south\":40,\"central\":52,\"north\":52,\"west\":40},\"co_sub_index\":{\"east\":3,\"national\":5,\"south\":5,\"central\":5,\"north\":5,\"west\":5},\"no2_one_hour_max\":{\"east\":33,\"national\":53,\"south\":53,\"central\":28,\"north\":32,\"west\":11},\"pm10_sub_index\":{\"east\":26,\"national\":29,\"south\":19,\"central\":27,\"north\":29,\"west\":21}}}],\"region_metadata\":[{\"psiIndex\":40,\"name\":\"west\",\"label_location\":{\"longitude\":103.7,\"latitude\":1.3573500000000001}},{\"name\":\"national\",\"label_location\":{\"longitude\":0,\"latitude\":0}},{\"psiIndex\":45,\"name\":\"east\",\"label_location\":{\"longitude\":103.94,\"latitude\":1.3573500000000001}},{\"psiIndex\":52,\"name\":\"central\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.3573500000000001}},{\"psiIndex\":40,\"name\":\"south\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.2958700000000001}},{\"psiIndex\":52,\"name\":\"north\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.4180299999999999}}]}"
        let validPsiResponse: PSIResponse = validPsiRespinseString.deserialize()!
        
//        describe("PSIService"){
//
//            it("should get fullfilled regions data when pass in valid psiResponse"){
//
//                let expectedRegionsString = "[{\"psiIndex\":40,\"name\":\"west\",\"label_location\":{\"longitude\":103.7,\"latitude\":1.3573500000000001}},{\"name\":\"national\",\"label_location\":{\"longitude\":0,\"latitude\":0}},{\"psiIndex\":45,\"name\":\"east\",\"label_location\":{\"longitude\":103.94,\"latitude\":1.3573500000000001}},{\"psiIndex\":52,\"name\":\"central\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.3573500000000001}},{\"psiIndex\":40,\"name\":\"south\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.2958700000000001}},{\"psiIndex\":52,\"name\":\"north\",\"label_location\":{\"longitude\":103.81999999999999,\"latitude\":1.4180299999999999}}]"
//                let expectedRegions = ([Region].deserialize(from: expectedRegionsString) as? [Region])
//                let actualRegions = psiService.fillPsiIndexInRegions(psiResponse: validPsiResponse)
//
//                expect(actualRegions).toNot(beNil())
//
//                for (index, element) in actualRegions!.enumerated(){
//                    expect(element == expectedRegions![index]).to(beTrue())
//                }
//            }
//
//        }
    }
}
