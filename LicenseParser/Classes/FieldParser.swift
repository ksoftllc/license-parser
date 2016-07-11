//
//  FieldParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/10/16.
//
//

import Foundation

public protocol FieldParsing{
  var fieldMapper: FieldMapping { get set }
  var data: String { get set }

  func parseString(key: String) -> String?
  func parseDouble(key: String) -> Double?
  func parseDate(key: String) -> NSDate?
  func parseExpirationDate() -> NSDate?
  func parseIssueDate() -> NSDate?
  func parseDateOfBirth() -> NSDate?
  func parseCountry() -> IssuingCountry
  func parseTruncationStatus(field: String) -> Truncation
  func parseGender() -> Gender
  func parseEyeColor() -> EyeColor
  func parseNameSuffix() -> NameSuffix
  func parseHeight() -> Double?
  func parseHairColor() -> HairColor
  func getDateFormat() -> String
  func parseFirstName() -> String?
  func parseLastName() -> String?
  func parseMiddleName() -> String?
}

class FieldParser: FieldParsing{
  var fieldMapper: FieldMapping
  var data: String

  init(data: String, fieldMapper: FieldMapping){
    self.data = data
    self.fieldMapper = fieldMapper
  }

  convenience init(data: String){
    self.init(data: data, fieldMapper: FieldMapper())
  }

  func parseString(key: String) -> String?{
    let identifier = fieldMapper.fieldFor(key)
    do{
      let regex: NSRegularExpression = try NSRegularExpression(pattern: "\(identifier)(.+)\\b", options: .CaseInsensitive)
      let matches = regex.matchesInString(data, options: NSMatchingOptions(), range: NSRange(location: 0, length: data.characters.count)) as [NSTextCheckingResult]
      guard let firstMatch = matches.first else { return nil }

      let matchedGroup = (data as NSString).substringWithRange(firstMatch.rangeAtIndex(1))
      guard !matchedGroup.isEmpty else { return nil }
      return matchedGroup.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }catch{
      return nil
    }
  }

  func parseDouble(key: String) -> Double?{
    let identifier = fieldMapper.fieldFor(key)
    do{
      let regex: NSRegularExpression = try NSRegularExpression(pattern: "\(identifier)(\\w+)\\b", options: .CaseInsensitive)
      let matches = regex.matchesInString(data, options: NSMatchingOptions(), range: NSRange(location: 0, length: data.characters.count)) as [NSTextCheckingResult]
      guard let firstMatch = matches.first else { return nil }

      let matchedGroup = (data as NSString).substringWithRange(firstMatch.rangeAtIndex(1))
      guard !matchedGroup.isEmpty else { return nil }
      return Double(matchedGroup)
    }catch{
      return nil
    }
  }

  func parseDate(field: String) -> NSDate?{
    guard let dateString = parseString(field) else { return nil }
    guard !dateString.isEmpty else { return nil }

    let formatter = NSDateFormatter()
    formatter.dateFormat = getDateFormat()
    guard let parsedDate = formatter.dateFromString(dateString) else { return nil }

    return parsedDate
  }

  func getDateFormat() -> String {
    return "MMddyyyy"
  }

  func parseFirstName() -> String?{
    return parseString("firstName")
  }

  func parseLastName() -> String?{
    return parseString("lastName")
  }

  func parseMiddleName() -> String?{
    return parseString("middleName")
  }


  func parseExpirationDate() -> NSDate?{
    return parseDate("expirationDate")
  }

  func parseIssueDate() -> NSDate?{
    return parseDate("issueDate")
  }

  func parseDateOfBirth() -> NSDate?{
    return parseDate("dateOfBirth")
  }

  func parseCountry() -> IssuingCountry{
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

  func parseTruncationStatus(field: String) -> Truncation{
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

  func parseGender() -> Gender{
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

  func parseEyeColor() -> EyeColor{
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

  func parseNameSuffix() -> NameSuffix{
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

  func parseHairColor() -> HairColor{
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

  func parseHeight() -> Double?{
    return parseDouble("height")
  }

}