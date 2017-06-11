//
//  Validators.swift
//  StudenTime
//
//  Created by Yoel Lev on 6/4/17.
//  Copyright © 2017 YoelL. All rights reserved.
//

import UIKit

//Verifies if the sequence is a valid Israeli ID
func isValidID(_ id:String)-> Bool{
    
    var digit:Int
    var sum = 0
    var num = Int(id)
    var checkDigit:Int!
    
    
    if id.characters.count != 9 {
        return false
        
    }else{
        
        for i in 0...id.characters.count {
            
            digit = num! % 10
            if i % 2 != 0 {
                digit *= 2
            }
            sum += digit % 10 + digit / 10
            num = num! / 10
        }
        
        checkDigit = ( 1 + sum / 10) * 10 - sum
        
        checkDigit = checkDigit % 10
        
    }
    
    //if Id is good
    if checkDigit == 0 {
        print("The ID :  \(id ) is a Valid ID")
        
        return true
    }
    print("The ID :  \(id ) is not Valid")
    return false
}

func isValidEmail(_ email: String) -> Bool {
    
    let emailValid = email.characters.count > 0 && NSPredicate(format: "self matches %@", "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}").evaluate(with: email)
    return emailValid
}


func isValidPassword(_ password: String) -> Bool {
    
    let aPassword = password.characters.count > 4 && password.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
    return aPassword
}


func isValidName(_ name:String)->Bool{
    
    let nameValid = (name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count > 0)
    return nameValid
}

