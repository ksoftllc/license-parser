//
//  VersionFiveParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/15/16.
//
//

import Foundation

class VersionFiveFieldMapper: FieldMapper{
  //  Customer Number - DAQ
  //  Family Name - DCS
  //  Family Name Truncation - DDE
  //  First Names – DAC
  //  First Names Truncation - DDF
  //  Middle Names - DAD
  //  Middle Names Truncation - DDG 
  //  Virginia Specific Class - DCA 
  //  Virginia Specific Restrictions - DCB 
  //  Virginia Specific Endorsements - DCD
  //  Issue Date - DBD
  //  Date of Birth - DBB
  //  Expiration Date - DBA
  //  Sex - DBC
  //  Height - DAU
  //  Eyes - DAY
  //  Address - DAG
  //  City - DAI
  //  State - DAJ
  //  Zip – DAK
  //  Document Discriminator - DCF
  //  Country/territory of issuance - DCG
}

class VersionFiveFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionFiveFieldMapper())
  }
}