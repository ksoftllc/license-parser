# LicenseParser

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

```ruby
# Podfile
use_frameworks!
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
| Identifier | Name | Description | Type |
| :-----: | ----- | ------- | ------- |
| DAC | First Name | Customer First Name | String |
| DCS | Last Name | Customer Last Name | String |
| DAD | Middle Name | Customer Middle Name | String |
| DBA | Expiration Date | Document Expiration Date | NSDate |
| DBD | Issue Date | Document Issue Date | NSDate |
| DBB | Date of Birth | Customer Date of Birth | NSDate |
| DBC | Gender | Customer Gender | Enum |
| DAY | Eye Color | Customer Eye Color | Enum|
| DAZ | Hair Color | Customer Hair Color | Enum|
| DAU | Height | Customer Height (in inches) | Double |
| DAG | Street Address | Customer Street Address | String |
| DAH | Second Street Address | Customer Street Address Line 2 | String |
| DAI | City | Customer City | String |
| DAJ | State | Customer State | String |
| DAK | Postal Code | Customer Postal Code | String |
| DAQ | Customer ID | Unique Customer ID Number | String |
| DCF | Document ID | Unique Document ID Number | String |
| DCG | Issuing Country | Issuing Country | Enum |
| DDG | Middle Name Truncation | Was Middle Name truncated? | Enum |
| DDF | First Name Truncation | Was First Name truncated? | Enum|
| DDE | Last Name Truncation | Was Last Name truncated? | Enum|

## Installation

LicenseParser is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LicenseParser"
```

## Author

Clayton LZ, clayton@hauz.io

## License

LicenseParser is available under the MIT license. See the LICENSE file for more info.
