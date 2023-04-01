//
//  RootView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 29/3/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var viewmodel: viewModelHeros
    
    var body: some View {
        switch viewmodel.status {
        case .none:
            Text("none status")
        case .loading:
            LoaderView()
        case .loaded:
            HeroesView(viewModel: viewmodel)
        case .error(error: let errorString):
            ErrorView(error: errorString)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(viewModelHeros())
    }
}
