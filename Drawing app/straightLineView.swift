//
//  straightLineView.swift
//  lab3
//
//  Created by RUI WANG on 10/1/19.
//  Copyright © 2019 RUI WANG. All rights reserved.
//

import UIKit

class straightLineView: UIView {

    var theLine: straightLine?{
        didSet{
            setNeedsDisplay()
        }
    }
    var lines:[straightLine] = []{
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
    
    func drawLine(_ line : straightLine){
        let path = UIBezierPath()
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = .round
        path.lineWidth = line.lineWidth
        line.color.setStroke()
        path.move(to: line.startPoint)
        path.addLine(to: line.touchPoint)
        path.stroke()
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
        // Drawing code
    }
    

}
