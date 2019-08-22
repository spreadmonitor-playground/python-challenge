#!/usr/bin/env swift
import Darwin

let encrypted: String = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."
var message = "";

for i in 0..<encrypted.count {
  let index = encrypted.index(encrypted.startIndex, offsetBy: i)
  let asciValue = encrypted[index].unicodeScalars.filter{ (char: UnicodeScalar) -> Bool in char.isASCII}.first?.value
  let newCharacter = Character(UnicodeScalar(asciValue! + 2)!)

  if Int(asciValue!) > 96 && Int(asciValue!) <= 120 {
    message += [newCharacter]
  } else if Int(asciValue!) == 121 {
    message += [Character(UnicodeScalar(97)!)]
  } else if Int(asciValue!) == 122 {
    message += [Character(UnicodeScalar(98)!)]
  } else {
    message += [encrypted[index]]
  }
}

print(message)