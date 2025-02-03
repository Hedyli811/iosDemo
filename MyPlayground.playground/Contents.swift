import UIKit

var greeting = "Hello, playground"

protocol Drivable{
    func start()
    func stop()
}
//base class
class Vehicle{
    let brand:String
    var speed: Int
    
    init(brand:String, spped:Int = 0){
        self.brand = brand
        self.speed = speed
    }
    func honk(){
        print("\(brand): beep ")
    }
}

//inherits from vehicle and conform to drivable

class Car: Vehicle,Drivable{
    var isRunning :Bool = false
    func start(){
        isRunning = true
        print("\(brand) is now running")
    }
    func stop(){
        isRunning = false
        print("\(brand) is stop")
    }
}

let myCar = Car(brand: "tesla")
myCar.honk()
myCar.start()
myCar.stop()

