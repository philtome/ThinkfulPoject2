//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

class Shape: UIView {
    var color:UIColor
    init(color:UIColor) {
        self.color = color
        super.init(frame: CGRectZero)
        self.backgroundColor = color // Note that backgroundColor is a property inherited from UIView
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func getArea() -> Double {
        return 0
    }
}


class Square: Shape {
    var width:Int
    init(width:Int, color:UIColor) {
        self.width = width
        super.init(color: color)
        self.frame.size = CGSize(width: width, height: width)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(width * width))
    }
}

class Circle: Shape {
    var radius:Int
    init(radius:Int, color:UIColor) {
        self.radius = radius
        super.init(color: color)
        self.frame.size = CGSize(width: radius * 2, height: radius * 2)
        self.layer.cornerRadius = CGFloat(radius)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(M_PI * Double(radius * radius)))
    }
}

class Rectangle: Shape {
    var width:Int
    var heigth:Int
    init(width:Int, heigth:Int, color:UIColor) {
        self.width = width  // rectangle sets width
        self.heigth = heigth // rectangle heigth
        super.init(color: color)  // check super class
        self.frame.size = CGSize(width: width, height: width)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(heigth * width))
    }
}

class RoundedRectangle: Shape {
    var width:Int
    var heigth:Int
    var radius:Int
    init(width:Int, heigth:Int, radius:Int, color:UIColor) {
        self.width = width  // rectangle sets width
        self.heigth = heigth // rectangle heigth
        self.radius = radius
        super.init(color: color)  // check super class
        self.frame.size = CGSize(width: width, height: width)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func getArea() -> Double {
        return(Double(heigth * width))
    }
}


var circle = Circle(radius: 50, color: UIColor.blueColor())
var square = Square(width: 100, color: UIColor.redColor())
var rectangle = Rectangle(width: 200, heigth: 50, color: UIColor.greenColor())
var rounded = RoundedRectangle(width: 75, heigth: 200, radius: 25, color: UIColor.grayColor())

circle.center = CGPoint(x: 50, y: 100)
square.center = CGPoint(x: 150, y: 200)
//rectangle.center = CGPoint(x: 50    , y: 300)
rounded.center = CGPoint(x:100, y:200)



let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
XCPShowView("Shapes!", view)

view.addSubview(circle)
view.addSubview(square)
//view.addSubview(rectangle)
view.addSubview(rounded)

