//
//  DateToStringFormatting.swift
//  TinyLogger
//
//  Created by Suren Khorenyan on 07.10.17.
//  Copyright © 2017 Suren Khorenyan. All rights reserved.
//

import Foundation

extension Date {
    var formatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm:ssSSS"
        return dateFormatter.string(from: self)
    }
}
