import Quick
import Nimble
import LicenseParser

class LicenseParserSpec: QuickSpec {
  override func spec() {
    
    describe("Parsing the AAMVA Document Standard"){
      context("when the version is present"){
        it("should reveal the correct version number"){
          let sut = LicenseParser.Parser(data: "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.version).to(equal("08"))
        }
      }
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
      context("when the suffix alias is present"){
        it("should reveal the suffix alias"){
          let sut = LicenseParser.Parser(data: "DBSJR\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.suffixAlias).to(equal("JR"))
        }
      }
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
      context("when the first name alias is present"){
        it("should reveal the first name alias"){
          let sut = LicenseParser.Parser(data: "DBGJOHNALIAS\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.firstNameAlias).to(equal("JOHNALIAS"))
        }
      }
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
      context("when the last name alias is present"){
        it("should reveal the last name alias"){
          let sut = LicenseParser.Parser(data: "DBNPUBLICALIAS\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastNameAlias).to(equal("PUBLICALIAS"))
        }
      }
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
      context("when the inventory control number is present"){
        it("should reveal the inventory control number"){
          let sut = LicenseParser.Parser(data: "DCK12345678900000000000\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.inventoryControlNumber).to(equal("12345678900000000000"))
        }
      }
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
      context("when the audit information is present"){
        it("should reveal the audit information"){
          let sut = LicenseParser.Parser(data: "DCJCA1234BBB\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.auditInformation).to(equal("CA1234BBB"))
        }
      }
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
      context("when the place of birth is present"){
        it("should reveal the place of birth"){
          let sut = LicenseParser.Parser(data: "DCICALIFORNIA, USA\n")
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.placeOfBirth).to(equal("CALIFORNIA, USA"))
        }
      }
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
      context("when the street address supplement is present"){
        it("should reveal the supplemental street address"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddressSupplement).to(equal("APT #4A"))
        }
      }
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
      context("when the country is present"){
        context("when issued in the United States of America"){
          it("should reveal the correct issuing country"){
            let sut = LicenseParser.Parser(data: self.validLicenseData())
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.country).to(equal(LicenseParser.IssuingCountry.UnitedStates))
          }
        }
        context("when issued in Canada"){
          it("should reveal the correct issuing country"){
            let sut = LicenseParser.Parser(data: "DCGCAN\n")
            let result: LicenseParser.ParsedLicense = sut.parse()
            expect(result.country).to(equal(LicenseParser.IssuingCountry.Canada))
          }
        }
      }
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
      context("when the document id is present"){
        it("should reveal the document id"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.documentId).to(equal("83D9BN217QO983B1"))
        }
      }
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
      context("when the customer id number is present"){
        it("should reveal the customer id number"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.customerId).to(equal("D12345678"))
        }
      }
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
      context("when the postal code is present"){
        it("should reveal the postal code"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.postalCode).to(equal("902230000"))
        }
      }
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
      context("when the state is present"){
        it("should reveal the state"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.state).to(equal("CA"))
        }
      }
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
      context("when the city is present"){
        it("should reveal the city"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.city).to(equal("ANYTOWN"))
        }
      }
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
      context("when the street address is present"){
        it("should reveal the street address"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.streetAddress).to(equal("789 E OAK ST"))
        }
      }
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
      context("when the height is present"){
        it("should reveal the height in inches"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.height).to(equal(69))
        }
      }
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
      context("when the last name is present"){
        it("should reveal the last name"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          expect(result.lastName).to(equal("PUBLIC"))
        }
      }
      context("when the last name is missing"){
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
      context("when the middle name is missing"){
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
      context("when the expiration date is present"){
        it("should reveal the expiration date"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          
          let formatter = NSDateFormatter()
          formatter.dateFormat = "MMddyyyy"
          let expectedDate = formatter.dateFromString("01312035")
          
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
      context("when the issue date is present"){
        it("should reveal the issue date"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          
          let formatter = NSDateFormatter()
          formatter.dateFormat = "MMddyyyy"
          let expectedDate = formatter.dateFromString("08242015")
          
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
      context("when the date of birth is present"){
        it("should reveal the date of birth"){
          let sut = LicenseParser.Parser(data: self.validLicenseData())
          let result: LicenseParser.ParsedLicense = sut.parse()
          
          let formatter = NSDateFormatter()
          formatter.dateFormat = "MMddyyyy"
          let expectedDate = formatter.dateFromString("01151970")
          
          expect(result.dateOfBirth).to(equal(expectedDate))
        }
      }
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
  
  func validLicenseData() -> String{
    let rawData = "@\n" +
      "\n" +
      "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n" +
      "DCSPUBLIC\n" +
      "DDEN\n" +
      "DACJOHN\n" +
      "DDFN\n" +
      "DADQUINCY\n" +
      "DDGN\n" +
      "DCAD\n" +
      "DCBNONE\n" +
      "DCDNONE\n" +
      "DBD08242015\n" +
      "DBB01151970\n" +
      "DBA01312035\n" +
      "DBC1\n" +
      "DAU069 in\n" +
      "DAYGRN\n" +
      "DAG789 E OAK ST\n" +
      "DAHAPT #4A\n" +
      "DAIANYTOWN\n" +
      "DAJCA\n" +
      "DAK902230000  \n" +
      "DCF83D9BN217QO983B1\n" +
      "DCGUSA\n" +
      "DAW180\n" +
      "DAZBRO\n" +
      "DCK12345678900000000000\n" +
      "DDB02142014\n" +
      "DDK1\n" +
      "ZAZAAN\n" +
      "ZAB\n" +
      "ZAC"
    return rawData
  }
  
  func emptyLicenseData() -> String{
    let rawData = "@\n" +
      "\n" +
      "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n" +
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
