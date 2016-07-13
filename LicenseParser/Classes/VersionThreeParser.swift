//
//  VersionThreeParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//
//

import Foundation

class VersionThreeFieldMapper: FieldMapper{
  override init(){
    super.init()
    self.fields["firstName"] = "DCT"
  }
}

class VersionThreeFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionThreeFieldMapper())
  }

  override func getDateFormat() -> String {
    return "yyyyMMdd"
  }
}
