//
//  DataManager.swift
//  WTest
//
//  Created by Raphael Alkamim on 24/09/22.
//

import Foundation
import UIKit

class DataManager {
    public static var shared = DataManager()
    let baseURL: String = "https://raw.githubusercontent.com/centraldedados/"
    
    func loadCSV(url: String) async throws -> [PostalCodeCSV] {
        var data = ""
        if let fileURL = URL(string: self.baseURL + url) {
            data = try String(contentsOf: fileURL)
        }
        return getData(data)
    }
    
    fileprivate func getData(_ data: String) -> [PostalCodeCSV] {
        var csvStruct = [PostalCodeCSV]()
        var rows = data.components(separatedBy: "\n")
        let columnCount = rows.first?.components(separatedBy: ",").count
        rows.removeFirst()
        
        for row in rows {
            let csvColumns = row.components(separatedBy: ",")
            if csvColumns.count == columnCount {
                let postalCodeStruct = PostalCodeCSV.init(raw: csvColumns)
                csvStruct.append(postalCodeStruct)
            }
        }
        return csvStruct
    }
}
