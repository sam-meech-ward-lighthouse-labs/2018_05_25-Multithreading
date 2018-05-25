//
//  Coconut.swift
//  Coconuts
//
//  Created by Sam Meech-Ward on 2018-05-25.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation

class Coconut {
  
  private var _water = 0
  var water: Int {
    get {
      var waterValue = 0
      waterQueue.sync {
        waterValue = self._water
      }
      return waterValue
    }
    set {
      waterQueue.async {
        self._water = newValue
      }
    }
  }
  
  var setTimes = 0
  var favouriteQuote: String {
    get {
      var tmp = ""
      waterQueue.sync {
        tmp = self._favouriteQuote
      }
      return tmp
    }
    set {
      waterQueue.async(flags: .barrier) {
        self._favouriteQuote = newValue
        self.setTimes += 1
      }
    }
  }
  private var _favouriteQuote = ""
  
  var waterQueue = DispatchQueue(label: "com.lhl.waterQueue", qos: .default, attributes: [.concurrent])
  
}
