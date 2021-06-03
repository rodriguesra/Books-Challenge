//
//  BookList.swift
//  Books Challenge
//
//  Created by Rafael Rodrigues on 03/06/21.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    ForEach(model.books) { book in
                        NavigationLink(destination: StagingView(book: book)) {
                            BookPreview(book: book)
                                .padding(.horizontal, 20.0)
                        }
                        
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(ViewModel())
    }
}
