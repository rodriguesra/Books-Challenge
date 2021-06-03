//
//  LibraryModel.swift
//  Books Challenge
//
//  Created by Rafael Rodrigues on 02/06/21.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        self.books = DataService.getLocalData()
    }
    
    /// Update the specified book's rating. Does nothing if `forId` is invalid.
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    /// Update the specified book's favourite status. Does nothing if `forId` is invalid.
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    /// Update the specified book's current page. Does nothing if `forId` is invalid.
    func updatePage(forId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
}
