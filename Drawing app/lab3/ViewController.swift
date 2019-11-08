//
//  ViewController.swift
//  lab3
//
//  Created by RUI WANG on 9/30/19.
//  Copyright © 2019 RUI WANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentLine: Line?
    var lineCanvas: lineView!
    var width: CGFloat = 10.0
    var color: UIColor = UIColor.black
    var opacity: CGFloat = 1.0
    
    @IBAction func color_blue(_ sender: UIButton) {
        color = UIColor.blue
    }
    
    @IBAction func color_green(_ sender: UIButton) {
        color = UIColor.green
    }
    
    @IBAction func color_red(_ sender: UIButton) {
        color = UIColor.red
    }
  
    @IBAction func color_magenta(_ sender: UIButton) {
        color = UIColor.magenta
    }
    
    @IBAction func color_black(_ sender: UIButton) {
         color = UIColor.black
    }
   
    @IBAction func lineWidth(_ sender: UISlider) {
        width = CGFloat(sender.value)
    }
    
    @IBAction func clear(_ sender: Any) {
        lineCanvas.lines = []
    }
   
    @IBAction func undo(_ sender: Any) {
        if(!lineCanvas.lines.isEmpty){
            lineCanvas.lines.removeLast()
        }
    }
    @IBAction func opacity(_ sender: UISlider) {
        opacity = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineCanvas = lineView(frame: view.frame)
        view.addSubview(lineCanvas)
        view.sendSubviewToBack(lineCanvas)
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentLine = Line(lineWidth: width, color: color, opacity: opacity, points: [touchPoint])
        lineCanvas.lines.append(currentLine!)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        guard var lastLine = lineCanvas.lines.popLast() else { return }
        lastLine.points.append(touchPoint)
        lineCanvas.lines.append(lastLine)
        lineCanvas.theLine = lastLine
    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touchPoint = touches.first?.location(in: view) else { return }
////        print("point is \(touchPoint)")
//    }



}

