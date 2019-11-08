//
//  lineView.swift
//  lab3
//
//  Created by RUI WANG on 9/30/19.
//  Copyright © 2019 RUI WANG. All rights reserved.
//

import UIKit

class lineView: UIView {
    
    var theLine: Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    var lines = [Line](){
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        // implement this function here
        var midpoint: CGPoint = CGPoint.zero
        midpoint.x = (first.x + second.x)/2
        midpoint.y = (first.y + second.y)/2
        return midpoint
    }
    
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object
        if(points.count < 2){ //There are no points to add to this path
            return path }
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second:
                points[i]) //Get midpoint between the path's last point and the next one in the array
            let secondMidpoint = midpoint(first: points[i], second:
                points[i+1]) //Get midpoint between the next point in the array and the one after it
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
                          controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
        }
        return path }
    
    func drawLine(_ line : Line){
        let path = createQuadPath(points: line.points)
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = .round
        path.lineWidth = CGFloat(line.lineWidth)
        line.color.setStroke()
        path.stroke(with:.normal, alpha: line.opacity)
//        for (i,p) in line.points.enumerated(){
//            path.lineWidth = CGFloat(line.lineWidth)
//            line.color.setStroke()
//            if i == 0 {
//                path.move(to: p)
//            }else{
//                path.addLine(to: p)
//            }
//            path.stroke()
//        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        for line in lines{
            drawLine(line)
        }
        if(theLine != nil){
            drawLine(theLine!)
            theLine = nil
        }
    }
}
