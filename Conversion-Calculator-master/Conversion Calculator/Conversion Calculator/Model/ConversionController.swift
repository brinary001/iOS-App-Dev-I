//
//  ConversionController.swift
//  Conversion Calculator
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

class ConverterController {
    func converterChoice(_ choice: Int, _ value: String) -> Conversion {
        switch choice{
        case 1:
            return fahrenheitToCelecius(Float(value)!)
        case 2:
            return celciusToFahrenheit(Float(value)!)
        case 3:
            return milesToKilometers(Float(value)!)
        case 4:
            return kilometersToMiles(Float(value)!)
        default:
            let convert = Conversion(
                value: "",
                newValue: ""
            )
            return convert
        }
    }

    func updateValue(_ choice: Int) -> UpdateValue {
        switch choice {
        case 1:
            let updatedValue = UpdateValue(initialValue: "  °F", computedValue: "  °C")
            return updatedValue
        case 2:
            let updatedValue = UpdateValue(initialValue: "  °C", computedValue: "  °F")
            return updatedValue
        case 3:
            let updatedValue = UpdateValue(initialValue: "  mi", computedValue: "  km")
            return updatedValue
        case 4:
            let updatedValue = UpdateValue(initialValue: "  km", computedValue: "  mi")
            return updatedValue
        default:
            let updatedValue = UpdateValue(initialValue: "  °F", computedValue: "  °C")
            return updatedValue
        }
    }
    func fahrenheitToCelecius(_ fah: Float) -> Conversion {
        let convert = Conversion(
            value: String(fah),
            newValue: String((Float(fah) - 32) / 1.8)
        )
        return  convert
    }
    func celciusToFahrenheit(_ cel: Float) -> Conversion {
        let convert = Conversion (
            value: String(cel),
            newValue:String((1.8 * Float(cel) + 32.0))
        )
        return convert
    }
    func milesToKilometers(_ miles: Float) -> Conversion {
        let convert = Conversion(
            value: String(miles),
            newValue: String(Float(miles)/0.62137)
        )
        return convert
    }
    func kilometersToMiles(_ kilometers: Float) -> Conversion {
        let convert = Conversion(
            value: String(kilometers),
            newValue:String(Float(kilometers) * 0.62137)
        )
        return convert
    }
}
