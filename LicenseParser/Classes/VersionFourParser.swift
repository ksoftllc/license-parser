//
//  VersionFourParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/15/16.
//
//

import Foundation

class VersionFourFieldMapper: FieldMapper{
}

class VersionFourFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionFourFieldMapper())
  }
}
