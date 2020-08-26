//
//  UIView+LayoutExtensions.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/19/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func centerInSuperView() -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setEdgesEqualToSuperview()` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: superview.widthAnchor,
                                    constant: 0).isActive = true
        self.heightAnchor.constraint(equalTo: superview.heightAnchor,
                                     constant: 0).isActive = true
        
        return true
    }
    
    @discardableResult func setEdgesEqualToSuperview(constant: CGFloat = 0) -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setEdgesEqualToSuperview()` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor,
                                  constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                     constant: -constant).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                      constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                       constant: -constant).isActive = true
        
        return true
    }
    
    @discardableResult func setLeadingEdgeEqualToSuperView(constant: CGFloat = 0) -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setLeadingEdgeEqualToSuperView(constant:)` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                      constant: constant).isActive = true
        
        return true
    }
    
    @discardableResult func setTrailingEdgeEqualToSuperView(constant: CGFloat = 0) -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setTrailingEdgeEqualToSuperView(constant:)` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                       constant: constant).isActive = true
        
        return true
    }
    
    @discardableResult func setTopEdgeEqualToSuperView(constant: CGFloat = 0) -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setTopEdgeEqualToSuperView(constant:)` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.topAnchor,
                                  constant: constant).isActive = true
        
        return true
    }
    
    @discardableResult func setBottomEdgeEqualToSuperView(constant: CGFloat = 0) -> Bool {
        guard let superview = self.superview else {
            assertionFailure("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `setBottomEdgeEqualToSuperView(constant:)` to fix this.")
            return false
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                     constant: constant).isActive = true
        
        return true
    }
}

extension UIView {
    func setHeight(lessThanOrEqualTo constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
}

extension UIView {
    
    enum Edge: String {
        case leading, trailing, top, bottom
        
        fileprivate enum Direction {
            case horizontal, vertical
        }
        
        fileprivate var direction: Direction {
            switch self {
            case .leading, .trailing:
                return .horizontal
            case .top, .bottom:
                return .vertical
            }
        }
    }
    
    func set(_ edge: Edge,
             equalTo otherView: UIView,
             constant: CGFloat = 0) {
        set(edge,
            equalTo: edge,
            of: otherView,
            constant: constant)
    }
    
    func set(_ edge: Edge,
             equalTo otherEdge: Edge,
             of otherView: UIView,
             constant: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        guard edge.direction == otherEdge.direction else {
            assertionFailure("Cannot align \(edge.rawValue) edge with \(otherEdge.rawValue) edge. Both must be either horizontal or vertical edge types.")
            return
        }
        
        switch (edge, otherEdge) {
        case (.top, .top):
            topAnchor.constraint(equalTo: otherView.topAnchor,
                                 constant: constant).isActive = true
        case (.top, .bottom):
            topAnchor.constraint(equalTo: otherView.bottomAnchor,
                                 constant: constant).isActive = true
        case (.bottom, .top):
            bottomAnchor.constraint(equalTo: otherView.topAnchor,
                                    constant: constant).isActive = true
        case (.bottom, .bottom):
            bottomAnchor.constraint(equalTo: otherView.bottomAnchor,
                                    constant: constant).isActive = true
        case (.leading, .leading):
            leadingAnchor.constraint(equalTo: otherView.leadingAnchor,
                                     constant: constant).isActive = true
        case (.leading, .trailing):
            leadingAnchor.constraint(equalTo: otherView.trailingAnchor,
                                     constant: constant).isActive = true
        case (.trailing, .leading):
            trailingAnchor.constraint(equalTo: otherView.leadingAnchor,
                                      constant: constant).isActive = true
        case (.trailing, .trailing):
            trailingAnchor.constraint(equalTo: otherView.trailingAnchor,
                                      constant: constant).isActive = true
        default:
            assertionFailure("Cannot align \(edge.rawValue) edge with \(otherEdge.rawValue) edge. Both must be either horizontal or vertical edge types.")
            return
        }
    }
}
