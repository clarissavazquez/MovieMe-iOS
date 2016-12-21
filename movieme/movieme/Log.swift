/** 
 *  Log.swift
 *
 *  blah blah blah
 */

func log(message: String, function: String = #function, file: String = #file) {
    print("\(file) \(function): \(message)")
}