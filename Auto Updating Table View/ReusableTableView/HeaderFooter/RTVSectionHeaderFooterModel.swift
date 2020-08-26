//
//  RTVSectionHeaderFooterModel.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import Foundation

protocol RTVSectionHeaderFooterModel {
    var type: AnyClass { get }
    var identifier: String { get }
    var isSelectable: Bool { get }
}

extension RTVSectionHeaderFooterModel {
    var identifier: String { "\(type)" }
    var isSelectable: Bool { false }
}
