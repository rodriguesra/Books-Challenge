//
//  StagingView.swift
//  Books Challenge
//
//  Created by Rafael Rodrigues on 02/06/21.
//

import SwiftUI

struct StagingView: View {
    
    @EnvironmentObject var model: ViewModel
    @State private var rating = 2
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 20.0) {
            NavigationLink(
                destination: BookContent(book: book),
                label: {
                    VStack {
                        Text("Read Now!")
                            .font(.title)
                            .accentColor(.black)
                        
                        Image("cover\(book.id)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                })
            
            Text("Mark for later!")
                .font(.headline)
            
            Button(action: {model.updateFavourite(forId: book.id)}, label: {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            })
            .accentColor(.yellow)
            
            Spacer()
            
            Text("Rate \(book.title)")
                .font(.headline)
            
            Picker("Rate this book!", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)")
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.leading, .bottom, .trailing], 60.0)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
        }
        .onAppear { rating = book.rating }
        .navigationBarTitle("\(book.title)")
    }
}

struct StagingView_Previews: PreviewProvider {
    static var previews: some View {
        
        StagingView(book: Book())
            .environmentObject(ViewModel())
    }
}
