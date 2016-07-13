import Foundation

/// Defines Field Parsing Behavior
public protocol FieldParsing{

  /// A Field Mapping implementing object
  var fieldMapper: FieldMapping { get set }

  /// The AAMVA raw barcode data being parsed
  var data: String { get set }

  /**
    Parse a string out of the raw data

    - Parameters:
      - The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  func parseString(key: String) -> String?

  /**
    Parse a double out of the raw data.

    - Parameters:
      - key: The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  func parseDouble(key: String) -> Double?

  /**
    Parse a date out of the raw data

    - Parameters:
      - key: The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  func parseDate(key: String) -> NSDate?

  /**
    Parse the AAMVA expiration date out of the raw data

    - Parameters:
      - key: The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  func parseExpirationDate() -> NSDate?

  /**
    Parse the AAMVA issue date out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseIssueDate() -> NSDate?

  /**
    Parse the AAMVA date of birth out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseDateOfBirth() -> NSDate?

  /**
    Parse the AAMVA issuing country out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseCountry() -> IssuingCountry

  /**
    Parse the AAMVA name truncation statuses out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseTruncationStatus(field: String) -> Truncation

  /**
    Parse the AAMVA gender out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseGender() -> Gender

  /**
    Parse the AAMVA eye color out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseEyeColor() -> EyeColor

  /**
    Parse the AAMVA name suffix out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseNameSuffix() -> NameSuffix

  /**
    Parse the AAMVA height out of the raw data

    - Returns: An optional value parsed out of the raw data in inches
  */
  func parseHeight() -> Double?

  /**
    Parse the AAMVA hair color out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseHairColor() -> HairColor

  /**
    The string format used with an NSDateFormatter to parse dates. Usually 'yyyyMMdd' or 'MMddyyyy'.

    - Returns: An NSDateFormatter formatter string acceptable date format
  */
  func getDateFormat() -> String

  /**
    Parse the AAMVA first name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseFirstName() -> String?

  /**
    Parse the AAMVA last name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseLastName() -> String?

  /**
    Parse the AAMVA middle name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  func parseMiddleName() -> String?
}

/**
  A basic Field Parsing implementation that can be extended to support multiple AAMVA Versions
*/

public class FieldParser: FieldParsing{

  /// Used to convert cm to inches for height calculations
  static let INCHES_PER_CENTIMETER: Double = 0.393701

  /// A Regex object for doing the heavy lifting
  let regex: Regex = Regex()

  /// A Field Mapping object for finding fields in the raw data
  public var fieldMapper: FieldMapping

  /// The raw data from an AAMVA spec adhering PDF-417 barcode
  public var data: String

  /**
    Initializes a new Field Parser

    - Parameters:
      - data: The AAMVA spec adhering PDF-417 barcode data
      - fieldMapper: A FieldMapping object

    - Returns: An initialized Field Parser
  */
  public init(data: String, fieldMapper: FieldMapping){
    self.data = data
    self.fieldMapper = fieldMapper
  }

  /**
    Initializes a new Field Parser defaulting to the basic FieldMapper

    - Parameters:
      - data: The AAMVA spec adhering PDF-417 barcode data

    - Returns: An initialized Field Parser
  */
  public convenience init(data: String){
    self.init(data: data, fieldMapper: FieldMapper())
  }

  /**
    Parse a string out of the raw data

    - Parameters:
      - The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */

  public func parseString(key: String) -> String?{
    let identifier = fieldMapper.fieldFor(key)
    return regex.firstMatch("\(identifier)(.+)\\b", data: data)
  }

  /**
    Parse a double out of the raw data.

    - Parameters:
      - The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  public func parseDouble(key: String) -> Double?{
    let identifier = fieldMapper.fieldFor(key)
    let result = regex.firstMatch("\(identifier)(\\w+)\\b", data: data)
    guard let unwrappedResult = result else { return nil }

    return Double(unwrappedResult)
  }

  /**
    Parse a date out of the raw data

    - Parameters:
      - The human readable key we're looking for

    - Returns: An optional value parsed out of the raw data
  */
  public func parseDate(field: String) -> NSDate?{
    guard let dateString = parseString(field) else { return nil }
    guard !dateString.isEmpty else { return nil }

    let formatter = NSDateFormatter()
    formatter.dateFormat = getDateFormat()
    guard let parsedDate = formatter.dateFromString(dateString) else { return nil }

    return parsedDate
  }

  /**
    The string format used with an NSDateFormatter to parse dates. Usually 'yyyyMMdd' or 'MMddyyyy'.

    - Returns: An NSDateFormatter formatter string acceptable date format
  */
  public func getDateFormat() -> String {
    return "MMddyyyy"
  }

  /**
    Parse the AAMVA last name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseFirstName() -> String?{
    return parseString("firstName")
  }

  /**
    Parse the AAMVA last name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseLastName() -> String?{
    return parseString("lastName")
  }

  /**
    Parse the AAMVA middle name out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseMiddleName() -> String?{
    return parseString("middleName")
  }

  /**
    Parse the AAMVA expiration date out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseExpirationDate() -> NSDate?{
    return parseDate("expirationDate")
  }

  /**
    Parse the AAMVA issue date out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseIssueDate() -> NSDate?{
    return parseDate("issueDate")
  }

  /**
    Parse the AAMVA date of birth out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseDateOfBirth() -> NSDate?{
    return parseDate("dateOfBirth")
  }

  /**
    Parse the AAMVA issuing country out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseCountry() -> IssuingCountry{
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

  /**
    Parse the AAMVA name truncation statuses out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseTruncationStatus(field: String) -> Truncation{
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

  /**
    Parse the AAMVA gender out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseGender() -> Gender{
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

  /**
    Parse the AAMVA eye color out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseEyeColor() -> EyeColor{
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

  /**
    Parse the AAMVA name suffix out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseNameSuffix() -> NameSuffix{
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

  /**
    Parse the AAMVA hair color out of the raw data

    - Returns: An optional value parsed out of the raw data
  */
  public func parseHairColor() -> HairColor{
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

  /**
    Parse the AAMVA height out of the raw data

    - Returns: An optional value parsed out of the raw data in inches
  */
  public func parseHeight() -> Double?{
    guard let heightString = parseString("height") else { return nil }
    guard let height = parseDouble("height") else { return nil }

    if heightString.containsString("cm"){
      return Double(round(height * FieldParser.INCHES_PER_CENTIMETER))
    }else{
      return height
    }
  }

}
