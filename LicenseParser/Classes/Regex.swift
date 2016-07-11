//
//  Regex.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 7/11/16.
//
//

import Foundation

class Regex{
  func firstMatch(pattern: String, data: String) -> String?{
    do{
      let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
      let matches = regex.matchesInString(data, options: [], range: NSMakeRange(0, data.utf16.count)) as [NSTextCheckingResult]

      guard matches.count > 0 else { return nil }
      guard let firstMatch = matches.first else { return nil }
      guard firstMatch.numberOfRanges > 1 else { return nil }
      let matchedGroup = (data as NSString).substringWithRange(firstMatch.rangeAtIndex(1))
      guard !matchedGroup.isEmpty else { return nil }
      return matchedGroup.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    } catch _ {
      return nil
    }
  }
}