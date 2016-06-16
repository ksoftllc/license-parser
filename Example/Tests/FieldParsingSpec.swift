//
//  FieldParsingSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 6/15/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import LicenseParser

class FieldParsingSpec: QuickSpec {
  override func spec() {

    describe("Field Parsing"){
      context("when the version is missing"){
        it("should reveal an empty version number"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.version).to(beNil())
        }
      }
      context("when the version is empty"){
        it("should reveal an empty version number"){
          let sut = LicenseParser.Parser(data: "ANSI \n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.version).to(beNil())
        }
      }
    }

    describe("Parsing the Name Suffix"){
      context("when the suffix is empty"){
        it("should reveal an unknown suffix"){
          let sut = LicenseParser.Parser(data: "DCU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.suffix).to(equal(LicenseParser.NameSuffix.Unknown))
        }
      }
      context("when the suffix is missing"){
        it("should reveal an unknown suffix"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.suffix).to(equal(LicenseParser.NameSuffix.Unknown))
        }
      }
    }


    describe("Parsing the suffix alias"){
      context("when the suffix alias is empty"){
        it("should reveal an empty suffix alias"){
          let sut = LicenseParser.Parser(data: "DBS\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.suffixAlias).to(beNil())
        }
      }
      context("when the suffix alias is missing"){
        it("should reveal an empty suffix alias"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.suffixAlias).to(beNil())
        }
      }
    }

    describe("Parsing the first name alias"){
      context("when the first name alias is empty"){
        it("should reveal an empty first name alias"){
          let sut = LicenseParser.Parser(data: "DBG\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstNameAlias).to(beNil())
        }
      }
      context("when the first name alias is missing"){
        it("should reveal an empty first name alias"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstNameAlias).to(beNil())
        }
      }
    }

    describe("Parsing the last name alias"){
      context("when the last name alias is empty"){
        it("should reveal an empty last name alias"){
          let sut = LicenseParser.Parser(data: "DBN\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastNameAlias).to(beNil())
        }
      }
      context("when the last name alias is missing"){
        it("should reveal an empty last name alias"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastNameAlias).to(beNil())
        }
      }
    }

    describe("Parsing the Inventory Control Number"){
      context("when the inventory control number is empty"){
        it("should reveal an empty inventory control number"){
          let sut = LicenseParser.Parser(data: "DCK\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.inventoryControlNumber).to(beNil())
        }
      }
      context("when the inventory control number is missing"){
        it("should reveal an empty inventory control number"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.inventoryControlNumber).to(beNil())
        }
      }
    }

    describe("Parsing the Audit Information"){
      context("when the audit information is empty"){
        it("should reveal an empty audit information"){
          let sut = LicenseParser.Parser(data: "DCJ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.auditInformation).to(beNil())
        }
      }
      context("when the audit information is missing"){
        it("should reveal an empty audit information"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.auditInformation).to(beNil())
        }
      }
    }

    describe("Parsing the place of birth"){
      context("when the place of birth is empty"){
        it("should reveal an empty place of birth"){
          let sut = LicenseParser.Parser(data: "DCI\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.placeOfBirth).to(beNil())
        }
      }
      context("when the place of birth is missing"){
        it("should reveal an empty place of birth"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.placeOfBirth).to(beNil())
        }
      }
    }

    describe("Parsing the Hair Color"){
      context("when the hair color is empty"){
        it("should reveal an unknown hair color"){
          let sut = LicenseParser.Parser(data: "DAZ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.hairColor).to(equal(LicenseParser.HairColor.Unknown))
        }
      }
      context("when the hair color is missing"){
        it("should reveal an unknown hair color"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.hairColor).to(equal(LicenseParser.HairColor.Unknown))
        }
      }
    }

    describe("Parsing the Second Street Address Line"){
      context("when the street address supplament is empty"){
        it("should reveal nothing for the supplemental address"){
          let sut = LicenseParser.Parser(data: "DAH\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddressSupplement).to(beNil())
        }
      }
      context("when the street address supplament is missing"){
        it("should reveal nothing for the supplemental address"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddressSupplement).to(beNil())
        }
      }
    }

    describe("Parsing the Issuing Country"){
      context("when the country is empty"){
        it("should reveal an unknown issuing country"){
          let sut = LicenseParser.Parser(data: "DCG\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.country).to(equal(LicenseParser.IssuingCountry.Unknown))
        }
      }
      context("when the country is missing"){
        it("should reveal nothing for the country"){
          let sut = LicenseParser.Parser(data: "DCF\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.country).to(equal(LicenseParser.IssuingCountry.Unknown))
        }
      }
    }


    describe("Parsing the Document Identifier"){
      context("when the document id is empty"){
        it("should reveal nothing for the document id"){
          let sut = LicenseParser.Parser(data: "DCF\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.documentId).to(beNil())
        }
      }
      context("when the document id is missing"){
        it("should reveal nothing for the document id"){
          let sut = LicenseParser.Parser(data: "DCF\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.documentId).to(beNil())
        }
      }
    }

    describe("Parsing the Customer Id Number"){
      context("when the customer id number is empty"){
        it("should reveal nothing for the customer id number"){
          let sut = LicenseParser.Parser(data: "DAQ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.customerId).to(beNil())
        }
      }
      context("when the customer id number is missing"){
        it("should reveal nothing for the customer id number"){
          let sut = LicenseParser.Parser(data: "DAQ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.customerId).to(beNil())
        }
      }
    }

    describe("Parsing the Postal Code"){
      context("when the postal code is empty"){
        it("should reveal nothing for the postal code"){
          let sut = LicenseParser.Parser(data: "DAK\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.postalCode).to(beNil())
        }
      }
      context("when the postal code is missing"){
        it("should reveal nothing for the postal code"){
          let sut = LicenseParser.Parser(data: "DAK\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.postalCode).to(beNil())
        }
      }
    }

    describe("Parsing the State"){
      context("when the state is empty"){
        it("should reveal nothing for the state"){
          let sut = LicenseParser.Parser(data: "DAJ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.state).to(beNil())
        }
      }
      context("when the state is missing"){
        it("should reveal nothing for the state"){
          let sut = LicenseParser.Parser(data: "DAJ\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.state).to(beNil())
        }
      }
    }

    describe("Parsing the City"){
      context("when the city is empty"){
        it("should reveal nothing for the city"){
          let sut = LicenseParser.Parser(data: "DAI\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.city).to(beNil())
        }
      }
      context("when the city is missing"){
        it("should reveal nothing for the city"){
          let sut = LicenseParser.Parser(data: "DAI\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.city).to(beNil())
        }
      }
    }

    describe("Parsing the Street Address"){
      context("when the street address is empty"){
        it("should reveal nothing for the street address"){
          let sut = LicenseParser.Parser(data: "DAG\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddress).to(beNil())
        }
      }
      context("when the street address is missing"){
        it("should reveal nothing for the street address"){
          let sut = LicenseParser.Parser(data: "DAG\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddress).to(beNil())
        }
      }
    }

    describe("Parsing Height"){
      context("when the height is empty"){
        it("should reveal nothing for the height "){
          let sut = LicenseParser.Parser(data: "DAU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.height).to(beNil())
        }
      }
      context("when the height is missing"){
        it("should reveal nothing for the height"){
          let sut = LicenseParser.Parser(data: "DAU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.height).to(beNil())
        }
      }
    }

    describe("Parsing Eye Color"){
      context("when the eye color is empty"){
        it("should reveal an unknown eye color"){
          let sut = LicenseParser.Parser(data: "DAY\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Unknown))
        }
      }
      context("when the eye color is missing"){
        it("should reveal an unknown eye color"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Unknown))
        }
      }
    }

    describe("Parsing the gender"){
      context("when the gender is empty"){
        it("should reveal the gender as unknown"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.gender).to(equal(LicenseParser.Gender.Unknown))
        }
      }
      context("when the gender field is missing"){
        it("should reveal the gender as unknown"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.gender).to(equal(LicenseParser.Gender.Unknown))
        }
      }
    }

    describe("Parsing the first name"){
      context("when the first name is empty"){
        it("should reveal nothing for the first name"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstName).to(beNil())
        }

        it("should reveal the correct truncation status"){
          let sut = LicenseParser.Parser(data: "DDFU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
        }

      }
      context("when the first name field is missing"){
        it("should reveal nothing for the first name"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstName).to(beNil())
        }

        it("should reveal the correct truncation status"){
          let sut = LicenseParser.Parser(data: "DDFU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
        }

      }
    }

    describe("Parsing the last name"){
      context("when the last name is empty"){
        it("should reveal nothing for the last name"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastName).to(beNil())
        }
      }
      context("when the last name field is missing"){
        it("should reveal nothing for the last name"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastName).to(beNil())
        }
      }

    }

    describe("Parsing the middle name"){
      context("when the middle name is empty"){
        it("should reveal nothing for the middle name"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.middleName).to(beNil())
        }
        it("should reveal the correct truncation status"){
          let sut = LicenseParser.Parser(data: "DDGU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.middleNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
        }
      }
      context("when the middle name field is missing"){
        it("should reveal nothing for the middle name"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.middleName).to(beNil())
        }
        it("should reveal the correct truncation status"){
          let sut = LicenseParser.Parser(data: "DDGU\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.middleNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
        }
      }
    }

    describe("Parsing the expiration date"){
      context("when the expiration date is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.expirationDate).to(beNil())
        }
        it("should not be expired"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.expirationDate).to(beNil())
        }
      }
      context("when the expiration date field is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.expirationDate).to(beNil())
        }
      }
    }

    describe("Parsing the issue date"){
      context("when the issue date is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.issueDate).to(beNil())
        }
        it("should not be expired"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.issueDate).to(beNil())
        }
      }
      context("when the issue date field is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.issueDate).to(beNil())
        }
      }
    }

    describe("Parsing the date of birth"){
      context("when the date of birth is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.dateOfBirth).to(beNil())
        }
        it("should not be expired"){
          let sut = LicenseParser.Parser(data: self.emptyLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.dateOfBirth).to(beNil())
        }
      }
      context("when the date of birth field is missing"){
        it("should reveal an empty optional date"){
          let sut = LicenseParser.Parser(data: "")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.dateOfBirth).to(beNil())
        }
      }
    }

  }

  func emptyLicenseData() -> String{
    let rawData = "@\n" +
      "\n" +
      "ANSI 636026080102DL00410288ZA03290015DLDAQ\n" +
      "DCS\n" +
      "DDE\n" +
      "DAC\n" +
      "DDF\n" +
      "DAD\n" +
      "DDG\n" +
      "DCA\n" +
      "DCB\n" +
      "DCD\n" +
      "DBD\n" +
      "DBB\n" +
      "DBA\n" +
      "DBC\n" +
      "DAU\n" +
      "DAY\n" +
      "DAG\n" +
      "DAI\n" +
      "DAJ\n" +
      "DAK\n" +
      "DCF\n" +
      "DCG\n" +
      "DAW\n" +
      "DAZ\n" +
      "DCK\n" +
      "DDB\n" +
      "DDK\n" +
      "ZAZ\n" +
      "ZAB\n" +
    "ZAC"
    return rawData
  }
}