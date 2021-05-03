//
//  RomanNumber.swift
//
//  Created by Samrez Ikram on 03/05/2021.
//

import UIKit
class RomanNumber {
    
    let MAX_VALUE = 3000
    let minValue = 0
    
    var number: Int {
        didSet {
            if (number > MAX_VALUE) {
                number = MAX_VALUE
            }
        }
    }
    //--------------------------
    
    init(value: Int) {
        self.number = value
    }
    //--------------------------
    
    func convert() -> String {
        var result = ""
        let thousands = number / 1000
        result += times(thousands, character: "M")
        let hundreds = number / 100 % 10
        result += times(hundreds, o: "C", f: "D", t: "M")
        let tens = number / 10 % 10
        result += times(tens, o: "X", f: "L", t: "C")
        let ones = number % 10
        result += times(ones, o: "I", f: "V", t: "X")
        return result
    }
    //--------------------------

    private func times(_ value: Int, character: String) -> String {
        var result = ""
        for _ in(0..<value){
            result += character
        }
        return result
    }
    //--------------------------
    
    private func times(_ value: Int, o: String, f: String, t: String) -> String {
        guard value < 10 else {
            print("Only single digits allowed - not " + String(value))
            return ""
        }
        switch value {
        case 1...3: return times(value, character: o);
        case 4: return o + f
        case 5...8: return f + times((value - 5), character: o)
        case 9: return o + t
        default : break
        }
        return ""
    }
    //--------------------------
}
