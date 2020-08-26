//
//  UIFont+Extensions.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

extension UIFont {
    static var smallAccessibilityFontSize: CGFloat {
        UIFont.preferredFont(forTextStyle: .footnote).pointSize
    }
    static var smallAccessibilityFont: UIFont {
        UIFont.systemFont(ofSize: smallAccessibilityFontSize)
    }
    static var smallBoldAccessibilityFont: UIFont {
        UIFont.boldSystemFont(ofSize: smallAccessibilityFontSize)
    }
    
    static var mediumAccessibilityFontSize: CGFloat {
        UIFont.preferredFont(forTextStyle: .caption2).pointSize
    }
    static var mediumAccessibilityFont: UIFont {
        UIFont.systemFont(ofSize: mediumAccessibilityFontSize)
    }
    static var mediumBoldAccessibilityFont: UIFont {
        UIFont.boldSystemFont(ofSize: mediumAccessibilityFontSize)
    }
    
    static var largeAccessibilityFontSize: CGFloat {
        UIFont.preferredFont(forTextStyle: .headline).pointSize
    }
    static var largeAccessibilityFont: UIFont {
        UIFont.systemFont(ofSize: largeAccessibilityFontSize)
    }
    static var largeBoldAccessibilityFont: UIFont {
        UIFont.boldSystemFont(ofSize: largeAccessibilityFontSize)
    }
    
    static var largeTitleAccessibilityFontSize: CGFloat {
        UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
    }
    static var largeTitleAccessibilityFont: UIFont {
        UIFont.systemFont(ofSize: largeTitleAccessibilityFontSize)
    }
    static var largeTitleBoldAccessibilityFont: UIFont {
        UIFont.boldSystemFont(ofSize: largeTitleAccessibilityFontSize)
    }
}
