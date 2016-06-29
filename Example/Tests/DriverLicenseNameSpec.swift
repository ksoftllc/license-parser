//
//  DriverLicenseNameSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 6/29/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import LicenseParser

class DriverLicenseNameSpec: QuickSpec{
  override func spec(){
    describe("when the name is stored as the driver's license name (DAA)"){
      it("should parse the name"){

        let sut = Parser.init(data: "AAMVA6360060101DL12345678DAAPUBLIC,JOHN,QUINCY,2ND\n")
        let result = sut.parse()

        expect(result.firstName).to(equal("JOHN"))
        expect(result.middleName).to(equal("QUINCY"))
        expect(result.lastName).to(equal("PUBLIC"))
        expect(result.suffix).to(equal(NameSuffix.Second))
      }
    }
  }
}