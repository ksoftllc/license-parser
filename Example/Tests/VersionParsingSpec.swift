//
//  VersionParsingSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 7/8/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
import LicenseParser

class VersionParsingSpec: QuickSpec{
  override func spec(){
    describe("Parsing the License Version"){
      context("when adhering to the standard"){
        it("should correctly parse the version number"){
          let data: String = "@\nANSI 6360260502DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81"

          let sut = Parser(data: data)
          let result = sut.parse()
          expect(result.version).to(equal("05"))
        }
      }
      context("when the file type does not follow the standard"){
        it("should correctly parse the version number"){
          let data: String = "@\nAAMVA 6360260702DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81"

          let sut = Parser(data: data)
          let result = sut.parse()
          expect(result.version).to(equal("07"))
        }
      }
      context("when the file type does not have a trailing space"){
        it("should correctly parse the version number"){
          let data: String = "@\nANSI6360260302DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81"

          let sut = Parser(data: data)
          let result = sut.parse()
          expect(result.version).to(equal("03"))
        }
      }
    }
  }
}