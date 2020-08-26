//
//  RTVParameters.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVParameters {
    var frame: CGRect // default is .zero
    let style: UITableView.Style // default is .plain
    
    let backgroundColor: UIColor? // default is nil
    
    let allowsSelection: Bool // default is true
    let allowsSelectionDuringEditing: Bool // default is true
    let allowsMultipleSelection: Bool // default is false
    let allowsMultipleSelectionDuringEditing: Bool // default is false
    
    let sectionIndexMinimumDisplayRowCount: Int // default is 0
    let sectionIndexColor: UIColor? // default is nil
    let sectionIndexBackgroundColor: UIColor? // default is nil
    let sectionIndexTrackingBackgroundColor: UIColor? // default is nil
    let separatorStyle: UITableViewCell.SeparatorStyle // default is .singleLine
    let separatorColor: UIColor // default is .separator
    let separatorEffect: UIVisualEffect? // default is nil
    let cellLayoutMarginsFollowReadableWidth: Bool // default is false
    let insetsContentViewsToSafeArea: Bool // default is true
    
    init(frame: CGRect = .zero,
         style: UITableView.Style = .plain,
         backgroundColor: UIColor? = nil,
         allowsSelection: Bool = true,
         allowsSelectionDuringEditing: Bool = true,
         allowsMultipleSelection: Bool = false,
         allowsMultipleSelectionDuringEditing: Bool = false,
         sectionIndexMinimumDisplayRowCount: Int = 0,
         sectionIndexColor: UIColor? = nil,
         sectionIndexBackgroundColor: UIColor? = nil,
         sectionIndexTrackingBackgroundColor: UIColor? = nil,
         separatorStyle: UITableViewCell.SeparatorStyle = .singleLine,
         separatorColor: UIColor = .separator,
         separatorEffect: UIVisualEffect? = nil,
         cellLayoutMarginsFollowReadableWidth: Bool = false,
         insetsContentViewsToSafeArea: Bool = true) {
        self.frame = frame
        self.style = style
        self.backgroundColor = backgroundColor
        self.allowsSelection = allowsSelection
        self.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        self.allowsMultipleSelection = allowsMultipleSelection
        self.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        self.sectionIndexMinimumDisplayRowCount = sectionIndexMinimumDisplayRowCount
        self.sectionIndexColor = sectionIndexColor
        self.sectionIndexBackgroundColor = sectionIndexBackgroundColor
        self.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        self.separatorStyle = separatorStyle
        self.separatorColor = separatorColor
        self.separatorEffect = separatorEffect
        self.cellLayoutMarginsFollowReadableWidth = cellLayoutMarginsFollowReadableWidth
        self.insetsContentViewsToSafeArea = insetsContentViewsToSafeArea
    }
}
