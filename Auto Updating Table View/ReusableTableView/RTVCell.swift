//
//  RTVCell.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

protocol RTVCell: UITableViewCell {
    func configure(with model: RTVRowModel)
}
