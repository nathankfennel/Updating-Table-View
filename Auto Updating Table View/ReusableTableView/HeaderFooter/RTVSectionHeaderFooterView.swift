//
//  RTVSectionHeaderFooterView.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

protocol RTVSectionHeaderFooterView: UITableViewHeaderFooterView {
    func configure(with model: RTVSectionHeaderFooterModel)
}
