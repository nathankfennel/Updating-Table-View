//
//  RTVDiff.swift
//  Auto Updating Table View
//
//  Created by Nathan Fennel on 8/25/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

class RTVDiff {
    // Returns the index paths of the rows that have changed
    // Returns Nil if the number of sections has changed or the number of rows in any section has changed
    static func updatedIndexPaths(before: RTVModel, after: RTVModel) -> [IndexPath]? {
        guard before.sections.count == after.sections.count else {
            return nil
        }
        
        var indexPaths = [IndexPath]()
        
        for sectionNumber in 0..<before.sections.count {
            let beforeSection = before.sections[sectionNumber]
            let afterSection = after.sections[sectionNumber]
            
            guard beforeSection.numberOfRows == afterSection.numberOfRows else {
                return nil
            }
            
            for rowNumber in 0..<beforeSection.numberOfRows {
                guard let beforeRowModel = beforeSection.model(at: rowNumber),
                    let afterRowModel = afterSection.model(at: rowNumber) else {
                        continue
                }
                
                if afterRowModel.requiresUpdate(from: beforeRowModel) {
                    let indexPath = IndexPath(row: rowNumber,
                                              section: sectionNumber)
                    indexPaths.append(indexPath)
                }
            }
        }
        
        return indexPaths
    }
}
