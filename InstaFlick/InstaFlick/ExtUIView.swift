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
  
//  func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
//    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
//    rotateAnimation.fromValue = 0.0
//    rotateAnimation.toValue = CGFloat(M_PI * 2.0)
//    rotateAnimation.duration = duration
//    
//    if let delegate: AnyObject = completionDelegate {
//      rotateAnimation.delegate = delegate
//    }
//    self.layer.addAnimation(rotateAnimation, forKey: nil)
//  }
  
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
    self.addAnimationWithDelay(shapeLayer: f11line, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.33, timingFunction:kCAMediaTimingFunctionEaseOut)
    
    self.addAnimationWithDelay(shapeLayer: f11line, keyPath: "strokeStart", fromValue: 0.0, toValue: 1.0, duration: 1.0, delay: 1.0, timingFunction:kCAMediaTimingFunctionEaseOut)
    
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
    self.addAnimationWithDelay(shapeLayer: f12line, keyPath: "strokeEnd", fromValue: 0.0, toValue: 1.0, duration: 0.75, delay: 0.33, timingFunction:kCAMediaTimingFunctionEaseIn)
    
    self.addAnimationWithDelay(shapeLayer: f12line, keyPath: "strokeStart", fromValue: 0.0, toValue: 0.5, duration: 1.0, delay: 1.0, timingFunction:kCAMediaTimingFunctionEaseIn)
    
    UIView.animate(withDuration: 1.0, delay: 1.0, options: [.curveEaseIn], animations: {
      f11line.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
      f12line.transform = CATransform3DMakeRotation(CGFloat(M_PI_4/2), 0, 0, 1)
    })
    
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
