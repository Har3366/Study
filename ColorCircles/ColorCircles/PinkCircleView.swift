
import UIKit

class PinkCircleView: UIView {
    let className = "PinkCircleView"
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


