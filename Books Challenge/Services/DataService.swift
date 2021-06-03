//
//  DataService.swift
//  Books Challenge
//
//  Created by Rafael Rodrigues on 02/06/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        
        let books = [Book]()
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            
            return books
            
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let books = try decoder.decode([Book].self, from: data)
                
                // Return the books
                return books
                
            }
            catch {
                // Error with parsing json
                print(error)
                
            }
        }
        catch {
            // Error with getting data
            print(error)
        }
        
        return books
    }
}
