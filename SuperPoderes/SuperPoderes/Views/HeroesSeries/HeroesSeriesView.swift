//
//  HeroesSeriesView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import SwiftUI

struct HeroesSeriesView: View {
    
    @StateObject var heroSerieViewModel: viewModelSeries
    var hero: Heros?
    
    var body: some View {
        NavigationStack {
            List {
                if let heroSeries =
                    heroSerieViewModel.series {
                    ForEach(heroSeries) { serie in
                        HeroesSeriesRowView(serie: serie)
                    }
                }
            }
            .id(0)
        }
    }
}

struct HeroesSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesSeriesView(heroSerieViewModel:viewModelSeries(hero: Heros(id: 45, name: "prueba vista", description: "prueba descripción", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 2, collectionURI: "", items: [], returned: 7), series: Comics(available: 2, collectionURI: "", items: [], returned: 9), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), events: Comics(available: 4, collectionURI: "", items: [], returned: 6), urls: []), testing: true))
            .environmentObject(viewModelHeros(testing: true))
    }
}

