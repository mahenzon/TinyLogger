//
//  Logger.swift
//  TinyLogger
//
//  Created by Suren Khorenyan on 05.10.17.
//  Copyright © 2017 Suren Khorenyan. All rights reserved.
//

import Foundation

class Logger {

    static let shared = Logger()
    
    var loggingLevel = 30
    
    enum LogType: Int {
        case verbose = 0
        case debug = 10
        case info = 20
        case warning = 30
        case error = 40
        case severe = 50
    }

    private func sourceFileName(_ filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    private func log(line: String, level: LogType) {
        #if DEBUG
            if level.rawValue >= loggingLevel { print(line) }
        #endif
    }
    
    private func formatLine(message: String, event: LogType, fileName: String, line: Int, column: Int, funcName: String) -> String {
        let eventEmoji: String
        switch event {
            case .verbose: eventEmoji = "🔎"
            case .debug: eventEmoji = "🐞"
            case .info: eventEmoji = "📝"
            case .warning: eventEmoji = "⚠️"
            case .error: eventEmoji = "📛"
            case .severe: eventEmoji = "‼️"
        }
        return "\(Date().formatted) [\(eventEmoji)] [\(sourceFileName(fileName))]:\(line) \(column) \(funcName) ➡️ \(message)"
    }
    
    func verbose(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .verbose, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .verbose)
    }
    
    func debug(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .debug, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .debug)
    }
    
    func info(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .info, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .info)
    }
    
    func warning(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .warning, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .warning)
    }
    
    func error(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .error, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .error)
    }
    
    func severe(message: String, fileName: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        self.log(line: formatLine(message: message, event: .severe, fileName: fileName, line: line, column: column, funcName: funcName),
                 level: .severe)
    }


}

