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
  public var pdf417: String?

  public init(
    firstName: String?, lastName: String?, middleName: String?,
    expirationDate: NSDate?, issueDate: NSDate?, dateOfBirth: NSDate?,
    gender: Gender, eyeColor: EyeColor, height: Double?, streetAddress: String?,
    city: String?, state: String?, postalCode: String?, customerId: String?,
    documentId: String?, country: IssuingCountry, middleNameTruncation: Truncation,
    firstNameTruncation: Truncation, lastNameTruncation: Truncation,
    streetAddressSupplement: String?, hairColor: HairColor,
    placeOfBirth: String?, auditInformation: String?,
    inventoryControlNumber: String?, lastNameAlias: String?,
    firstNameAlias: String?, suffixAlias: String?, suffix: NameSuffix,
    version: String?, pdf417: String?){
    self.firstName               = firstName
    self.lastName                = lastName
    self.middleName              = middleName
    self.expirationDate          = expirationDate
    self.issueDate               = issueDate
    self.dateOfBirth             = dateOfBirth
    self.gender                  = gender
    self.eyeColor                = eyeColor
    self.height                  = height
    self.streetAddress           = streetAddress
    self.city                    = city
    self.state                   = state
    self.postalCode              = postalCode
    self.customerId              = customerId
    self.documentId              = documentId
    self.country                 = country
    self.middleNameTruncation    = middleNameTruncation
    self.firstNameTruncation     = firstNameTruncation
    self.lastNameTruncation      = lastNameTruncation
    self.streetAddressSupplement = streetAddressSupplement
    self.hairColor               = hairColor
    self.placeOfBirth            = placeOfBirth
    self.auditInformation        = auditInformation
    self.inventoryControlNumber  = inventoryControlNumber
    self.lastNameAlias           = lastNameAlias
    self.firstNameAlias          = firstNameAlias
    self.suffixAlias             = suffixAlias
    self.suffix                  = suffix
    self.version                 = version
    self.pdf417                  = pdf417
  }

  public init(){
    self.firstName               = nil
    self.lastName                = nil
    self.middleName              = nil
    self.expirationDate          = nil
    self.issueDate               = nil
    self.dateOfBirth             = nil
    self.gender                  = Gender.Unknown
    self.eyeColor                = EyeColor.Unknown
    self.height                  = nil
    self.streetAddress           = nil
    self.city                    = nil
    self.state                   = nil
    self.postalCode              = nil
    self.customerId              = nil
    self.documentId              = nil
    self.country                 = IssuingCountry.UnitedStates
    self.middleNameTruncation    = Truncation.None
    self.firstNameTruncation     = Truncation.None
    self.lastNameTruncation      = Truncation.None
    self.streetAddressSupplement = nil
    self.hairColor               = HairColor.Unknown
    self.placeOfBirth            = nil
    self.auditInformation        = nil
    self.inventoryControlNumber  = nil
    self.lastNameAlias           = nil
    self.firstNameAlias          = nil
    self.suffixAlias             = nil
    self.suffix                  = NameSuffix.Unknown
    self.version                 = nil
    self.pdf417                  = nil
  }
  
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

  public func isAcceptable() -> Bool{
    guard !isExpired() else { return false }
    guard hasBeenIssued() else { return false }

    guard expirationDate != nil else { return false }
    guard lastName       != nil else { return false }
    guard firstName      != nil else { return false }
    guard middleName     != nil else { return false }
    guard issueDate      != nil else { return false }
    guard dateOfBirth    != nil else { return false }
    guard height         != nil else { return false }
    guard streetAddress  != nil else { return false }
    guard city           != nil else { return false }
    guard state          != nil else { return false }
    guard postalCode     != nil else { return false }
    guard documentId     != nil else { return false }

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
  var pdf417: String? {get set}
  
  func isExpired() -> Bool
  func hasBeenIssued() -> Bool
  func isAcceptable() -> Bool
}
