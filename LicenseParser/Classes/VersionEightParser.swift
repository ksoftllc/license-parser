//
//  VersionEightFieldParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/10/16.
//
//

import Foundation

class VersionEightFieldMapper: FieldMapper{
}

class VersionEightFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionEightFieldMapper())
  }
}
