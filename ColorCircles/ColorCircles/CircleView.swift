import UIKit

class CircleView: UIView {
    @IBOutlet weak var circleView: UIView!
    var workingView:UIView!
    var xibName: String = "CircleView"
    let className = "CircleView"
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




