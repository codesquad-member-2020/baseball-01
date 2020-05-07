//
//  AutoLayout.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/04.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraints(topAnchor: NSLayoutYAxisAnchor?, leadingAnchor: NSLayoutXAxisAnchor?, bottomAnchor: NSLayoutYAxisAnchor?, trailingAnchor: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true
        }
        
        if let leadingAnchor = leadingAnchor {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true
        }
        
        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom).isActive = true
        }
        
        if let trailingAnchor = trailingAnchor {
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right).isActive = true
        }
        
        if size.width != 0 {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView() {
        guard let superView = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func centerInSuperView() {
        guard let superView = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
}
