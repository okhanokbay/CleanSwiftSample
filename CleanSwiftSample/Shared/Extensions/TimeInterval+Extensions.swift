//
//  TimeInterval+Extensions.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 25.10.2020.
//

import Foundation

extension TimeInterval {
  var humanReadableDateTime: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm E, d MMM y"
    return formatter.string(from: Date(timeIntervalSince1970: self))
  }
}
