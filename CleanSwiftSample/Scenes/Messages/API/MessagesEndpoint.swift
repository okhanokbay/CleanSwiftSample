//
//  MessagesEndpoint.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import Foundation
import Moya

struct MessagesEndpoint: TargetType {
  let baseURL: URL = URL(string: "https://jsonblob.com/api/")!
  let path: String = "jsonBlob/62455171-0fb1-11eb-9f83-ffcd873e5c3a"
  let method: Moya.Method = .get
  let sampleData: Data = Data()
  let task: Task = .requestPlain
  let headers: [String : String]? = nil
}
