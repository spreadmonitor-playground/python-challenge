#!/usr/bin/env swift
import Darwin
import Foundation
import AppKit

extension NSImage {

  func pixelData() -> [Pixel] {
        let bmp = self.representations[0] as! NSBitmapImageRep
        var data: UnsafeMutablePointer<UInt8> = bmp.bitmapData!
        var r, g, b, a: UInt8
        var pixels: [Pixel] = []

        for y in 0..<bmp.pixelsHigh {
            for x in 0..<bmp.pixelsWide {
                r = data.pointee
                data = data.advanced(by: 1)
                g = data.pointee
                data = data.advanced(by: 1)
                b = data.pointee
                data = data.advanced(by: 1)
                a = data.pointee
                pixels.append(Pixel(r: r, g: g, b: b, a: a, y: y, x: x))
            }
        }

      return pixels
   }

   func getPixelAt(x: Int, y: Int) -> NSColor {
    let bmp = self.representations[0] as! NSBitmapImageRep

    return bmp.colorAt(x: x, y: y)!
   }

}

struct Pixel {

   var r: Float
   var g: Float
   var b: Float
   var a: Float
   var y: Int
   var x: Int

   init(r: UInt8, g: UInt8, b: UInt8, a: UInt8, y: Int, x: Int) {
      self.r = Float(r)
      self.g = Float(g)
      self.b = Float(b)
      self.a = Float(a)
      self.y = y
      self.x = x
   }

   var color: NSColor {
      return NSColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a/255.0))
   }

   var description: String {
      return "RGBA(\(r), \(g), \(b), \(a))"
   }

}

let downloadsDir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first
let fileURL = downloadsDir!.appendingPathComponent("oxygen.png")
let image = NSImage(contentsOfFile: fileURL.path)
var textFromGrey = ""

// print(image!.pixelData())

// 7px wide, full image 629 so 629 / 7 = 86
for i in 0...86 {
  let result = image!.getPixelAt(x: i * 7 + 1, y: 50);
  // print("\(Int(result.redComponent * 255)) \(Int(result.greenComponent * 255)) \(Int(result.blueComponent * 255))")

  textFromGrey += String(UnicodeScalar(Int(result.redComponent * 255))!)
}

print(textFromGrey)
// result: smart guy, you made it. the next level is [105, 110, 116, 101, 103, 114, 105, 116, 121]

let nextLevel = [105, 110, 116, 101, 103, 114, 105, 116, 121]
  .map { String(UnicodeScalar($0)!) }
  .joined()

print(nextLevel)