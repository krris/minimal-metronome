//
//  NSObject.swift
//  Metronome
//
//  Created by krris on 05/03/2017.
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import Foundation

extension NSObject {
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
