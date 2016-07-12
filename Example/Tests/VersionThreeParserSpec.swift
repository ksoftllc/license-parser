//
//  VersionThreeParserSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
import LicenseParser

class VersionThreeParserSpec: QuickSpec{
  override func spec(){
    describe("Parsing version three of the AAMVA standard"){
      it("should parse the required fields"){
        let rawData = "@\n" +
          "\n" +
          "ANSI 636012030001DL00000367DLDCAG2  \n" +
          "DCBX\n" +
          "DCDNONE\n" +
          "DBA20250425\n" +
          "DCSPUBLIC,\n" +
          "DCTJOHN\n" +
          "DBD20150910\n" +
          "DBB19740328\n" +
          "DBC1\n" +
          "DAYNONE\n" +
          "DAU170 cm\n" +
          "DAG789 E OAK AVE,\n" +
          "DAIVANCOUVER\n" +
          "DAJBC\n" +
          "DAKA5K 4X9\n" +
          "DAQM1234-12345-12345\n" +
          "DCFAB1234567\n" +
          "DCGCAN\n" +
          "DCHNONE\n" +
        "DCK*1234567*"

        let sut = Parser(data: rawData)
        let result = sut.parse()

        expect(result.gender).to(equal(Gender.Male))
        expect(result.firstName).to(equal("JOHN"))
        expect(result.lastName).to(equal("PUBLIC"))
        expect(result.streetAddress).to(equal("789 E OAK AVE"))
        expect(result.postalCode).to(equal("A5K 4X9"))
        expect(result.expirationDate).to(equal(self.formattedDate("20250425")))
        expect(result.dateOfBirth).to(equal(self.formattedDate("19740328")))
        expect(result.issueDate).to(equal(self.formattedDate("20150910")))
        expect(result.eyeColor).to(equal(EyeColor.Unknown))
        expect(result.country).to(equal(IssuingCountry.Canada))
      }
    }
  }

  func formattedDate(date: String) -> NSDate?{
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    let expectedDate = formatter.dateFromString(date)

    return expectedDate
  }
}