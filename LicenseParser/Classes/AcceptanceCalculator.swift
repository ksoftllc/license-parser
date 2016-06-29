//
//  AcceptanceCalculator.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/29/16.
//
//

import Foundation

protocol AcceptanceCalculating{
  var license: ParsedLicense { get set }
  func calculate() -> Bool
}

class AcceptanceCalculator: AcceptanceCalculating{
  var license: ParsedLicense

  init(license: ParsedLicense){
    self.license = license
  }

  func calculate() -> Bool{
    return false
  }
}