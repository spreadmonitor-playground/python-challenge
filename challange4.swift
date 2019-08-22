#!/usr/bin/env swift
import Foundation

let semaphore = DispatchSemaphore(value: 0)
let regex = try! NSRegularExpression(pattern: "[0-9]+$")
var currentId = 12345

for i in 1...252 {
  let url = URL(string: "http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=\(currentId)")!

  let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
  guard let data = data else { return }
  let bodyText = String(data: data, encoding: .utf8)!

  let result = regex.matches(in: bodyText, range: NSRange(bodyText.startIndex..., in: bodyText))
    .map { String(bodyText[Range($0.range, in: bodyText)!]) }
    .joined()

    print("Iteration \(i), found: \(result) Full response: \(bodyText)")

    if(result == "") {
      currentId = 16044 / 2
    } else {
      currentId = Int(result)!
    }

    semaphore.signal()
  }

  task.resume()

  semaphore.wait()
}

dispatchMain()
