//
//  SuperPoderesApp.swift
//  SuperPoderes
//
//  Created by David Robles Lopez on 1/4/23.
//

import SwiftUI

@main
struct SuperPoderesApp: App {
    @StateObject var viewModel = ViewModelHeros()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(viewModel)
        }
    }
}
