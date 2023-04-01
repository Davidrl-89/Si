//
//  HeroesView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: viewModelHeros
   
    var body: some View {
        
        NavigationStack {
            
            List {
                if let heros = viewModel.heros {
                    ForEach(heros) { hero in
                        NavigationLink {
                            //Detalle view
                            HeroesSeriesView(heroSerieViewModel: viewModelSeries(hero: hero), hero: hero)
                        } label: {
                            HeroesRowView(hero: hero)
                        }
                    }
                }
            }
            .id(0)
            .navigationTitle("Marvel")

        }
    }
    
    struct HeroesView_Previews: PreviewProvider {
        static var previews: some View {
            HeroesView(viewModel: viewModelHeros(testing: false))
        }
    }
}
