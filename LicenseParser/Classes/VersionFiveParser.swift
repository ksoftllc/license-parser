//
//  VersionFiveParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/15/16.
//
//

import Foundation

class VersionFiveFieldMapper: FieldMapper{
}

class VersionFiveFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionFiveFieldMapper())
  }
}