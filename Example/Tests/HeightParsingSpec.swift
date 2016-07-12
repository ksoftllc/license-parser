//
//  HeightParsing.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Nimble
import Quick
import LicenseParser

class HeightParsingSpec: QuickSpec{
  override func spec(){
    describe("parsing heights"){
      context("when height is in inches"){
        it("should parse the height as inches"){
          let sut = Parser(data: "DAU060 in")
          let result = sut.parse()

          expect(result.height).to(equal(60))
        }
      }

      context("when height is in feet and inches"){
        it("should parse the height as inches"){
          let sut = Parser(data: "ANSI 636026010102DL00410288ZA03290015DLDAQD12345678\nDAU 500\n")
          let result = sut.parse()

          expect(result.height).to(equal(60))
        }
      }

      context("when height is in centimeters"){
        it("should parse the height as inches, rounded"){
          let sut = Parser(data: "DAU170 cm")
          let result = sut.parse()

          expect(result.height).to(equal(67))
        }
      }

    }
  }
}