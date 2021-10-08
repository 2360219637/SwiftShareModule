//
//  UIView+JHShadow.swift
//  Music_Test
//
//  Created by chenzhichao on 2021/9/13.
//

import Foundation
import UIKit

/**
 UIView一行代码实现添加阴影效果
 使用注意：
 1、self必须添加到父视图之后才能添加阴影
 2、self必须设置frame
 */
extension UIView {
    /**
     四周发散的阴影效果
     */
    public func addShdow(shadowOpacity: Float,
                         shadowColor: UIColor,
                         shadowRadius: CGFloat,
                         cornerRadius: CGFloat) {
        addShdow(shadowOpacity: shadowOpacity,
                 shadowColor: shadowColor,
                 shadowX: 0,
                 shadowY: 0,
                 shadowRadius: shadowRadius,
                 cornerRadius: cornerRadius)
    }
    
    /**
     shadowX: 阴影在X方向上的偏移
     shadowY: 阴影在Y方向上的偏移
     self必须添加到父视图之后才能添加阴影
     */
    public func addShdow(shadowOpacity: Float,
                         shadowColor: UIColor,
                         shadowX: CGFloat,
                         shadowY: CGFloat,
                         shadowRadius: CGFloat,
                         cornerRadius: CGFloat) {
        let shadowLayer = JHShadowLayer.init()
        shadowLayer.frame = self.layer.frame
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        
        let path = UIBezierPath.init()
        let width = shadowLayer.bounds.size.width
        let height = shadowLayer.bounds.size.height
        let x = shadowLayer.bounds.origin.x
        let y = shadowLayer.bounds.origin.y
        let topLeft = shadowLayer.bounds.origin
        let topRight = CGPoint(x: x + width, y: y)
        let bottomLeft = CGPoint(x: x, y: y + height)
        let bottomRight = CGPoint(x: x + width, y: y + height)
        
        let offset: CGFloat = -1
        path.move(to: CGPoint(x: topLeft.x - offset, y: topLeft.y + cornerRadius))
        path.addArc(withCenter: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y + cornerRadius),
                    radius: cornerRadius + offset,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi / 2) * 3,
                    clockwise: true)
        path.addLine(to: CGPoint(x: topRight.x - cornerRadius, y: topRight.y - offset))
        path.addArc(withCenter: CGPoint(x: topRight.x - cornerRadius, y: topRight.y + cornerRadius),
                    radius: cornerRadius + offset,
                    startAngle: CGFloat(Double.pi / 2) * 3,
                    endAngle: CGFloat(Double.pi) * 2,
                    clockwise: true)
        path.addLine(to: CGPoint(x: bottomRight.x + offset, y: bottomRight.y - cornerRadius))
        path.addArc(withCenter: CGPoint(x: bottomRight.x - cornerRadius, y: bottomRight.y - cornerRadius),
                    radius: cornerRadius + offset,
                    startAngle: 0,
                    endAngle: CGFloat(Double.pi / 2),
                    clockwise: true)
        path.addLine(to: CGPoint(x: bottomLeft.x + cornerRadius, y: bottomLeft.y + offset))
        path.addArc(withCenter: CGPoint(x:bottomLeft.x + cornerRadius, y: bottomLeft.y - cornerRadius),
                    radius: cornerRadius + offset,
                    startAngle: CGFloat(Double.pi / 2),
                    endAngle: CGFloat(Double.pi),
                    clockwise: true)
        path.addLine(to: CGPoint(x: topLeft.x - offset, y: topLeft.y + cornerRadius))
        
        shadowLayer.shadowPath = path.cgPath
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.superview?.layer.insertSublayer(shadowLayer, below: self.layer)
        
    }
    
    //移除阴影
    public func removeShadowLayer() {
        if let superview = self.superview, let layers = superview.layer.sublayers {
            for layer in layers where layer is JHShadowLayer {
                layer.removeFromSuperlayer()
                break
            }
        }
    }
}

class JHShadowLayer: CALayer {}
