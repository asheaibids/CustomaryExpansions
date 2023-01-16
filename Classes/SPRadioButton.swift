//
//  SPRadtioButton.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
//test
@IBDesignable
public class SPRadioButton: UIButton {

    @IBInspectable
    var gap:CGFloat = 6 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var gapColor: UIColor = UIColor(hex: "9397A0") { //light grey
        didSet{
            self.setNeedsDisplay()
        }
    }

    @IBInspectable
    var btnColor: UIColor = UIColor(hex: "9397A0") { //light grey
        didSet{
            self.setNeedsDisplay()
        }
    }

    @IBInspectable
    var isOn: Bool = true{
        didSet{
            self.setNeedsDisplay()
        }
    }

    public override func draw(_ rect: CGRect) {
        self.contentMode = .scaleAspectFill
        drawCircles(rect: rect)
    }


    //MARK:- Draw inner and outer circles
    func drawCircles(rect: CGRect){
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.lineWidth = 3
        circleLayer.strokeColor = btnColor.cgColor
        circleLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(circleLayer)
        
        if isOn {
            let innerCircleLayer = CAShapeLayer()
            let rectForInnerCircle = CGRect(x: gap, y: gap, width: rect.width - 2 * gap, height: rect.height - 2 * gap)
            innerCircleLayer.path = UIBezierPath(ovalIn: rectForInnerCircle).cgPath
            innerCircleLayer.fillColor = gapColor.cgColor
            layer.addSublayer(innerCircleLayer)
        }
        self.layer.shouldRasterize =  true
        self.layer.rasterizationScale = UIScreen.main.nativeScale
    }

    /*
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     isOn = !isOn
     self.setNeedsDisplay()
     }
     */

    public override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        isOn = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isOn = !isOn
            setNeedsDisplay()
        }
    }
}
