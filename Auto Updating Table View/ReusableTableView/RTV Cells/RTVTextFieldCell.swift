//
//  RTVTextFieldCell.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

struct RTVTextFieldModel: RTVRowModel {
    func requiresUpdate(from oldValue: RTVRowModel) -> Bool {
        guard let oldValue = oldValue as? RTVTextFieldModel else {
            return true
        }
        return oldValue.editable != editable ||
            oldValue.placeholderText != placeholderText ||
            oldValue.text != text ||
            oldValue.textfieldParameters != textfieldParameters
    }
    
    let type: UITableViewCell.Type = RTVTextFieldCell.self
    let didSelectBlock: RTVSelectionBlock?
    
    typealias TextFieldCompletionBlock = (String?)->()
    let textCompletionBlock: TextFieldCompletionBlock?
    
    let editable: Bool
    let placeholderText: String?
    let text: String?
    let textfieldParameters: TextFieldParameters?
    
    init(editable: Bool = true,
         placeholderText: String?,
         text: String?,
         textfieldParameters: TextFieldParameters? = nil,
         didSelectBlock: RTVSelectionBlock? = nil,
         textCompletionBlock: TextFieldCompletionBlock? = nil) {
        self.editable = editable
        self.placeholderText = placeholderText
        self.text = text
        self.textfieldParameters = textfieldParameters
        self.didSelectBlock = didSelectBlock
        self.textCompletionBlock = textCompletionBlock
    }
}

private class RTVTextFieldCell: UITableViewCell, RTVCell, UITextFieldDelegate {
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        contentView.addSubview(textField)
        textField.setEdgesEqualToSuperview(constant: 16)
        return textField
    }()
    
    private var textCompletionBlock: RTVTextFieldModel.TextFieldCompletionBlock? = nil
    
    
    func configure(with model: RTVRowModel) {
        guard let model = model as? RTVTextFieldModel else {
            assertionFailure("Model is not of expected type \"RTVTextFieldModel\"")
            return
        }
        
        textCompletionBlock = model.textCompletionBlock
        
        textField.placeholder = model.placeholderText
        textField.text = model.text
        textField.delegate = self
        model.textfieldParameters?.apply(to: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textCompletionBlock?(textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        defer {
            textCompletionBlock?(textField.text)
        }
        
        textField.resignFirstResponder()
        return true
    }
}
