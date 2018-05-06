//
//  String+Category.swift
//  mTranskey_Swift_Sample
//
//  Created by RaonSecure on 2017. 2. 14..
//  Copyright © 2017년 RaonSecure. All rights reserved.
//

import Foundation

extension String
{
    func substringWithRange(_ start: Int, end: Int) -> String
    {
        var count : Int = 0
        #if swift(>=4.0)
            count = self.count
        #else
            count = self.characters.count
        #endif
        
        if (start < 0 || start > count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if end < 0 || end > count
        {
            print("end index \(end) out of bounds")
            return ""
        }
        #if swift(>=4.0)
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: end)
            return String(self[startIndex..<endIndex])
        #else
            let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: end))
            return self.substring(with: range)
        #endif
        
    }
    
    func substringWithRange(_ start: Int, location: Int) -> String
    {
        var count : Int = 0
        #if swift(>=4.0)
            count = self.count
        #else
            count = self.characters.count
        #endif
        
        if (start < 0 || start > count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if location < 0 || start + location > count
        {
            print("end index \(start + location) out of bounds")
            return ""
        }
        #if swift(>=4.0)
            let startIndex = self.index(self.startIndex, offsetBy: start)
            let endIndex = self.index(self.startIndex, offsetBy: start + location)
            return String(self[startIndex..<endIndex])
        #else
            let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: start + location))
            return self.substring(with: range)
        #endif
    }
}
