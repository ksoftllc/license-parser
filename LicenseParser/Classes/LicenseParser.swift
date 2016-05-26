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
    "hairColor"               : "DAZ"
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
      hairColor               : parseHairColor()
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

public enum IssuingCountry{
  case UnitedStates
  case Canada
  case Unknown
}

public enum Gender{
  case Male
  case Female
  case Unknown
  case Other
}

public enum EyeColor{
  case Black
  case Blue
  case Brown
  case Gray
  case Green
  case Hazel
  case Maroon
  case Pink
  case Dichromatic
  case Unknown
}

public enum HairColor{
  case Bald
  case Black
  case Blond
  case Brown
  case Grey
  case Red
  case Sandy
  case White
  case Unknown
}

public enum Truncation{
  case Truncated
  case None
  case Unknown
}

public struct License: ParsedLicense{
  public var firstName: String?
  public var lastName: String?
  public var middleName: String?
  public var expirationDate: NSDate?
  public var issueDate: NSDate?
  public var dateOfBirth: NSDate?
  public var gender: LicenseParser.Gender
  public var eyeColor: LicenseParser.EyeColor
  public var height: Double?
  public var streetAddress: String?
  public var city: String?
  public var state: String?
  public var postalCode: String?
  public var customerId: String?
  public var documentId: String?
  public var country: LicenseParser.IssuingCountry
  public var middleNameTruncation: LicenseParser.Truncation
  public var firstNameTruncation: LicenseParser.Truncation
  public var lastNameTruncation: LicenseParser.Truncation
  public var streetAddressSupplement: String?
  public var hairColor: LicenseParser.HairColor
  
  public func isExpired() -> Bool {
    guard let withDate = self.expirationDate else { return false }
    guard NSDate().compare(withDate) == NSComparisonResult.OrderedDescending else { return false }
    return true
  }
  
  public func hasBeenIssued() -> Bool {
    guard let withDate = self.issueDate else { return false }
    guard NSDate().compare(withDate) == NSComparisonResult.OrderedDescending else { return false }
    return true
  }
}

public protocol ParsedLicense{
  var firstName: String? { get set }
  var lastName: String? { get set }
  var middleName: String? { get set }
  var expirationDate: NSDate? { get set }
  var issueDate: NSDate? { get set }
  var dateOfBirth: NSDate? { get set }
  var gender: LicenseParser.Gender { get set }
  var eyeColor: LicenseParser.EyeColor { get set }
  var height: Double? { get set }
  var streetAddress: String? { get set }
  var city: String? { get set }
  var state: String? { get set }
  var postalCode: String? { get set }
  var customerId: String? { get set }
  var documentId: String? { get set }
  var country: LicenseParser.IssuingCountry { get set }
  var middleNameTruncation: LicenseParser.Truncation { get set }
  var firstNameTruncation: LicenseParser.Truncation { get set }
  var lastNameTruncation: LicenseParser.Truncation { get set }
  var streetAddressSupplement: String? { get set }
  var hairColor: LicenseParser.HairColor { get set }
  
  func isExpired() -> Bool
  func hasBeenIssued() -> Bool
}