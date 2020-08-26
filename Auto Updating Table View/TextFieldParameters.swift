//
//  TextFieldParameters.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/22/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct TextFieldParameters: Equatable {
    static func == (lhs: TextFieldParameters, rhs: TextFieldParameters) -> Bool {
        return lhs.keyboardType == rhs.keyboardType &&
            lhs.keyboardAppearance == rhs.keyboardAppearance &&
            lhs.returnKeyType == rhs.returnKeyType &&
            lhs.textColor == rhs.textColor &&
            lhs.font == rhs.font &&
            lhs.textAlignment == rhs.textAlignment &&
            lhs.borderStyle == rhs.borderStyle &&
            lhs.clearsOnBeginEditing == rhs.clearsOnBeginEditing &&
            lhs.adjustsFontSizeToFitWidth == rhs.adjustsFontSizeToFitWidth &&
            lhs.minimumFontSize == rhs.minimumFontSize &&
            lhs.background == rhs.background &&
            lhs.disabledBackground == rhs.disabledBackground &&
            lhs.autocapitalizationType == rhs.autocapitalizationType &&
            lhs.autocorrectionType == rhs.autocorrectionType &&
            lhs.smartQuotesType == rhs.smartQuotesType &&
            lhs.smartDashesType == rhs.smartDashesType &&
            lhs.smartInsertDeleteType == rhs.smartInsertDeleteType &&
            lhs.enablesReturnKeyAutomatically == rhs.enablesReturnKeyAutomatically &&
            lhs.textContentType == rhs.textContentType &&
            lhs.passwordRules == rhs.passwordRules
    }
    
    let keyboardType: UIKeyboardType?
    let keyboardAppearance: UIKeyboardAppearance
    let returnKeyType: UIReturnKeyType?
    let textColor: UIColor?
    let font: UIFont?
    let textAlignment: NSTextAlignment
    let borderStyle: UITextField.BorderStyle
    // defaultTextAttributes does not conform to Equatable and is not considered a change that reloads the cell
    let defaultTextAttributes: [NSAttributedString.Key : Any]
    let clearsOnBeginEditing: Bool
    let adjustsFontSizeToFitWidth: Bool
    let minimumFontSize: CGFloat
    let background: UIImage?
    let disabledBackground: UIImage?
    let autocapitalizationType: UITextAutocapitalizationType
    let autocorrectionType: UITextAutocorrectionType
    let smartQuotesType: UITextSmartQuotesType
    let smartDashesType: UITextSmartDashesType
    let smartInsertDeleteType: UITextSmartInsertDeleteType
    let enablesReturnKeyAutomatically: Bool
    let textContentType: UITextContentType?
    let passwordRules: UITextInputPasswordRules?
    
    init(keyboardType: UIKeyboardType? = nil,
         keyboardAppearance: UIKeyboardAppearance = .default,
         returnKeyType: UIReturnKeyType? = nil,
         textColor: UIColor? = nil,
         font: UIFont? = nil,
         textAlignment: NSTextAlignment = .natural,
         borderStyle: UITextField.BorderStyle = .none,
         defaultTextAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key : Any](),
         clearsOnBeginEditing: Bool = false,
         adjustsFontSizeToFitWidth: Bool = false,
         minimumFontSize: CGFloat = 0,
         background: UIImage? = nil,
         disabledBackground: UIImage? = nil,
         autocapitalizationType: UITextAutocapitalizationType = .sentences,
         autocorrectionType: UITextAutocorrectionType = .default,
         smartQuotesType: UITextSmartQuotesType = .default,
         smartDashesType: UITextSmartDashesType = .default,
         smartInsertDeleteType: UITextSmartInsertDeleteType,
         enablesReturnKeyAutomatically: Bool = false,
         textContentType: UITextContentType? = nil,
         passwordRules: UITextInputPasswordRules? = nil) {
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
        self.returnKeyType = returnKeyType
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.borderStyle = borderStyle
        self.defaultTextAttributes = defaultTextAttributes
        self.clearsOnBeginEditing = clearsOnBeginEditing
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.minimumFontSize = minimumFontSize
        self.background = background
        self.disabledBackground = disabledBackground
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.smartQuotesType = smartQuotesType
        self.smartDashesType = smartDashesType
        self.smartInsertDeleteType = smartInsertDeleteType
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.textContentType = textContentType
        self.passwordRules = passwordRules
    }
    
    func apply(to textField: UITextField) {
        if let keyboardType = keyboardType {
            textField.keyboardType = keyboardType
        }
        if let returnKeyType = returnKeyType {
            textField.returnKeyType = returnKeyType
        }
        if let textColor = textColor {
            textField.textColor = textColor
        }
        if let font = font {
            textField.font = font
        }
        textField.textAlignment = textAlignment
        textField.borderStyle = borderStyle
        textField.defaultTextAttributes = defaultTextAttributes
        textField.clearsOnBeginEditing = clearsOnBeginEditing
        textField.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        textField.minimumFontSize = minimumFontSize
        if let background = background {
            textField.background = background
        }
        if let disabledBackground = disabledBackground {
            textField.disabledBackground = disabledBackground
        }
        textField.autocapitalizationType = autocapitalizationType
        textField.autocorrectionType = autocorrectionType
        textField.smartQuotesType = smartQuotesType
        textField.smartDashesType = smartDashesType
        textField.smartInsertDeleteType = smartInsertDeleteType
        textField.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        if let textContentType = textContentType {
            textField.textContentType = textContentType
        }
        if let passwordRules = passwordRules {
            textField.passwordRules = passwordRules
        }
    }
}

extension UITextField {
    func apply(_ parameters: TextFieldParameters?) {
        parameters?.apply(to: self)
    }
}

