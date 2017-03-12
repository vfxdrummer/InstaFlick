//
//  ExtensionUIImageView.swift
//  InstaFlick
//
//  Created by Tim Brandt on 3/1/17.
//  Copyright © 2015 BrandtApps. All rights reserved.
//
//  USAGE: Loading images into UIImageViews with the help of SDWebImage

import UIKit

extension UIView {
  
  //
  // Animation
  //
  
  func addAnimationWithDelay(shapeLayer:CAShapeLayer, keyPath:String, fromValue:Double, toValue:Double, duration:Double, delay:Double, timingFunction:String) {
    let pathAnimation: CABasicAnimation = CABasicAnimation(keyPath: keyPath)
    pathAnimation.timingFunction = CAMediaTimingFunction(name: timingFunction)
    DispatchQueue.main.asyncAfter(deadline: (.now() + delay)) {
      pathAnimation.duration = CFTimeInterval(duration)
      pathAnimation.fromValue = NSNumber(value: fromValue)
      pathAnimation.toValue = NSNumber(value: toValue)
      shapeLayer.add(pathAnimation, forKey: keyPath)
    }
  }
  
  func animatedDot(withDistance delta: CGFloat, delay: Double) -> CALayer {
    let dot = CAShapeLayer()
    dot.backgroundColor = UIColor.cyan.cgColor
    dot.frame = CGRect(x: 0, y: -10, width: 1, height: 1)
    
    self.addAnimationWithDelay(shapeLayer: dot, keyPath: "transform.translation.y", fromValue: 0.0, toValue: -(Double)(delta), duration: 1.0, delay: 0.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    return dot
  }
  
  func animatedLineFrom(from: CGPoint, to: CGPoint) -> CAShapeLayer {
    let linePath = UIBezierPath()
    linePath.move(to: from)
    linePath.addLine(to: to)
    
    let line = CAShapeLayer()
    line.path = linePath.cgPath
    line.lineCap = kCALineCapRound
    line.strokeColor = UIColor.cyan.cgColor
    
    
    self.addAnimationWithDelay(shapeLayer: line, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 0.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    self.addAnimationWithDelay(shapeLayer: line, keyPath: "strokeStart", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.9, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    line.strokeStart = 1.0
    
    return line
  }
  
  func firework1(at atPoint: CGPoint) -> CAReplicatorLayer {
    let replicator = CAReplicatorLayer()
    replicator.position = atPoint
    
    let f11linePath = UIBezierPath()
    f11linePath.move(to: CGPoint(x: 0, y: -10))
    f11linePath.addLine(to: CGPoint(x: 0, y: -100))
    
    // line 1
    let f11line = CAShapeLayer()
    f11line.path = f11linePath.cgPath
    f11line.strokeColor = UIColor.cyan.cgColor
    replicator.addSublayer(f11line)
    
    replicator.instanceCount = 20
    replicator.instanceTransform = CATransform3DMakeRotation(CGFloat(M_PI/10), 0, 0, 1)
    
    f11line.strokeEnd = 0
    self.addAnimationWithDelay(shapeLayer: f11line, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 0.33, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    self.addAnimationWithDelay(shapeLayer: f11line, keyPath: "strokeStart", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 1.0, timingFunction:kCAMediaTimingFunctionEaseIn)
    
    //line path 2
    let f12linePath = UIBezierPath()
    f12linePath.move(to: CGPoint(x: 0, y: -25))
    f12linePath.addLine(to: CGPoint(x: 0, y: -100))
    f12linePath.apply(CGAffineTransform(rotationAngle: CGFloat(M_PI/20)))
    
    let f12line = CAShapeLayer()
    f12line.path = f12linePath.cgPath
    f12line.lineDashPattern = [20, 2]
    f12line.strokeColor = UIColor.cyan.cgColor
    replicator.addSublayer(f12line)
    
    f12line.strokeEnd = 0
    self.addAnimationWithDelay(shapeLayer: f12line, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 0.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    self.addAnimationWithDelay(shapeLayer: f12line, keyPath: "strokeStart", fromValue: 0.0, toValue: 0.5, duration: 1.0, delay: 1.0, timingFunction:kCAMediaTimingFunctionEaseIn)
    
    // rotations
    self.addAnimationWithDelay(shapeLayer: f11line, keyPath: "transform.rotation", fromValue: 0.0, toValue: M_PI_4, duration: 2.0, delay: 0.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    self.addAnimationWithDelay(shapeLayer: f12line, keyPath: "transform.rotation", fromValue: 0.0, toValue: M_PI_4/2, duration: 2.0, delay: 0.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    replicator.addSublayer(
      animatedDot(withDistance: 0, delay: 0)
    )
    
    return replicator
  }
  
  func firework2(at atPoint: CGPoint) -> CAReplicatorLayer {
    let replicator = CAReplicatorLayer()
    replicator.position = atPoint
    
    replicator.instanceCount = 40
    replicator.instanceTransform = CATransform3DMakeRotation(CGFloat(M_PI/20), 0, 0, 1)
    
    replicator.addSublayer(
      animatedDot(withDistance: 100, delay: 0)
    )
    
    return replicator
  }
  
  func fireworks() {
//    self.layer.addSublayer(self.firework1(at: self.center))
    self.layer.addSublayer(self.firework2(at: self.center))
  }
  
}
