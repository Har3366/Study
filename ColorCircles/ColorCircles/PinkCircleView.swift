
import UIKit

class PinkCircleView: UIView {

    func setView() {
        layer.cornerRadius = frame.height/2
        backgroundColor = .systemPink
    }
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setView()
    }
    
}

func pinkCircleMoving(_ gesture:UIPanGestureRecognizer){
    guard let gestureView = gesture.view else {return}
    let translation = gesture.translation(in: UIView())
    let coordX = gestureView.center.x+translation.x
    let coordY = gestureView.center.y+translation.y
    gestureView.center = CGPoint(x: coordX, y: coordY)
    gesture.setTranslation(.zero, in: UIView())
    guard gesture.state == .ended else {return}
}

func pinkCircleMerge(_ circle1:PinkCircleView,with circle2:PinkCircleView){
    if circle1.isHidden == true || circle2.isHidden == true {return}
    let mergedColor = UIColor(#colorLiteral(red: 0.6035447121, green: 0, blue: 0.2712310255, alpha: 1))
    let circleFrame = circle2.frame
    let circle2width = circle1.frame.width >= circle2.frame.width ? circle1.frame.width + 50 : circle2.frame.width + 50
    let circle2height = circle1.frame.height >= circle2.frame.height ? circle1.frame.height + 50 : circle2.frame.height + 50
    for coordX in Int(circleFrame.minX) ... Int(circleFrame.maxX) {
        for coordY in Int(circleFrame.minY) ... Int(circleFrame.maxY){
            if coordY == Int(circle1.center.y) && coordX == Int(circle1.center.x) {
                circle1.isHidden = true
                circle2.backgroundColor = mergedColor
                circle2.frame.size.width = circle2width
                circle2.frame.size.height = circle2height
                circle2.layer.cornerRadius = circle2.frame.height/2
                circle2.reloadInputViews()
            }
        }
    }
}

