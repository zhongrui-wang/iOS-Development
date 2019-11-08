//
//  SubViewController.swift
//  lab3
//
//  Created by RUI WANG on 10/1/19.
//  Copyright © 2019 RUI WANG. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    var startPoint = CGPoint.zero
    var touchPoint = CGPoint.zero
    var width: CGFloat = 10.0
    var color: UIColor = UIColor.black
    
    var currentLine: straightLine?
    var lineCanvas: straightLineView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lineCanvas = straightLineView(frame: view.frame)
        view.addSubview(lineCanvas)
        view.sendSubviewToBack(lineCanvas)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func undo(_ sender: Any) {
        if(!lineCanvas.lines.isEmpty){
            lineCanvas.lines.removeLast()
        }
    }

    @IBAction func clear(_ sender: Any) {
        lineCanvas.lines = []
    }
    
    @IBAction func color_blue(_ sender: Any) {
         color = UIColor.blue
    }
    @IBAction func color_black(_ sender: Any) {
        color = UIColor.black
    }
    
    @IBAction func color_green(_ sender: Any) {
        color = UIColor.green
    }
    
    @IBAction func color_red(_ sender: Any) {
         color = UIColor.red
    }
    
    @IBAction func color_cyan(_ sender: Any) {
        color = UIColor.cyan
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentLine = straightLine(startPoint: touchPoint, touchPoint: CGPoint.zero, color: color, lineWidth: width)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentLine?.touchPoint = touchPoint
        lineCanvas.theLine = currentLine
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        print("point is \(touchPoint)")
        if let newLine = currentLine{
            lineCanvas.lines.append(newLine)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
