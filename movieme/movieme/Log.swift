//
//  Log.swift
//  movieme
//
//  Created by psycho on 12/19/16.
//  Copyright © 2016 movieme. All rights reserved.
//

func log(message: String, function: String = #function, file: String = #file) {
    print("\(file) \(function): \(message)")
}