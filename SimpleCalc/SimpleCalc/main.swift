//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if (args[args.count - 1] == "count") {
            return args.count - 1;
        } else if (args[args.count - 1] == "fact") {
            if (Int(args[args.count - 1]) == 0) {
                return 1;
            } else if ((args.count == 1 && args[0] == "fact")) {
                return 0;
            } else {
                var number: UInt = UInt(args[0])!;
                var factorial: UInt = 1;
                for _ in (1...number).reversed() {
                    factorial *= number;
                    number = number - 1;
                }
                return Int(factorial);
            }

        } else if (args[args.count - 1] == "avg") {
            if (args.count == 1) {
                return 0;
            }
            var sum: Int = 0;
            for index in 0...args.count - 2 {
                sum += Int(args[index])!;
            }
            return sum / (args.count - 1);
        } else {
            let num1: Int! = Int(args[0]);
            let num2: Int! = Int(args[2]);
            if (args[1] == "+") {
                return num1 + num2
            } else if (args[1] == "-") {
                return num1 - num2
            } else if (args[1] == "/") {
                return num1 / num2
            } else if (args[1] == "*") {
                return num1 * num2
            } else if (args[1] == "%") {
                return num1 % num2
            } else {
                return 10;
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))
