//
//  LineEndingsSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//  Copyright © 2096 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
import LicenseParser

class LineEndingsSpec: QuickSpec{
  override func spec(){
    describe("Line Endings"){
      context("when the lines are terminated with CR and LF"){
        it("should correctly parse the document"){
          let rawData = "@\r\n" +
            "\r\n" +
            "ANSI 636026080102DL00410288ZA03290095DLDAQD12345678\r\n" +
            "DCSPUBLIC\r\n" +
            "DDEN\r\n" +
            "DACJOHN\r\n" +
            "DDFN\r\n" +
            "DADQUINCY\r\n" +
            "DDGN\r\n" +
            "DCAD\r\n" +
            "DCBNONE\r\n" +
            "DCDNONE\r\n" +
            "DBD08242095\r\n" +
            "DBB09151970\r\n" +
            "DBA09312035\r\n" +
            "DBC1\r\n" +
            "DAU069 in\r\n" +
            "DAYGRN\r\n" +
            "DAG789 E OAK ST\r\n" +
            "DAHAPT #4A\r\n" +
            "DAIANYTOWN\r\n" +
            "DAJCA\r\n" +
            "DAK902230000  \r\n" +
            "DCF83D9BN217QO983B1\r\n" +
            "DCGUSA\r\n" +
            "DAW180\r\n" +
            "DAZBRO\r\n" +
            "DCK12345678900000000000\r\n" +
            "DDB02142094\r\n" +
            "DDK1\r\n" +
            "ZAZAAN\r\n" +
            "ZAB\r\n" +
          "ZAC"

          let sut = Parser(data: rawData)
          let result = sut.parse()

          expect(result.version).to(equal("08"))
          expect(result.lastName).to(equal("PUBLIC"))
          expect(result.middleName).to(equal("QUINCY"))
          expect(result.firstName).to(equal("JOHN"))
          expect(result.eyeColor).to(equal(EyeColor.Green))
          expect(result.streetAddress).to(equal("789 E OAK ST"))
          expect(result.streetAddressSupplement).to(equal("APT #4A"))
          expect(result.height).to(equal(69))
          expect(result.city).to(equal("ANYTOWN"))
          expect(result.state).to(equal("CA"))
          expect(result.postalCode).to(equal("902230000"))
          expect(result.hairColor).to(equal(HairColor.Brown))
          expect(result.country).to(equal(IssuingCountry.UnitedStates))
          expect(result.customerId).to(equal("D12345678"))
        }
      }
    }
  }
}
