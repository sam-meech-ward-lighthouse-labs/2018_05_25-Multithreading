//
//  main.swift
//  Coconuts
//
//  Created by Sam Meech-Ward on 2018-05-25.
//  Copyright © 2018 meech-ward. All rights reserved.
//

import Foundation

print("Hello, World!")

let coconut = Coconut()
print("water 1: \(coconut.water)")

//bgQueue.async {
//  for _ in 0..<100000 {
//    coconut.water += 1
//  }
//
//  DispatchQueue.main.async {
//    print("water 3: \(coconut.water)")
//  }
//}
//
//bgQueue.async {
//  for _ in 0..<100000 {
//    coconut.water += 1
//  }
//
//  DispatchQueue.main.async {
//    print("water 4: \(coconut.water)")
//  }
//}
//
//print("water 2: \(coconut.water)")
//print("Hi again")


var group = DispatchGroup()

for i in 0...10000 {
  group.enter()
  DispatchQueue.global(qos: .utility).async {
    coconut.favouriteQuote = "Lime in the coconut \(i)"
    group.leave()
  }
}

group.notify(queue: DispatchQueue.main) {
  print("complete: \(coconut.favouriteQuote)")
}





RunLoop.main.run(until: Date(timeIntervalSinceNow: 100))
