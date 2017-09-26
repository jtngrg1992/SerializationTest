//
//  SampleModel.swift
//  SerializationTest
//
//  Created by Jatin Garg on 26/09/17.
//  Copyright © 2017 Jatin Garg. All rights reserved.
//

import Foundation

enum model: String {
    case honda = "honda"
    case maruti = "maruti"
}

extension model: JSONRepresentable{
    var JSONRepresentation: Any{
        return rawValue
    }
}
class Owner: JSONSerializable {
    var name: String?
    var date = Date()
    
    init(name: String?) {
        self.name = name
    }
}

class Car: JSONSerializable {
    var manufacturer: String
    var model: model
    var mileage: Float
    var owners: [Owner]
    
    init(manufacturer: String, model: model, mileage: Float, owners: [Owner]){
        self.manufacturer = manufacturer
        self.model = model
        self.mileage = mileage
        self.owners = owners
    }
    
    func printLabels(){
        let mirror = Mirror(reflecting: self).children
        for (label,value) in mirror{
            print(type(of: value))
        }
    }
}



