//
//  AddButton.swift
//  AddButton
//
//  Created by Sven Bacia on 24.02.16.
//  Copyright © 2016 Sven Bacia. All rights reserved.
//

import UIKit

@IBDesignable
public final class AddButton: UIControl {
  
  // MARK: - Public Properties
  
  /// Stroke color for the add sign.
  @IBInspectable public var strokeColor: UIColor = UIColor.blackColor()
  
  /// Line width for the add sign / checkmark.
  @IBInspectable public var lineWidth: CGFloat = 2.0 {
    didSet {
      shape.lineWidth = lineWidth
    }
  }
  
  /// When set to `true` the button will display a checkmark. 
  /// When `false` an add sign.
  @IBInspectable public var added: Bool = false {
    didSet {
      updateShape()
    }
  }
  
  /// The additional spacing between the border of the view 
  /// and the add sign / checkmark.
  @IBInspectable public var margin: CGFloat = 2.0
  
  public override var highlighted: Bool {
    didSet {
      if highlighted {
        shape.opacity = 0.3
      } else {
        shape.opacity = 1.0
      }
    }
  }
  
  // MARK: - Private Properties
  
  // Shape for the add sign / checkmark.
  private var shape = CAShapeLayer()
  
  // Calculated points to draw the checkmark.
  private let checkmarkMultiplier: [(CGFloat, CGFloat)] = {
    var points = [(CGFloat, CGFloat)]()
    points.append((0.03625, 0.5))
    points.append((0.34625, 0.80875))
    points.append((0.96375, 0.19125))
    return points
  }()
  
  // MARK: - Init
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUp()
  }
  
  // MARK: - Setup
  
  private func setUp() {
    shape.fillColor = nil
    shape.lineCap   = kCALineCapRound
    shape.lineJoin  = kCALineJoinRound
    shape.lineWidth = lineWidth
    layer.addSublayer(shape)
  }
  
  // MARK: - Auto Layout
  
  public override func intrinsicContentSize() -> CGSize {
    return CGSize(width: 44.0, height: 44.0)
  }
  
  // MARK: - Layout
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    updateShape()
  }
  
  private func updateShape() {
    
    // Get the actual margin. Include the lineWidth and also the width of the border
    let margin      = lineWidth / 2.0 + layer.borderWidth / 2.0 + self.margin
    let contentRect = CGRectInset(bounds, margin, margin)
    
    let width  = contentRect.width
    let height = contentRect.height
    
    let path = UIBezierPath()
    
    if added {
      // When added draw the checkmark
      let points = checkmarkMultiplier.map { CGPoint(x: $0 * width, y: $1 * height) }
      for (index, point) in points.enumerate() {
        if index == 0 {
          path.moveToPoint(point)
        } else {
          path.addLineToPoint(point)
        }
      }
    }
    else {
      // Otherwise draw the add sign
      path.moveToPoint(CGPointMake(margin, height / 2.0))
      path.addLineToPoint(CGPointMake(width - margin, height / 2.0))
      path.moveToPoint(CGPointMake(width / 2.0, margin))
      path.addLineToPoint(CGPointMake(width / 2.0, height - margin))
    }
    
    // update the shape
    shape.frame       = contentRect
    shape.path        = path.CGPath
    shape.strokeColor = added ? tintColor.CGColor : strokeColor.CGColor
  }
  
  // MARK: - Border
  
  public func border(width width: CGFloat, color: UIColor? = nil, cornerRadius: CGFloat = 0.0) {
    layer.borderWidth  = width
    layer.borderColor  = color?.CGColor
    layer.cornerRadius = cornerRadius
    updateShape()
  }
}
