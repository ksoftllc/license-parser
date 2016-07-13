import Foundation

/// A Representation of the scanned AAMVA License
public struct License: ParsedLicense{

  /// The license holder's first/given name
  public var firstName: String?

  /// The license holder's last/given name
  public var lastName: String?

  /// The license holder's middle name
  public var middleName: String?

  /// The expiration date of the license
  public var expirationDate: NSDate?

  /// The issue date of the license
  public var issueDate: NSDate?

  /// The license holder's date of birth
  public var dateOfBirth: NSDate?

  /// The license holder's gender
  public var gender: LicenseParser.Gender

  /// The license holder's eye color
  public var eyeColor: LicenseParser.EyeColor

  /// The license holder's height
  public var height: Double?

  /// The license holder's street address
  public var streetAddress: String?

  /// The license holder's city
  public var city: String?

  /// The license holder's state
  public var state: String?

  /// The license holder's postal code
  public var postalCode: String?

  /// The license holder's customer Id (e.g. Driver License Number)
  public var customerId: String?

  /// A unique document identifier
  public var documentId: String?

  /// The license's issuing country
  public var country: LicenseParser.IssuingCountry

  /// A determination of if the middle name was truncated
  public var middleNameTruncation: LicenseParser.Truncation

  /// A determination of if the first name was truncated
  public var firstNameTruncation: LicenseParser.Truncation

  /// A determination of if the last name was truncated
  public var lastNameTruncation: LicenseParser.Truncation

  /// The license holder's supplemental street address
  public var streetAddressSupplement: String?

  /// The license holder's hair color
  public var hairColor: LicenseParser.HairColor

  /// The license holder's place of birth
  public var placeOfBirth: String?

  /// The license issuer's audit information
  public var auditInformation: String?

  /// The license issuer's
  public var inventoryControlNumber: String?

  /// The license holder's last name alias
  public var lastNameAlias: String?

  /// The license holder's first name alias
  public var firstNameAlias: String?

  /// The license holder's name suffix alias
  public var suffixAlias: String?

  /// The license holder's name suffix
  public var suffix: LicenseParser.NameSuffix

  /// The AAMVA version to which this parsed license conforms
  public var version: String?

  /// The raw pdf417 scan data used to build this parsed license
  public var pdf417: String?

  /**
    Initializes a new License object

    - Parameters:
      - firstName: The license holder's first/given name
      - lastName: The license holder's last/given name
      - middleName: The license holder's middle name
      - expirationDate: The expiration date of the license
      - issueDate: The issue date of the license
      - dateOfBirth: The license holder's date of birth
      - gender: The license holder's gender
      - eyeColor: The license holder's eye color
      - height: The license holder's height
      - streetAddress: The license holder's street address
      - city: The license holder's city
      - state: The license holder's state
      - postalCode: The license holder's postal code
      - customerId: The license holder's customer Id (e.g. Driver License Number)
      - documentId: A unique document identifier
      - country: The license's issuing country
      - middleNameTruncation: A determination of if the middle name was truncated
      - firstNameTruncation: A determination of if the first name was truncated
      - lastNameTruncation: A determination of if the last name was truncated
      - streetAddressSupplement: The license holder's supplemental street address
      - hairColor: The license holder's hair color
      - placeOfBirth: The license holder's place of birth
      - auditInformation: The license issuer's audit information
      - inventoryControlNumber: The license issuer's
      - lastNameAlias: The license holder's last name alias
      - firstNameAlias: The license holder's first name alias
      - suffixAlias: The license holder's name suffix alias
      - suffix: The license holder's name suffix
      - version: The AAMVA version to which this parsed license conforms
      - pdf417: The raw pdf417 scan data used to build this parsed license

    - Returns: A license populated with the input values
  */
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

  /**
    Initializes a new empty License object

    - Returns: An empty License
  */

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

  /**
    Determines if the license is expired based on the `expirationDate`

    Returns: True when the current date is past the expiration date, false otherwise.
  */
  public func isExpired() -> Bool {
    guard let withDate = self.expirationDate else { return false }
    guard NSDate().compare(withDate) == NSComparisonResult.OrderedDescending else { return false }
    return true
  }

  /**
    Determines if the license has been issued based on the `issueDate`

    Returns: True when the current date is past the issue date, false otherwise.
  */
  public func hasBeenIssued() -> Bool {
    guard let withDate = self.issueDate else { return false }
    guard NSDate().compare(withDate) == NSComparisonResult.OrderedDescending else { return false }
    return true
  }

  /**
    Determines if enough of the license data is present to be useful for most things.

    Returns: True when a set of essential properties are non-empty, false otherwise.
  */

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

/// Represents the behavior of a parsed license
public protocol ParsedLicense{
  /// The license holder's first/given name
  var firstName: String? { get set }
  /// The license holder's last/given name
  var lastName: String? { get set }
  /// The license holder's middle name
  var middleName: String? { get set }
  /// The expiration date of the license
  var expirationDate: NSDate? { get set }
  /// The issue date of the license
  var issueDate: NSDate? { get set }
  /// The license holder's date of birth
  var dateOfBirth: NSDate? { get set }
  /// The license holder's gender
  var gender: LicenseParser.Gender { get set }
  /// The license holder's eye color
  var eyeColor: LicenseParser.EyeColor { get set }
  /// The license holder's height
  var height: Double? { get set }
  /// The license holder's street address
  var streetAddress: String? { get set }
  /// The license holder's city
  var city: String? { get set }
  /// The license holder's state
  var state: String? { get set }
  /// The license holder's postal code
  var postalCode: String? { get set }
  /// The license holder's customer Id (e.g. Driver License Number)
  var customerId: String? { get set }
  /// A unique document identifier
  var documentId: String? { get set }
  /// The license's issuing country
  var country: LicenseParser.IssuingCountry { get set }
  /// A determination of if the middle name was truncated
  var middleNameTruncation: LicenseParser.Truncation { get set }
  /// A determination of if the first name was truncated
  var firstNameTruncation: LicenseParser.Truncation { get set }
  /// A determination of if the last name was truncated
  var lastNameTruncation: LicenseParser.Truncation { get set }
  /// The license holder's supplemental street address
  var streetAddressSupplement: String? { get set }
  /// The license holder's hair color
  var hairColor: LicenseParser.HairColor { get set }
  /// The license holder's place of birth
  var placeOfBirth: String? { get set }
  /// The license issuer's audit information
  var auditInformation: String? { get set }
  /// The license issuer's
  var inventoryControlNumber: String? { get set }
  /// The license holder's last name alias
  var lastNameAlias: String? { get set }
  /// The license holder's first name alias
  var firstNameAlias: String? { get set }
  /// The license holder's name suffix alias
  var suffixAlias: String? { get set }
  /// The license holder's name suffix
  var suffix: LicenseParser.NameSuffix { get set }
  /// The AAMVA version to which this parsed license conforms
  var version: String? {get set}
  /// The raw pdf417 scan data used to build this parsed license
  var pdf417: String? {get set}

  /**
    Determine if the license has expired

    - Returns: True or False
  */
  func isExpired() -> Bool

  /**
    Determine if the license has been issues

    - Returns: True or false
  */
  func hasBeenIssued() -> Bool

  /**
    Determine if the license has enough valid data

    - Returns: True or False
  */
  func isAcceptable() -> Bool
}
