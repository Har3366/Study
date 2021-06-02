import UIKit

class CircleView: UIView {
    @IBOutlet weak var circleView: UIView!
    var workingView:UIView!
    var xibName: String = "CircleView"    
    func getFromXib(){
        let viewFromXib = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?[0] as! UIView
        addSubview(viewFromXib)
    }
  
    override init(frame:CGRect) {
        super.init(frame: frame)
        getFromXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getFromXib()
    }
   
}

func circleInit (_ circleView: CircleView){
    circleView.backgroundColor = UIColor.systemYellow
    circleView.layer.cornerRadius = circleView.frame.height/2
}

func circleMoving (_ recognizer: UIPanGestureRecognizer,_ circleView: CircleView){
    let translation = recognizer.translation(in: UIView())
    let coordX = circleView.center.x+translation.x
    let coordY = circleView.center.y+translation.y
    circleView.center = CGPoint(x: coordX, y: coordY)
    recognizer.setTranslation(.zero, in: UIView())
    guard recognizer.state == .ended else {return}
}

func circleMerge(_ circle1:CircleView,with circle2:CircleView){
    if circle1.isHidden == true || circle2.isHidden == true {return}
    let mergedColor = UIColor(#colorLiteral(red: 0.5739061236, green: 0.6053475142, blue: 0.04792220145, alpha: 1))
    let circleFrame = circle2.frame
    let circle2width = circle1.frame.width >= circle2.frame.width ? circle1.frame.width + 40 : circle2.frame.width + 40
    let circle2height = circle1.frame.height >= circle2.frame.height ? circle1.frame.height + 40 : circle2.frame.height + 40
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




