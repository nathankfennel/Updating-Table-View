//
//  RTVTextDetailTextCell.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVTextDetailTextModel: RTVRowModel {
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool {
        guard let oldValue = oldValue as? RTVTextDetailTextModel else {
            return true
        }
        return oldValue.text != text ||
            oldValue.detailText != detailText
    }
    
    let type: UITableViewCell.Type = RTVTextDetailTextCell.self
    var didSelectBlock: RTVSelectionBlock? = nil
    
    let text: String
    let detailText: String
}

private class RTVTextDetailTextCell: UITableViewCell, RTVCell {
    lazy var primaryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .mediumBoldAccessibilityFont
        label.numberOfLines = 0
        contentView.addSubview(label)
        label.setTopEdgeEqualToSuperView(constant: 1)
        label.setLeadingEdgeEqualToSuperView(constant: 1)
        label.setTrailingEdgeEqualToSuperView(constant: 1)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .mediumAccessibilityFont
        label.numberOfLines = 0
        contentView.addSubview(label)
        label.set(.top,
                  equalTo: .bottom,
                  of: primaryLabel,
                  constant: 1)
        label.setLeadingEdgeEqualToSuperView(constant: 1)
        label.setTrailingEdgeEqualToSuperView(constant: 1)
        label.setBottomEdgeEqualToSuperView(constant: 1)
        return label
    }()
    
    func configure(with model: RTVRowModel) {
        guard let model = model as? RTVTextDetailTextModel else {
            assertionFailure("Expecting model of type \"RTVTextDetailTextModel\"")
            return
        }
        
        primaryLabel.text = model.text
        detailLabel.text = model.detailText
    }
}
