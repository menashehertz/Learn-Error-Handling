//
//  DrinkDispenser.swift
//  Learn Error Handling
//
//  Created by Steven Hertz on 12/12/17.
//  Copyright © 2017 Steven Hertz. All rights reserved.
//

import Foundation

struct DrinkDispenser {
    
    // nested type
    enum DrinkErrors: Error {
        case notEnoughLeft(amountLeft: Int)
    }
    
    var amountOfOz: Int
    
    mutating func getADrink(howManyOz numOfOz: Int) throws -> String {
        // if not enough left throw an error
        guard amountOfOz > numOfOz else {
            throw DrinkErrors.notEnoughLeft(amountLeft: amountOfOz)
        }
        // adjust the amount left
        amountOfOz -= numOfOz
        // return the text
        return "Here is your drink, \(amountOfOz) oz left"
    }
}

