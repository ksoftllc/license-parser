//
//  LicenseParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 5/13/16.
//
//

import Foundation
import CrossroadRegex

public class Parser{
  var data: String
  var fieldMapping: [String: String] = [
    "firstName"               : "DAC",
    "lastName"                : "DCS",
    "middleName"              : "DAD",
    "expirationDate"          : "DBA",
    "issueDate"               : "DBD",
    "dateOfBirth"             : "DBB",
    "gender"                  : "DBC",
    "eyeColor"                : "DAY",
    "height"                  : "DAU",
    "streetAddress"           : "DAG",
    "city"                    : "DAI",
    "state"                   : "DAJ",
    "postalCode"              : "DAK",
    "customerId"              : "DAQ",
    "documentId"              : "DCF",
    "country"                 : "DCG",
    "middleNameTruncation"    : "DDG",
    "firstNameTruncation"     : "DDF",
    "lastNameTruncation"      : "DDE",
    "streetAddressSupplement" : "DAH",
    "hairColor"               : "DAZ",
    "placeOfBirth"            : "DCI",
    "auditInformation"        : "DCJ",
    "inventoryControlNumber"  : "DCK",
    "lastNameAlias"           : "DBN",
    "firstNameAlias"          : "DBG",
    "suffixAlias"             : "DBS",
    "suffix"                  : "DCU"
  ]
  
  public init(data: String){
    self.data = data
  }
  
  public func parse() -> ParsedLicense{
    return License(
      firstName               : parseString("firstName"),
      lastName                : parseString("lastName"),
      middleName              : parseString("middleName"),
      expirationDate          : parseExpirationDate(),
      issueDate               : parseIssueDate(),
      dateOfBirth             : parseDateOfBirth(),
      gender                  : parseGender(),
      eyeColor                : parseEyeColor(),
      height                  : parseHeight(),
      streetAddress           : parseString("streetAddress"),
      city                    : parseString("city"),
      state                   : parseString("state"),
      postalCode              : parseString("postalCode"),
      customerId              : parseString("customerId"),
      documentId              : parseString("documentId"),
      country                 : parseCountry(),
      middleNameTruncation    : parseTruncationStatus("middleNameTruncation"),
      firstNameTruncation     : parseTruncationStatus("firstNameTruncation"),
      lastNameTruncation      : parseTruncationStatus("lastNameTruncation"),
      streetAddressSupplement : parseString("streetAddressSupplement"),
      hairColor               : parseHairColor(),
      placeOfBirth            : parseString("placeOfBirth"),
      auditInformation        : parseString("auditInformation"),
      inventoryControlNumber  : parseString("inventoryControlNumber"),
      lastNameAlias           : parseString("lastNameAlias"),
      firstNameAlias          : parseString("firstNameAlias"),
      suffixAlias             : parseString("suffixAlias"),
      suffix                  : parseNameSuffix()
    )
  }
  
  private func parseString(key: String) -> String?{
    guard let identifier   = fieldMapping[key] else { return nil }
    guard let regex        = "\(identifier)(.*)\n".r else { return nil }
    guard let match        = regex.findFirst(data) else { return nil }
    guard let matchedGroup = match.group(1) else { return nil }
    guard !matchedGroup.isEmpty else { return nil }
    
    return matchedGroup.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
  
  private func parseDouble(key: String) -> Double?{
    guard let identifier   = fieldMapping[key] else { return nil }
    guard let regex        = "\(identifier)([0-9]+).*\n".r else { return nil }
    guard let match        = regex.findFirst(data) else { return nil }
    guard let matchedGroup = match.group(1) else { return nil }
    guard !matchedGroup.isEmpty else { return nil }
    
    return Double(matchedGroup)
  }
  
  private func parseDate(field: String) -> NSDate?{
    guard let dateString = parseString(field) else { return nil }
    guard !dateString.isEmpty else { return nil }
    
    let formatter = NSDateFormatter()
    formatter.dateFormat = "MMddyyyy"
    guard let parsedDate = formatter.dateFromString(dateString) else { return nil }
    
    return parsedDate
  }
  
  private func parseExpirationDate() -> NSDate?{
    return parseDate("expirationDate")
  }
  
  private func parseIssueDate() -> NSDate?{
    return parseDate("issueDate")
  }
  
  private func parseDateOfBirth() -> NSDate?{
    return parseDate("dateOfBirth")
  }
  
  private func parseCountry() -> IssuingCountry{
    guard let country = parseString("country") else { return .Unknown }
    switch country{
    case "USA":
      return .UnitedStates
    case "CAN":
      return .Canada
    default:
      return .Unknown
    }
  }
  
  private func parseTruncationStatus(field: String) -> Truncation{
    guard let truncation = parseString(field) else { return .Unknown }
    
    switch truncation{
    case "T":
      return .Truncated
    case "N":
      return .None
    default:
      return .Unknown
    }
  }
  
  private func parseGender() -> Gender{
    guard let gender = parseString("gender") else { return .Unknown }
    switch gender {
    case "1":
      return .Male
    case "2":
      return .Female
    default:
      return .Other
    }
  }
  
  private func parseEyeColor() -> EyeColor{
    guard let color = parseString("eyeColor") else { return .Unknown }
    switch color{
    case "BLK":
      return .Black
    case "BLU":
      return .Blue
    case "BRO":
      return .Brown
    case "GRY":
      return .Gray
    case "GRN":
      return .Green
    case "HAZ":
      return .Hazel
    case "MAR":
      return .Maroon
    case "PNK":
      return .Pink
    case "DIC":
      return .Dichromatic
    default:
      return .Unknown
    }
  }
  
  private func parseNameSuffix() -> NameSuffix{
    guard let suffix = parseString("suffix") else { return .Unknown }
    
    switch suffix{
    case "JR":
      return .Junior
    case "SR":
      return .Senior
    case "1ST", "I":
      return .First
    case "2ND", "II":
      return .Second
    case "3RD", "III":
      return .Third
    case "4TH", "IV":
      return .Fourth
    case "5TH", "V":
      return .Fifth
    case "6TH", "VI":
      return .Sixth
    case "7TH", "VII":
      return .Seventh
    case "8TH", "VIII":
      return .Eighth
    case "9TH", "IX":
      return .Ninth
    default:
      return .Unknown
    }
  }
  
  private func parseHairColor() -> HairColor{
    guard let color = parseString("hairColor") else { return .Unknown }
    
    switch color {
    case "BAL":
      return .Bald
    case "BLK":
      return .Black
    case "BLN":
      return .Blond
    case "BRO":
      return .Brown
    case "GRY":
      return .Grey
    case "RED":
      return .Red
    case "SDY":
      return .Sandy
    case "WHI":
      return .White 
    default:
      return .Unknown
    }
  }
  
  private func parseHeight() -> Double?{
    return parseDouble("height")
  }
}

