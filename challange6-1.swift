#!/usr/bin/env swift
import Foundation

let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first
var currentId = "90052"

while currentId != nil {
  let fileURL = dir!.appendingPathComponent("channel/" + currentId + ".txt")

  let file_content = try! String(contentsOf: fileURL, encoding: .utf8)

  print(file_content)

  let regex = try! NSRegularExpression(pattern: "[0-9]*$")
  let rr = NSRange(location: 0, length: file_content.count)

  currentId = regex.matches(in: file_content, range: rr)
      .map { String(file_content[Range($0.range, in: file_content)!]) }
      .joined()
}
