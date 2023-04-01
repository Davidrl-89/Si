//
//  HeroesView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: ViewModelHeros
   
    var body: some View {
        
        NavigationStack {
            
            List {
                if let heros = viewModel.heros {
                    ForEach(heros) { hero in
                        NavigationLink {
                            //Detalle view
                            HeroesSeriesView(heroSerieViewModel: ViewModelSeries(hero: hero), hero: hero)
                        } label: {
                            HeroesRowView(hero: hero)
                        }
                    }
                }
            }
            .id(0)
            .navigationTitle(NSLocalizedString("title", comment: ""))

        }
    }
    
    struct HeroesView_Previews: PreviewProvider {
        static var previews: some View {
            HeroesView(viewModel: ViewModelHeros(testing: false))
        }
    }
}
