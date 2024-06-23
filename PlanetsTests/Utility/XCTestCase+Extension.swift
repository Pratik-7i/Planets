//
//  XCTestCase+Extension.swift
//  Planets
//
//  Created by Pratik on 23/06/24.
//

import XCTest

extension XCTestCase {
    enum TestCaseError: Error {
        case fileNotFound
    }
    func loadJSON(fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName)")
            throw TestCaseError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
