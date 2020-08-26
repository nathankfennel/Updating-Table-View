//
//  RTVModel.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

protocol RTVModel {
    var sections: [RTVSectionModel] { get }
    var isEmpty: Bool { get }
    
    func section(_ section: Int) -> RTVSectionModel?
    func model(at indexPath: IndexPath) -> RTVRowModel?
    func headerModel(forSection section: Int) -> RTVSectionHeaderFooterModel?
    func footerModel(forSection section: Int) -> RTVSectionHeaderFooterModel?
}

extension RTVModel {
    var numberOfSections: Int {
        sections.count
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        self.section(section)?.numberOfRows ?? 0
    }
    
    func section(_ section: Int) -> RTVSectionModel? {
        guard section >= 0,
            section < sections.count else {
                assertionFailure("section is outside of bounds of array \"\n\(sections)\n\"")
                return nil
        }
        return sections[section]
    }
    
    var isEmpty: Bool {
        if sections.isEmpty {
            return true
        }
        
        guard let section = section(0) else {
            return true
        }
        
        if section.header != nil || section.footer != nil {
            return false
        }
        
        return section.numberOfRows == 0
    }
}

struct RTVModelImplementation: RTVModel {
    let sections: [RTVSectionModel]

    init(_ sections: [RTVSectionModel]) {
        self.sections = sections
    }
    
    init(_ rows: [RTVRowModel]) {
        sections = [RTVSectionModelImplementation(rows)]
    }
    
    func model(at indexPath: IndexPath) -> RTVRowModel? {
        let section = self.section(indexPath.section)
        return section?.model(at: indexPath.row)
    }
    
    func headerModel(forSection section: Int) -> RTVSectionHeaderFooterModel? {
        let section = self.section(section)
        return section?.header
    }
    
    func footerModel(forSection section: Int) -> RTVSectionHeaderFooterModel? {
        let section = self.section(section)
        return section?.footer
    }    
}
