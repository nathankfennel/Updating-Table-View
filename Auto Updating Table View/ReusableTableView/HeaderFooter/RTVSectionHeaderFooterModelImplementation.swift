//
//  RTVSectionHeaderFooterModelImplementation.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVSectionHeaderFooterModelImplementation: RTVSectionHeaderFooterModel {
    let type: AnyClass = RTVSectionHeaderFooterViewImplementation.self
    
    let text: String
}

private class RTVSectionHeaderFooterViewImplementation: UITableViewHeaderFooterView, RTVSectionHeaderFooterView {
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .largeBoldAccessibilityFont
        label.adjustsFontSizeToFitWidth = true
        addSubview(label)
        label.setEdgesEqualToSuperview(constant: 8)
        return label
    }()
    func configure(with model: RTVSectionHeaderFooterModel) {
        guard let model = model as? RTVSectionHeaderFooterModelImplementation else {
            assertionFailure("Somehow the wrong type of model made it here!")
            return
        }
        
        label.text = model.text
    }
}

