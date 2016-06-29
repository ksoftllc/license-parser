//
//  ParsedLicenseSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 6/28/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
import LicenseParser

class LicenseSpec: QuickSpec{
  override func spec(){
    describe("License"){
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"

      describe("Acceptability"){
        context("when the license has yet to be issued"){
          it("should not be acceptable"){
            var sut = License()
            sut.issueDate = formatter.dateFromString("2900-01-01")
            expect(sut.isAcceptable()).to(beFalse())
          }
        }
        context("when the license is expired"){
          it("should not be acceptable"){
            var sut = License()
            sut.expirationDate = formatter.dateFromString("1900-01-01")
            expect(sut.isAcceptable()).to(beFalse())
          }
        }
        context("when all essential fields are present"){
          it("should be acceptable"){
            var sut = License()
            sut.expirationDate       = formatter.dateFromString("3000/01/01")
            sut.lastName             = "SOMETHING"
            sut.firstName            = "SOMETHING"
            sut.middleName           = "SOMETHING"
            sut.issueDate            = formatter.dateFromString("2000/01/01")
            sut.dateOfBirth          = formatter.dateFromString("1970/01/01")
            sut.height               = 65.0
            sut.streetAddress        = "SOMETHING"
            sut.city                 = "SOMETHING"
            sut.state                = "CA"
            sut.postalCode           = "SOMETHING"
            sut.documentId           = "SOMETHING"

            expect(sut.isAcceptable()).to(beTrue())
          }
        }
      }
    }
  }
}