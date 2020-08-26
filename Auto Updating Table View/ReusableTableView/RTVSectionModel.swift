//
//  RTVSectionModel.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

protocol RTVSectionModel {
    var rows: [RTVRowModel] { get }
    var header: RTVSectionHeaderFooterModel? { get }
    var footer: RTVSectionHeaderFooterModel? { get }
    
    func model(at row: Int) -> RTVRowModel?
}

struct RTVSectionModelImplementation: RTVSectionModel {
    let rows: [RTVRowModel]
    let header: RTVSectionHeaderFooterModel?
    let footer: RTVSectionHeaderFooterModel?
    
    init(_ rowModels: [RTVRowModel],
         header: RTVSectionHeaderFooterModel? = nil,
         footer: RTVSectionHeaderFooterModel? = nil) {
        rows = rowModels
        self.header = header
        self.footer = footer
    }
    
    func model(at row: Int) -> RTVRowModel? {
        guard row >= 0,
            row < rows.count else {
            assertionFailure("row \(row) is out of bounds of array \"\n\(rows)\n\"")
            return nil
        }
        return rows[row]
    }
}

extension RTVSectionModel {
    var numberOfRows: Int {
        rows.count
    }
}
