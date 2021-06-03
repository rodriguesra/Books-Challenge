//
//  Books_ChallengeApp.swift
//  Books Challenge
//
//  Created by Rafael Rodrigues on 02/06/21.
//

import SwiftUI

@main
struct Books_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(ViewModel())
        }
    }
}
