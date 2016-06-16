//
//  VersionOneParserSpec.swift
//  LicenseParser
//
//  Created by Clayton Lengel-Zigich on 6/9/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import LicenseParser

class VersionOneParserSpec: QuickSpec {
  override func spec() {

    describe("Parsing Data Adhereing to the 2000 AAMVA DL/ID Card Design Standard (aka version 1)"){
      describe("Parsing the AAMVA Document Standard"){
        context("when the version is present"){
          it("should reveal the correct version number"){
            let sut = LicenseParser.Parser(data: "ANSI 636026010102DL00410288ZA03290015DLDAQD12345678\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.version).to(equal("01"))
          }
        }
      }

      describe("Parsing the Name Suffix"){
        context("when the suffix is present"){
          context("when the suffix is JR"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUJR\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Junior))
            }
          }
          context("when the suffix is senior"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUSR\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Senior))
            }
          }
          context("when the suffix is 1ST"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU1ST\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.First))
            }
          }
          context("when the suffix is 2ND"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU2ND\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Second))
            }
          }
          context("when the suffix is 3RD"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU3RD\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Third))
            }
          }
          context("when the suffix is 4TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU4TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Fourth))
            }
          }
          context("when the suffix is 5TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU5TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Fifth))
            }
          }
          context("when the suffix is 6TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU6TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Sixth))
            }
          }
          context("when the suffix is 7TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU7TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Seventh))
            }
          }
          context("when the suffix is 8TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU8TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Eighth))
            }
          }
          context("when the suffix is 9TH"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCU9TH\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Ninth))
            }
          }
          context("when the suffix is I"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUI\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.First))
            }
          }
          context("when the suffix is II"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUII\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Second))
            }
          }
          context("when the suffix is III"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUIII\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Third))
            }
          }
          context("when the suffix is IV"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUIV\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Fourth))
            }
          }
          context("when the suffix is V"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUV\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Fifth))
            }
          }
          context("when the suffix is VI"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUVI\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Sixth))
            }
          }
          context("when the suffix is VII"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUVII\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Seventh))
            }
          }
          context("when the suffix is VIII"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUVIII\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Eighth))
            }
          }
          context("when the suffix is IX"){
            it("should reveal the correct suffix"){
              let sut = LicenseParser.Parser(data: "DCUIX\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.suffix).to(equal(LicenseParser.NameSuffix.Ninth))
            }
          }
        }
      }


      describe("Parsing the suffix alias"){
        context("when the suffix alias is present"){
          it("should reveal the suffix alias"){
            let sut = LicenseParser.Parser(data: "DBSJR\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.suffixAlias).to(equal("JR"))
          }
        }
      }

      describe("Parsing the first name alias"){
        context("when the first name alias is present"){
          it("should reveal the first name alias"){
            let sut = LicenseParser.Parser(data: "DBGJOHNALIAS\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.firstNameAlias).to(equal("JOHNALIAS"))
          }
        }
      }

      describe("Parsing the last name alias"){
        context("when the last name alias is present"){
          it("should reveal the last name alias"){
            let sut = LicenseParser.Parser(data: "DBNPUBLICALIAS\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.lastNameAlias).to(equal("PUBLICALIAS"))
          }
        }
      }

      describe("Parsing the Inventory Control Number"){
        context("when the inventory control number is present"){
          it("should reveal the inventory control number"){
            let sut = LicenseParser.Parser(data: "DCK12345678900000000000\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.inventoryControlNumber).to(equal("12345678900000000000"))
          }
        }
      }

      describe("Parsing the Audit Information"){
        context("when the audit information is present"){
          it("should reveal the audit information"){
            let sut = LicenseParser.Parser(data: "DCJCA1234BBB\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.auditInformation).to(equal("CA1234BBB"))
          }
        }
      }

      describe("Parsing the place of birth"){
        context("when the place of birth is present"){
          it("should reveal the place of birth"){
            let sut = LicenseParser.Parser(data: "DCICALIFORNIA, USA\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.placeOfBirth).to(equal("CALIFORNIA, USA"))
          }
        }
      }

      describe("Parsing the Hair Color"){
        context("when the hair color is present"){
          context("when the hair color is Bald"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZBAL\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Bald))
            }
          }
          context("when the hair color is Black"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZBLK\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Black))
            }
          }
          context("when the hair color is Blond"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZBLN\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Blond))

            }
          }
          context("when the hair color is Brown"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZBRO\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Brown))

            }
          }
          context("when the hair color is Grey"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZGRY\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Grey))

            }
          }
          context("when the hair color is Red/Auburn"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZRED\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Red))

            }
          }
          context("when the hair color is Sandy"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZSDY\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Sandy))

            }
          }
          context("when the hair color is White "){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZWHI\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.White))

            }
          }
          context("when the hair color is Unknown"){
            it("should reveal the correct hair color"){
              let sut = LicenseParser.Parser(data: "DAZFFF\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.hairColor).to(equal(LicenseParser.HairColor.Unknown))
            }
          }
        }
      }

      describe("Parsing the Second Street Address Line"){
        context("when the street address supplement is present"){
          it("should reveal the supplemental street address"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.streetAddressSupplement).to(equal("APT #4A"))
          }
        }
      }

      describe("Parsing the Customer Id Number"){
        context("when the customer id number is present"){
          it("should reveal the customer id number"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.customerId).to(equal("D12345678"))
          }
        }
      }

      describe("Parsing the Postal Code"){
        context("when the postal code is present"){
          it("should reveal the postal code"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.postalCode).to(equal("90223"))
          }
        }
      }

      describe("Parsing the State"){
        context("when the state is present"){
          it("should reveal the state"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.state).to(equal("CA"))
          }
        }
      }

      describe("Parsing the City"){
        context("when the city is present"){
          it("should reveal the city"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.city).to(equal("ANYTOWN"))
          }
        }
      }

      describe("Parsing the Street Address"){
        context("when the street address is present"){
          it("should reveal the street address"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.streetAddress).to(equal("789 E OAK ST"))
          }
        }
      }

      describe("Parsing Height"){
        context("when the height is present"){
          it("should reveal the height in inches"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.height).to(equal(69))
          }
        }
      }

      describe("Parsing Eye Color"){
        context("when the eye color is present"){
          context("when the eye color is Black"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYBLK\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Black))
            }
          }
          context("when the eye color is Blue"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYBLU\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Blue))

            }
          }
          context("when the eye color is Brown"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYBRO\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Brown))

            }
          }
          context("when the eye color is Gray"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYGRY\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Gray))

            }
          }
          context("when the eye color is Green"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYGRN\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Green))
            }
          }
          context("when the eye color is Hazel"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYHAZ\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Hazel))
            }
          }
          context("when the eye color is Maroon "){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYMAR\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Maroon))
            }
          }
          context("when the eye color is Pink"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYPNK\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Pink))

            }
          }
          context("when the eye color is Dichromatic"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYDIC\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Dichromatic))

            }
          }
          context("when the eye color is Unknown"){
            it("should reveal the correct eye color"){
              let sut = LicenseParser.Parser(data: "DAYUNK\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.eyeColor).to(equal(LicenseParser.EyeColor.Unknown))
            }
          }
        }
      }

      describe("Parsing the gender"){
        context("when the gender is present"){
          context("when the gender is male"){
            it("should reveal the gender as Male"){
              let sut = LicenseParser.Parser(data: "DBC1\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.gender).to(equal(LicenseParser.Gender.Male))
            }
          }
          context("when the gender is female"){
            it("should reveal the gender as Female"){
              let sut = LicenseParser.Parser(data: "DBC2\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.gender).to(equal(LicenseParser.Gender.Female))
            }
          }
          context("when the gender is neither male or female"){
            it("should reveal the gender as Other"){
              let sut = LicenseParser.Parser(data: "DBC3\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.gender).to(equal(LicenseParser.Gender.Other))
            }
          }
        }
      }

      describe("Parsing the first name"){
        context("when the first name is present"){
          it("should reveal the first name"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.firstName).to(equal("JOHN"))
          }

          context("when the first name was truncated"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDFT\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.firstNameTruncation).to(equal(LicenseParser.Truncation.Truncated))
            }
          }
          context("when the first name was not truncated"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDFN\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.firstNameTruncation).to(equal(LicenseParser.Truncation.None))
            }
          }
          context("when the truncation of the first name is unknown"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDFU\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.firstNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
            }
          }

        }
      }

      describe("Parsing the last name"){
        context("when the last name is present"){
          it("should reveal the last name"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.lastName).to(equal("PUBLIC"))
          }
        }
      }

      describe("Parsing the middle name"){
        context("when the middle name is present"){
          it("should reveal the middle name"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.middleName).to(equal("QUINCY"))
          }

          context("when the middle name was truncated"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDGT\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.middleNameTruncation).to(equal(LicenseParser.Truncation.Truncated))
            }
          }
          context("when the middle name was not truncated"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDGN\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.middleNameTruncation).to(equal(LicenseParser.Truncation.None))
            }
          }
          context("when the truncation of the middle name is unknown"){
            it("should reveal the correct truncation status"){
              let sut = LicenseParser.Parser(data: "DDGU\n")
              let result: LicenseParser.ParsedLicense = sut.parse()
              expect(result.middleNameTruncation).to(equal(LicenseParser.Truncation.Unknown))
            }
          }
        }
      }

      describe("Parsing the expiration date"){
        context("when the expiration date is present"){
          it("should reveal the expiration date"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()

            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            let expectedDate = formatter.dateFromString("20350131")

            expect(result.expirationDate).to(equal(expectedDate))
          }

          context("when the expiration date is in the past"){
            it("should be expired"){
              let sut = LicenseParser.Parser(data: "DBA05052005\n")
              let result: LicenseParser.ParsedLicense = sut.parse()

              expect(result.isExpired()).to(beTrue())
            }
          }
          context("when the expiration date is in the future"){
            it("should not be expired"){
              let sut = LicenseParser.Parser(data: self.validLicenseData())
              let result: LicenseParser.ParsedLicense = sut.parse()

              expect(result.isExpired()).to(beFalse())
            }
          }
        }
      }

      describe("Parsing the issue date"){
        context("when the issue date is present"){
          it("should reveal the issue date"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()

            let formatter = NSDateFormatter()
            formatter.dateFormat = "MMddyyyy"
            let expectedDate = formatter.dateFromString("10032013")

            expect(result.issueDate).to(equal(expectedDate))
          }

          context("when the issue date is in the past"){
            it("should have been issued"){
              let sut = LicenseParser.Parser(data: "DBD05052005\n")
              let result: LicenseParser.ParsedLicense = sut.parse()

              expect(result.hasBeenIssued()).to(beTrue())
            }
          }
          context("when the issue date is in the future"){
            it("should not yet have been issued"){
              let sut = LicenseParser.Parser(data: "DBD05053000\n")
              let result: LicenseParser.ParsedLicense = sut.parse()

              expect(result.hasBeenIssued()).to(beFalse())
            }
          }
        }
      }

      describe("Parsing the date of birth"){
        context("when the date of birth is present"){
          it("should reveal the date of birth"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()

            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            let expectedDate = formatter.dateFromString("19700115")

            expect(result.dateOfBirth).to(equal(expectedDate))
          }
        }
      }
    }
  }

  func validLicenseData() -> String{
    let rawData = "@\n" +
      "\n" +
      "ANSI 636026010102DL00410288ZA03290015DLDBJD12345678\n" +
      "DAAPUBLIC,JOHN,Q\n" +
      "DABPUBLIC\n" +
      "DACJOHN\n" +
      "DADQUINCY\n" +
      "DAG789 E OAK ST\n" +
      "DAIANYTOWN\n" +
      "DAHAPT #4A\n" +
      "DAJCA\n" +
      "DAK90223\n" +
      "DBB19700115\n" +
      "DBA20350131\n" +
      "DAU509\n" +
      "DAW180\n" +
      "DAZBR\n" +
      "DAYGRN\n" +
      "DBC1\n" +
      "DBHN\n" +
      "DARD\n" +
      "DBD20131003\n" +
      "DBE2013-10-03 00.00.00.000000\n" +
      "DBIN\n" +
      "ZAZAA7V81\n"
    return rawData
  }

  func emptyLicenseData() -> String{
    let rawData = "@\n" +
      "\n" +
      "ANSI 636026010102DL00410288ZA03290015DLDBJD12345678\n" +
      "DAA\n" +
      "DAB\n" +
      "DAC\n" +
      "DAD\n" +
      "DAG\n" +
      "DAH\n" +
      "DAI\n" +
      "DAJ\n" +
      "DAK\n" +
      "DBB\n" +
      "DBA\n" +
      "DAU\n" +
      "DAW\n" +
      "DAZ\n" +
      "DAY\n" +
      "DBC\n" +
      "DBH\n" +
      "DAR\n" +
      "DBD\n" +
      "DBE\n" +
      "DBI\n" +
    "Z\n"
    return rawData
  }
}
