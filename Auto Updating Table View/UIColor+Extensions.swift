//
//  UIColor+Extensions.swift
//  Degrouper
//
//  Created by Nathan Fennel on 8/13/20.
//  Copyright © 2020 Nathan Fennel. All rights reserved.
//

import UIKit

extension UIColor {
    static var tintColor: UIColor {
        UIColor(red: 0.6, green: 0.7, blue: 0.8, alpha: 1)
    }
    
    static var backgroundColor: UIColor {
        .white
    }
}

extension UIColor {
    static var background: UIColor {
        UIColor(white: 0.9, alpha: 1)
    }
    
    public static var random: UIColor {
        let r = CGFloat(Int(arc4random_uniform(256))) / 255
        let g = CGFloat(Int(arc4random_uniform(256))) / 255
        let b = CGFloat(Int(arc4random_uniform(256))) / 255
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    static func random(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIImage(color: .random, size: size)
    }
    
    static func rainbow(size: CGSize = CGSize(width: 50, height: 50)) -> [UIImage] {
        let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .magenta, .purple]
        return colors.compactMap({ (color) -> UIImage? in
            UIImage(color: color, size: size)
        })
    }
}
