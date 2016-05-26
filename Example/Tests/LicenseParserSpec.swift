import Quick
import Nimble
import LicenseParser

class LicenseParserSpec: QuickSpec {
  override func spec() {
    
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
