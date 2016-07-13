import Foundation

/// Defines Field Mapping Behavior
public protocol FieldMapping{
  /// A list of AAMVA field designator mappings (e.g. "firstName" => "DAC")
  var fields: [String: String] { get set }

  /**
    Determine the AAMVA field designator for a particular human readable key.

    - Parameters:
      - key: The human readable key

    - Returns: The AAMVA field designator
  */
  func fieldFor(key: String) -> String
}

/// A basic Field Mapping implementation based on the AAMVA Version 8 standard
public class FieldMapper: FieldMapping{

  /// A list of AAMVA field designator mappings (e.g. "firstName" => "DAC")
  public var fields: [String: String] = [
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

  /**
    Determine the AAMVA field designator for a particular human readable key.

    - Parameters:
      - key: The human readable key

    - Returns: The AAMVA field designator
  */
  public func fieldFor(key: String) -> String {
    guard fields.keys.contains(key) else { return "" }

    return fields[key]!
  }
}
