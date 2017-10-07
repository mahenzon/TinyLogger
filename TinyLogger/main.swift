//
//  main.swift
//  TinyLogger
//
//  Created by Suren Khorenyan on 05.10.17.
//  Copyright © 2017 Suren Khorenyan. All rights reserved.
//

import Foundation

print("Hello, World! I'll show you how to log with the Tiny Logger")

let logging = Logger.shared  // default logging level is 30

func doSomething() {}
func doSomethingElse() {}

func demoLog() {

    // something totally not important to log.
    // logging just to be sure everything goes as expected
    // useful to log every step at complex functions
    let someCondition = true
    if someCondition {
        logging.verbose(message: "IF condition met")
        doSomething()
    } else {
        logging.verbose(message: "IF condidtion failed")
        doSomethingElse()
    }
    
    // something not important to log.
    // logging only for debug purposes
    // useful to log every almost step at some complex functions
    var someOptional: Int?
    if let nonOptional = someOptional {
        logging.debug(message: "Optional unwrapped, doing something")
        doSomething()
    } else {
        logging.debug(message: "Met optional, doning something else")
        doSomethingElse()
    }

    // logging for informational purposes
    // useful to log succsessful executions of functions
    let anotherCondition = false
    if anotherCondition {
        logging.info(message: "If condition met")
        doSomething()
    } else {
        logging.info(message: "If condition failed")
        doSomethingElse()
    }
    
    // logging for important informational purposes
    // useful to log unexpected behaviour that doesn't affect very much
    let awaitingState = false
    if awaitingState {} else {
        logging.warning(message: "Was't expecting this coming!")
    }
    
    // logging important states that can cause errors in our code
    let responseCode = 666
    switch responseCode {
    case 100...199:
        doSomething()
    case 200...299:
        doSomethingElse()
    case 300...399:
        doSomething()
    case 400...499:
        doSomethingElse()
    case 500...599:
        doSomething()
    default:
        logging.error(message: "Response code in unexpected range!")
    }
    
    // logging very important issues
    var anotherOptional: Double?
    guard let anotherNonOptional = anotherOptional else {
        logging.severe(message: "Guard state not met!")
        return
    }
}

print("\nExecuting with logging level 30. Warning and higher messages are printed")
demoLog()

print("\nExecuting with logging level 0. All messages are printed")
logging.loggingLevel = 0
demoLog()

print("\nExecuting with logging level 40. All error and severe messages are printed")
logging.loggingLevel = 40
demoLog()
