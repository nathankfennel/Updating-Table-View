//
//  RTVSingleSelectionCell.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVSingleSelectionModel: RTVRowModel {
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool {
        guard let oldValue = oldValue as? RTVSingleSelectionModel else {
            return true
        }
        return oldValue.title != title ||
            oldValue.isSelected != isSelected
    }
    
    let type: UITableViewCell.Type = RTVSingleSelectionCell.self
    var didSelectBlock: RTVSelectionBlock? = nil
    
    let title: String
    let isSelected: Bool
}

private class RTVSingleSelectionCell: UITableViewCell, RTVCell {
    func configure(with model: RTVRowModel) {
        guard let model = model as? RTVSingleSelectionModel else {
            assertionFailure("Unexpected model type!")
            return
        }
        
        textLabel?.text = model.title
        accessoryType = model.isSelected ? .checkmark : .none
    }
}
