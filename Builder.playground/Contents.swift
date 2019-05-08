import UIKit

protocol Builder {
    func setEngineInCar(type: TypeOfCar)
    func setCarName(type: TypeOfCar)
    func setCarMaxSpeed(type: TypeOfCar)
    func printCarInfo()
}

class Car {
    private var carDetails = ""
    
    func setCarDetails(detail: String) {
        carDetails = carDetails + detail
    }
    
    func printCarInformation() {
        print(carDetails)
    }
}

enum TypeOfCar{
    case beach
    case reach
    case prototype
}

class CarBuilder: Builder {
    
    private var product = Car()
    
    func setEngineInCar(type: TypeOfCar) {
        switch type {
        case .beach:
            product.setCarDetails(detail: " 1.5 atmo ")
        case .reach:
            product.setCarDetails(detail: " V8 bi turbo ")
        default:
            fatalError()
        }
    }
    
    func setCarName(type: TypeOfCar) {
        switch type {
        case .beach:
            product.setCarDetails(detail: " VAZ 2108 ")
        case .reach:
            product.setCarDetails(detail: " RR Sport ")
        default:
            fatalError()
        }
    }
    
    func setCarMaxSpeed(type: TypeOfCar) {
        switch type {
        case .beach:
            product.setCarDetails(detail: " max speed 160 ")
        case .reach:
            product.setCarDetails(detail: " max speed 280 ")
        default:
            fatalError()
        }
    }
    
    func printCarInfo() {
        product.printCarInformation()
        product = Car()
        //should be return product
    }
}

class Director {
    private var builder: Builder?
    
    func setBuilder(builder: Builder) {
        self.builder = builder
    }
    
    func createNewCar(type: TypeOfCar) {
        builder?.setCarName(type: type)
        builder?.setCarMaxSpeed(type: type)
        builder?.setEngineInCar(type: type)
        builder?.printCarInfo()
    }
}

let director = Director()
let carBuilder = CarBuilder()
director.setBuilder(builder: carBuilder)
director.createNewCar(type: .beach)
director.createNewCar(type: .reach)


