//
//  Date+Extension.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

extension Date {
    func changeDays(by days: Int) -> Date {
        let date = Calendar.current.date(byAdding: .day, value: days, to: self)
        return date ?? self
    }
    func readable(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
