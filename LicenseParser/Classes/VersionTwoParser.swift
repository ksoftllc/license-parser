//
//  VersionTwoParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//
//

import Foundation

class VersionTwoFieldMapper: FieldMapper{
  override init(){
    super.init()
    self.fields["firstName"] = "DCT"
  }
}

class VersionTwoFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionTwoFieldMapper())
  }
}
