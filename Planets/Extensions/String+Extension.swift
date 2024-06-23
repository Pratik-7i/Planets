//
//  String+Extension.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import Foundation

extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    var trimmed: String {
        return self.trimmingCharacters(
            in: CharacterSet.whitespacesAndNewlines
        )
    }
}


