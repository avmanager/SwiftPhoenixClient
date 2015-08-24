//
//  Path.swift
//  SwiftPhoenix
//
//  Created by Kyle Oba on 8/23/15.
//  Copyright (c) 2015 David Stump. All rights reserved.
//

import Foundation

struct Path {
  
  static func removeTrailingSlash(path:String) -> String {
    if count(path) == 0 { return path }
    if path.substringWithRange(Range<String.Index>(start: advance(path.endIndex, -1), end: path.endIndex)) == "/" {
      return path.substringWithRange(Range<String.Index>(start:path.startIndex, end: advance(path.endIndex, -1)))
    }
    return path
  }
  
  static func removeLeadingSlash(path:String) -> String {
    if count(path) == 0 { return path }
    if path.substringWithRange(Range<String.Index>(start: path.startIndex, end: advance(path.startIndex, 1))) == "/" {
      return path.substringWithRange(Range<String.Index>(start:advance(path.startIndex, 1), end: path.endIndex))
    }
    return path
  }
  
  static func removeLeadingAndTrailingSlashes(path:String) -> String {
    return Path.removeTrailingSlash( Path.removeLeadingSlash(path) )
  }
  
  static func endpointWithProtocol(prot:String, domainAndPort:String, path:String, transport:String) -> String {
    var theProt = ""
    switch prot {
    case "ws":
      theProt = "http"
    case "wss":
      theProt = "https"
    default:
      theProt = prot
    }
    
    var theDomAndPort = removeLeadingAndTrailingSlashes(domainAndPort)
    var thePath = removeLeadingAndTrailingSlashes(path)
    var theTransport = removeLeadingAndTrailingSlashes(transport)
    return "\(theProt)://\(theDomAndPort)/\(thePath)/\(theTransport)"
  }
}