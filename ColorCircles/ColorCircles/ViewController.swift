//
//  ViewController.swift
//  ColorCircles
//
//  Created by Игорь on 29.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinkCircleView: PinkCircleView!
    @IBOutlet weak var pinkCircleView2: PinkCircleView!
    @IBOutlet weak var pinkCircleView3: PinkCircleView!
    
    @IBAction func pinkCirclePanAction(_ recognizer: UIPanGestureRecognizer) {
        circleMoving(recognizer)
        circleMerge(pinkCircleView2, with: pinkCircleView,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
        circleMerge(pinkCircleView2, with: pinkCircleView3,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
    }
    @IBAction func pinkCircle2PanAction(_ recognizer: UIPanGestureRecognizer) {
        circleMoving(recognizer)
        circleMerge(pinkCircleView3, with: pinkCircleView,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
        circleMerge(pinkCircleView3, with: pinkCircleView2,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
    }
    @IBAction func pinkCircle3PanAction(_ recognizer: UIPanGestureRecognizer) {
        circleMoving(recognizer)
        circleMerge(pinkCircleView, with: pinkCircleView2,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
        circleMerge(pinkCircleView, with: pinkCircleView3,UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)))
    }
    
    
    let circleView1 = CircleView(frame: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
    let circleView2 = CircleView(frame: CGRect(x: 200.0, y: 200.0, width: 100.0, height: 100.0))
    let circleView3 = CircleView(frame: CGRect(x: 100.0, y: 300.0, width: 100.0, height: 100.0))
    let circleView4 = CircleView(frame: CGRect(x: 200.0, y: 400.0, width: 100.0, height: 100.0))
    
    @objc func circleViewMoving1(_ recognizer: UIPanGestureRecognizer){
        //circleMoving(recognizer, circleView1)
        circleMoving(recognizer)
        circleMerge(circleView2, with: circleView1,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView3, with: circleView1,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView4, with: circleView1,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
    }
    @objc func circleViewMoving2(_ recognizer: UIPanGestureRecognizer){
        //circleMoving(recognizer, circleView2)
        circleMoving(recognizer)
        circleMerge(circleView1, with: circleView2,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView3, with: circleView2,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView4, with: circleView2,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
    }
    @objc func circleViewMoving3(_ recognizer: UIPanGestureRecognizer){
        //circleMoving(recognizer, circleView3)
        circleMoving(recognizer)
        circleMerge(circleView1, with: circleView3,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView2, with: circleView3,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView4, with: circleView3,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
    }
    
    @objc func circleViewMoving4(_ recognizer: UIPanGestureRecognizer){
        //circleMoving(recognizer, circleView4)
        circleMoving(recognizer)
        circleMerge(circleView1, with: circleView4,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView2, with: circleView4,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
        circleMerge(circleView3, with: circleView4,UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1)))
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        circleInit(circleView1)
        circleInit(circleView2)
        circleInit(circleView3)
        circleInit(circleView4)
        view.addSubview(circleView1)
        view.addSubview(circleView2)
        view.addSubview(circleView3)
        view.addSubview(circleView4)
        let recognizer1 = UIPanGestureRecognizer(target: self,action: #selector(circleViewMoving1))
        let recognizer2 = UIPanGestureRecognizer(target: self,action: #selector(circleViewMoving2))
        let recognizer3 = UIPanGestureRecognizer(target: self,action: #selector(circleViewMoving3))
        let recognizer4 = UIPanGestureRecognizer(target: self,action: #selector(circleViewMoving4))
        circleView1.addGestureRecognizer(recognizer1)
        circleView2.addGestureRecognizer(recognizer2)
        circleView3.addGestureRecognizer(recognizer3)
        circleView4.addGestureRecognizer(recognizer4)
       
        
    }
    

    
}

