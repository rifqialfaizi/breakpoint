//
//  InsetTextField.swift
//  breakpoint
//
//  Created by Rifqi Alfaizi on 01/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

    //private var textRectOfset: CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }
    
    
    let rectContainer: CGRect = CGRect()
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return rectContainer.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return rectContainer.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return rectContainer.inset(by: padding)
    }

    
}
