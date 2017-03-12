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
  
  func addAnimationWithDelay(shapeLayer:CAShapeLayer, pathAnimation:CABasicAnimation, keyPath:String, fromValue:Double, toValue:Double, duration:Double, delay:Double) {
    DispatchQueue.main.asyncAfter(deadline: (.now() + delay)) {
      pathAnimation.duration = CFTimeInterval(duration)
      pathAnimation.fromValue = NSNumber(value: fromValue)
      pathAnimation.toValue = NSNumber(value: toValue)
      shapeLayer.add(pathAnimation, forKey: keyPath)
    }
  }
  
  func animatedLineFrom(from: CGPoint, to: CGPoint) -> CAShapeLayer {
    let linePath = UIBezierPath()
    linePath.move(to: from)
    linePath.addLine(to: to)
    
    let line = CAShapeLayer()
    line.path = linePath.cgPath
    line.lineCap = kCALineCapRound
    line.strokeColor = UIColor.cyan.cgColor
    
    
    let pathAnimation_strokeEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    self.addAnimationWithDelay(shapeLayer: line, pathAnimation:pathAnimation_strokeEnd, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 0.0)
    let pathAnimation2_strokeStart: CABasicAnimation = CABasicAnimation(keyPath: "strokeStart")
    self.addAnimationWithDelay(shapeLayer: line, pathAnimation:pathAnimation2_strokeStart, keyPath: "strokeStart", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.9)
    
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
    let pathAnimation_strokeEnd: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    self.addAnimationWithDelay(shapeLayer: f11line, pathAnimation:pathAnimation_strokeEnd, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.33)
    
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
    let pathAnimation_strokeEnd2: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    self.addAnimationWithDelay(shapeLayer: f12line, pathAnimation:pathAnimation_strokeEnd2, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.33)
    
    return replicator
  }
  
  func fireworks() {
    self.layer.addSublayer(
      self.animatedLineFrom(from: CGPoint(x: 160, y: 550), to: self.center)
    )
    
    DispatchQueue.main.asyncAfter(deadline: (.now() + 1.0)) {
      self.layer.addSublayer(self.firework1(at: self.center))
    }
  }
  
}
