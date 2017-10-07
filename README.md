## Welcome the Tiny Logger - the easiest way to log in your Swift projects!

### About
Once upon a time when developing a small project I thought *Is there a small logging library that I don't need to install using CocoaPods or Carthage?* — and nothing was there. So I decided to develop my own.

**Inspired by** [this article](https://medium.com/@sauvik_dolui/developing-a-tiny-logger-in-swift-7221751628e6)

---

### DEMO  

```Swift
let logging = Logger.shared
```  
Creating a Singleton for ability to change logging level in the Main  
Default logging level is 30 (warning)  

Demo code:  

```Swift
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

```

**Output is**

```
Executing with logging level 30. Warning and higher messages are printed
07.10.2017 11:59:56065 [⚠️] [main.swift]:59 24 demoLog() ➡️ Was't expecting this coming!
07.10.2017 11:59:56065 [📛] [main.swift]:76 22 demoLog() ➡️ Response code in unexpected range!
07.10.2017 11:59:56065 [‼️] [main.swift]:82 23 demoLog() ➡️ Guard state not met!

Executing with logging level 0. All messages are printed
07.10.2017 11:59:56066 [🔎] [main.swift]:25 24 demoLog() ➡️ IF condition met
07.10.2017 11:59:56066 [🐞] [main.swift]:40 22 demoLog() ➡️ Met optional, doning something else
07.10.2017 11:59:56066 [📝] [main.swift]:51 21 demoLog() ➡️ If condition failed
07.10.2017 11:59:56066 [⚠️] [main.swift]:59 24 demoLog() ➡️ Was't expecting this coming!
07.10.2017 11:59:56067 [📛] [main.swift]:76 22 demoLog() ➡️ Response code in unexpected range!
07.10.2017 11:59:56067 [‼️] [main.swift]:82 23 demoLog() ➡️ Guard state not met!

Executing with logging level 40. All error and severe messages are printed
07.10.2017 11:59:56067 [📛] [main.swift]:76 22 demoLog() ➡️ Response code in unexpected range!
07.10.2017 11:59:56068 [‼️] [main.swift]:82 23 demoLog() ➡️ Guard state not met!
```

---

### USAGE
Just create a `Logger.swift` file in your iOS / macOS project and copy content of the [Logger](https://github.com/surik00/TinyLogger/blob/master/TinyLogger/Model/Logger.swift) there, then copy content of the [Date to String extension](https://github.com/surik00/TinyLogger/blob/master/TinyLogger/Model/DateToStringFormatting.swift) to another file, for example you can create `DateToStringFormatting.swift`  
Of course you can copy everything to a single file, but I prefer to put extensions to a separate file.

**Enjoy!**