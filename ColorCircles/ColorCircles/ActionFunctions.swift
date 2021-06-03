
import UIKit

func circleMoving(_ gesture:UIPanGestureRecognizer){
    guard let gestureView = gesture.view else {return}
    let translation = gesture.translation(in: UIView())
    let coordX = gestureView.center.x+translation.x
    let coordY = gestureView.center.y+translation.y
    gestureView.center = CGPoint(x: coordX, y: coordY)
    gesture.setTranslation(.zero, in: UIView())
    guard gesture.state == .ended else {return}
}

func circleMerge(_ circle1:UIView,with circle2:UIView,_ mergedColor:UIColor){
    if circle1.isHidden == true || circle2.isHidden == true {return}
    let circleFrame = circle2.frame
    let increaseValue: CGFloat = mergedColor == UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1)) ? 50 : 40
    let circle2width = circle1.frame.width >= circle2.frame.width ? circle1.frame.width + increaseValue : circle2.frame.width + increaseValue
    let circle2height = circle1.frame.height >= circle2.frame.height ? circle1.frame.height + increaseValue : circle2.frame.height + increaseValue
    for coordX in Int(circleFrame.minX) ... Int(circleFrame.maxX) {
        for coordY in Int(circleFrame.minY) ... Int(circleFrame.maxY){
            if coordY == Int(circle1.center.y) && coordX == Int(circle1.center.x) {
                circle1.isHidden = true
                
//                UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
//                    circle2.backgroundColor = mergedColor
//                    circle2.frame.size.width = circle2width
//                    circle2.frame.size.height = circle2height
//                    circle2.layer.cornerRadius = circle2.frame.height/2
//                    circle2.reloadInputViews()
//                }
                UIView.animateKeyframes(withDuration: 2, delay: 0, options:.calculationModeCubic) {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                        
                        circle2.bounds.size.width = circle2width
                        circle2.bounds.size.height = circle2height
                        circle2.layer.cornerRadius = circle2.frame.height/2
                        circle2.reloadInputViews()
                    }
                    UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
                        circle2.backgroundColor = mergedColor
                    }
                }


                
                
                
                
                
                
                
            }
        }
    }
}
