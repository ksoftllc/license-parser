//
//  License.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 5/25/16.
//
//

import Foundation
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
  public var placeOfBirth: String?
  public var auditInformation: String?
  public var inventoryControlNumber: String?
  public var lastNameAlias: String?
  public var firstNameAlias: String?
  public var suffixAlias: String?
  public var suffix: LicenseParser.NameSuffix
  public var version: String?
  
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
  var placeOfBirth: String? { get set }
  var auditInformation: String? { get set }
  var inventoryControlNumber: String? { get set }
  var lastNameAlias: String? { get set }
  var firstNameAlias: String? { get set }
  var suffixAlias: String? { get set }
  var suffix: LicenseParser.NameSuffix { get set }
  var version: String? {get set}
  
  func isExpired() -> Bool
  func hasBeenIssued() -> Bool
}
