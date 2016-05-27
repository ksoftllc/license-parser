# LicenseParser
[![Build Status](https://travis-ci.org/sealz/license-parser.svg?branch=0.4.0)](https://travis-ci.org/sealz/license-parser)

Easily parse the information within PDF-417 barcodes found on the back of
US and Canadian driver's licenses adhering to the AAMVA Version 8
standard.

# Installation
```ruby
  use_frameworks!

  pod 'LicenseParser'
```

## AAMVA Standard

### Example of a raw driver's license payload
```
@

ANSI 636026080102DL00410288ZA03290015DLDAQD12345678
DCSPUBLIC
DDEN
DACJOHN
DDFN
DADQUINCY
DDGN
DCAD
DCBNONE
DCDNONE
DBD08242015
DBB01311970
DBA01312035
DBC1
DAU069 in
DAYGRN
DAG789 E OAK ST
DAIANYTOWN
DAJCA
DAK902230000  
DCF83D9BN217QO983B1
DCGUSA
DAW180
DAZBRO
DCK12345678900000000000
DDB02142014
DDK1
ZAZAAN
ZAB
ZAC
```

## Supported Fields
| Identifier | Name | Description | Type | `ParsedLicense` Attribute |
| :-----: | ----- | ------- | ------- | -------- |
| DAC | First Name | Customer First Name | String | `firstName` |
| DCS | Last Name | Customer Last Name | String | `lastName` |
| DAD | Middle Name | Customer Middle Name | String | `middleName` |
| DBA | Expiration Date | Document Expiration Date | NSDate | `expirationDate` |
| DBD | Issue Date | Document Issue Date | NSDate | `issueDate` |
| DBB | Date of Birth | Customer Date of Birth | NSDate | `dateOfBirth` |
| DBC | Gender | Customer Gender | Enum | `gender` |
| DAY | Eye Color | Customer Eye Color | Enum| `eyeColor` |
| DAZ | Hair Color | Customer Hair Color | Enum| `hairColor` |
| DAU | Height | Customer Height (in inches) | Double | `height` |
| DAG | Street Address | Customer Street Address | String | `streetAddress` |
| DAH | Second Street Address | Customer Street Address Line 2 | String | `streetAddressSupplement` |
| DAI | City | Customer City | String | `city` |
| DAJ | State | Customer State | String | `state` |
| DAK | Postal Code | Customer Postal Code | String | `postalCode` |
| DAQ | Customer ID | Unique Customer ID Number | String | `customerId` |
| DCF | Document ID | Unique Document ID Number | String | `documentId` |
| DCG | Issuing Country | Issuing Country | Enum | `issuingCountry` |
| DDG | Middle Name Truncation | Was Middle Name truncated? | Enum | `middleNameTruncation` |
| DDF | First Name Truncation | Was First Name truncated? | Enum| `firstNameTruncation` |
| DDE | Last Name Truncation | Was Last Name truncated? | Enum| `lastNameTruncation` |
| DCI | Place of Birth | Country and municipality and/or state/province | String | `placeOfBirth` |
| DCJ | Audit Information | A string of letters and/or numbers that identifies when, where, and by whom a driver license/ID card was made. | String | `auditInformation` |
| DCK | Inventory Control | A string of letters and/or numbers that is affixed to the raw materials (card stock, laminate, etc.) used in producing driver licenses and ID cards. | String | `inventoryControlNumber` |
| DBN | Last Name Alias | Other Last Name by which cardholder is known. | String | `lastNameAlias` |
| DBG | First Name Alias | Other First Name by which the cardholder is known. | String | `firstNameAlias` |
| DBS | Suffix Alias | Other suffix by which cardholder is known | String | `suffixAlias` |
| DCU | Name Suffix | Name Suffix | Enum | `suffix` |

## Installation

LicenseParser is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LicenseParser"
```

## Usage

```swift

// First get the PDF-417 barcode data by scanning the barcode on the license
let pdf417Data: String = MyFakeLicenseScanner.scan()

// Create a parser with that data
let parser: Parser = Parser(data: pdf417Data)

// Ask the parser to parse it
let parsedLicense: ParsedLicense = parser.parse()

print(parsedLicense.firstName)
// => Optional("John")
print(parsedLicense.middleName)
// => Optional("Quincy")
print(parsedLicense.lastName)
// => Optional("Public")
```

## License

LicenseParser is available under the MIT license. See the LICENSE file for more info.
