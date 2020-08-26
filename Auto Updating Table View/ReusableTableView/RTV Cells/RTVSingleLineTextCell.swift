//
//  RTVSingleLineTextCell.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVSingleLineTextModel: RTVRowModel {
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool {
        guard let oldValue = oldValue as? RTVSingleLineTextModel else {
            return true
        }
        return oldValue.text != text
    }
    
    let type: UITableViewCell.Type = RTVSingleLineTextCell.self
    var didSelectBlock: RTVSelectionBlock? = nil

    let text: String
}

private class RTVSingleLineTextCell: UITableViewCell, RTVCell {
    func configure(with model: RTVRowModel) {
        guard let model = model as? RTVSingleLineTextModel else {
            assertionFailure("Expecting model of type \"RTVSingleLineTextModel\"")
            return
        }
        
        backgroundColor = .random
        
        textLabel?.text = model.text
        detailTextLabel?.text = model.text
    }
}
