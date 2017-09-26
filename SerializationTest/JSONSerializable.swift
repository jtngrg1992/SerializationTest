//
//  JsonRepresentable.swift
//  SerializationTest
//
//  Created by Jatin Garg on 26/09/17.
//  Copyright © 2017 Jatin Garg. All rights reserved.
//

import Foundation

protocol JSONRepresentable {
    var JSONRepresentation: Any{ get }
}

protocol JSONSerializable: JSONRepresentable {}

extension JSONSerializable{
    var JSONRepresentation: Any{
        var representation = [String:Any]()
        
        for case let (label?, value) in Mirror(reflecting: self).children{
            switch value{
            case let value as JSONRepresentable:
                representation[label] = value.JSONRepresentation
            case let value as NSArray:
                var temp = [Any]()
                for item in value{
                    if let jsonRepresentableItem = item as? JSONRepresentable {
                        temp.append(jsonRepresentableItem.JSONRepresentation)
                    }
                }
                representation[label] = temp
            case let value as NSObject:
                representation[label] = value
            default:
                //ignore un serializable types
                break
            }
        }
        return representation
    }
}

extension JSONSerializable{
    func toJSON()-> String?{
        let representation = JSONRepresentation
        guard JSONSerialization.isValidJSONObject(representation) else {
            return nil
        }
        
        do{
            let data = try JSONSerialization.data(withJSONObject: representation, options: [])
            return String(data: data, encoding: .utf8)
        }catch {
            return nil
        }
    }
}

extension Date: JSONRepresentable{
    var JSONRepresentation:Any{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return formatter.string(from: self)
    }
}



