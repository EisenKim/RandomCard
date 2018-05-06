//
//  StringExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    //    func substring(_ from: Int) -> String {
    //        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    //    }
    
    var noComma: Int {
        if self.count == 0 {
            return 0
        }
        let decimalFormatter = DecimalFormatter()
        guard let i = decimalFormatter.number(from: self) else {
            preconditionFailure("숫자관련 메소드 호출 실패!")
        }
        return Int(truncating: i)
    }
    
    var length: Int {
        #if swift(>=4.0)
            return self.count
        #else
            return self.character.count
        #endif
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(_ from: Int) -> String {
        let fromIndex = index(from: from)
        #if swift(>=4.0)
            return String(self[fromIndex...])
        #else
            return substring(from: fromIndex)
        #endif
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        #if swift(>=4.0)
            return String(self[..<toIndex])
        #else
            return substring(to: toIndex)
        #endif
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        
        #if swift(>=4.0)
            return String(self[startIndex..<endIndex])
        #else
            return substring(with: startIndex..<endIndex)
        #endif
    }
    
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }

}
