//
//  FieldMapper.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/9/16.
//
//

import Foundation

public protocol FieldMapping{
  var fields: [String: String] { get set }

  func fieldFor(key: String) -> String
}

public class FieldMapper: FieldMapping{
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

  public func fieldFor(key: String) -> String {
    guard fields.keys.contains(key) else { return "" }

    return fields[key]!
  }
}


