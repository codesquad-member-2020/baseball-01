//
//  BaseBoardView.swift
//  BaseballGameApp
//
//  Created by Cory Kim on 2020/05/14.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

@IBDesignable
class BaseBoardView: UIView {

    private var firstBase: UIView!
    private var secondBase: UIView!
    private var thirdBase: UIView!
    
    private let baseSpacing: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func updateBase(index: Int, isOccupied: Bool) {
        let bases = [firstBase, secondBase, thirdBase]
        bases[index]?.backgroundColor = isOccupied ? UIColor(named: "base.occupied") : .white
    }
    
    private func configure() {
        configureUI()
    }
    
    private func configureUI() {
        let baseWidth = bounds.width / 2 - 4
        let baseHeight = baseWidth * 3 / 4
        
        secondBase = UIView(frame: .init(x: bounds.midX - baseWidth / 2 , y: -4, width: baseWidth, height: baseHeight))
        secondBase.backgroundColor = .white
        secondBase.addDiamondMask(cornerRadius: 4)
        addSubview(secondBase)
        
        firstBase = UIView(frame: .init(x: secondBase.frame.maxX - (baseWidth / 2) + baseSpacing, y: secondBase.frame.maxY - (baseHeight / 2) + baseSpacing, width: baseWidth, height: baseHeight))
        firstBase.backgroundColor = .white
        firstBase.addDiamondMask(cornerRadius: 4)
        addSubview(firstBase)
        
        thirdBase = UIView(frame: .init(x: secondBase.frame.minX - (baseWidth / 2) - baseSpacing, y: secondBase.frame.maxY - (baseHeight / 2) + baseSpacing, width: baseWidth, height: baseHeight))
        thirdBase.backgroundColor = .white
        thirdBase.addDiamondMask(cornerRadius: 4)
        addSubview(thirdBase)
    }
}

extension UIView {
    func addDiamondMask(cornerRadius: CGFloat = 0) {
        let path = UIBezierPath()

        let points = [
            CGPoint(x: bounds.midX, y: bounds.minY),
            CGPoint(x: bounds.maxX, y: bounds.midY),
            CGPoint(x: bounds.midX, y: bounds.maxY),
            CGPoint(x: bounds.minX, y: bounds.midY)
        ]

        path.move(to: point(from: points[0], to: points[1], distance: cornerRadius, fromStart: true))
        for i in 0 ..< 4 {
            path.addLine(to: point(from: points[i], to: points[(i + 1) % 4], distance: cornerRadius, fromStart: false))
            path.addQuadCurve(to: point(from: points[(i + 1) % 4], to: points[(i + 2) % 4], distance: cornerRadius, fromStart: true), controlPoint: points[(i + 1) % 4])
        }
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        layer.mask = shapeLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = shapeLayer.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.black.cgColor
        borderLayer.lineWidth = 2
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }

    private func point(from point1: CGPoint, to point2: CGPoint, distance: CGFloat, fromStart: Bool) -> CGPoint {
        let start: CGPoint
        let end: CGPoint

        if fromStart {
            start = point1
            end = point2
        } else {
            start = point2
            end = point1
        }
        let angle = atan2(end.y - start.y, end.x - start.x)
        return CGPoint(x: start.x + distance * cos(angle), y: start.y + distance * sin(angle))
    }

}
