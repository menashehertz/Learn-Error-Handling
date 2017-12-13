//
//  main.swift
//  Learn Error Handling
//
//  Created by Steven Hertz on 12/12/17.
//  Copyright © 2017 Steven Hertz. All rights reserved.
//

import Foundation

// create an instance of drink dispenser
var drinkDispenser = DrinkDispenser(amountOfOz: 6)

func getADrink() -> Void {
    
    defer {
        // refill at the end
        drinkDispenser.amountOfOz = 10
    }

    /*
     Defined a throwing function and we are capturing the error and unwraping the enum
    */
    
    // get a drink
    do {
        let x = try drinkDispenser.getADrink(howManyOz: 4)
        print(x)
    } catch DrinkDispenser.DrinkErrors.notEnoughLeft(let x) {
        print("not enough left \(x)")
    } catch {
        print("General Error \(error.localizedDescription)")
    }
    
    // get a drink
    do {
        _ = try drinkDispenser.getADrink(howManyOz: 4)
    } catch let DrinkDispenser.DrinkErrors.notEnoughLeft(z) {
        print("not enough left \(z)")
    } catch {
        print("General Error \(error.localizedDescription)")
    }
    
}

getADrink()
print(drinkDispenser.amountOfOz)

