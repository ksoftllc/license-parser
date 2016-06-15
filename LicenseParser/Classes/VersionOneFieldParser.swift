//
//  VersionOneFieldParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/10/16.
//
//

import Foundation

public class VersionOneFieldMapper: FieldMapper{
  override init(){
    super.init()

    self.fields["customerId"] = "DBJ"
    self.fields["lastName"]   = "DAB"
  }
}

class VersionOneFieldParser: FieldParser{
  convenience init(data: String){
    self.init(data: data, fieldMapper: VersionOneFieldMapper())
  }

  override func getDateFormat() -> String {
    return "yyyyMMdd"
  }

  // Parse something like 508 (5'8") into 68"
  override func parseHeight() -> Double? {
    guard let heightInFeetAndInches = parseString("height") else { return nil }

    guard let regex        = "([0-9]{1})([0-9]{2})".r else { return nil }
    guard let match        = regex.findFirst(heightInFeetAndInches) else { return nil }
    guard let height       = match.group(1) else { return nil }
    guard let inches       = match.group(2) else { return nil }
    guard !height.isEmpty else { return nil }
    guard !inches.isEmpty else { return nil }

    return (Double(height)! * 12) + Double(inches)!
  }
}