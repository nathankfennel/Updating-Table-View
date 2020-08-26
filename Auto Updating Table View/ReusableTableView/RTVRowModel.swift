//
//  RTVCellModel.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

protocol RTVRowModel {
    var type: UITableViewCell.Type { get }
    var cellIdentifier: String { get }
    var isSelectable: Bool { get }
    
    typealias RTVSelectionBlock = ()->()
    var didSelectBlock: RTVSelectionBlock? { get }
    
    // This should probably be named something different
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool
}

struct RTVRowModelImplementation: RTVRowModel {
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool {
        return oldValue.isSelectable != self.isSelectable
    }
    
    var type: UITableViewCell.Type { UITableViewCell.self }
    var didSelectBlock: RTVSelectionBlock? = nil
}

extension RTVRowModel {
    var cellIdentifier: String { "\(type)"}
    var isSelectable: Bool { true }
}
