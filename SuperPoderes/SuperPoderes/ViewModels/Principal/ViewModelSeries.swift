//
//  viewModelSeries.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 30/3/23.
//

import Foundation
import Combine

final class ViewModelSeries: ObservableObject {
    @Published var hero: Heros
    @Published var series: [Serie] = []
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(hero: Heros, testing: Bool = false) {
        self.hero = hero
        if (testing) {
            self.getSeriesTest()
        } else {
            self.getHerosSerie()
        }
    }
    
    func getHerosSerie() {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHerosSeries(with: hero.id, sortBy: .startYear))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                //TODO OK
                return $0.data
            }
            .decode(type: Series.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = Status.error(error: "Error buscando series heroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    func getSeriesTest() {
//        let series1 = Serie(id: 145896, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
//        
//        let series2 = Serie(id: 145898, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
//        
//        let series3 = Serie(id: 145897, title: "Prueba Test Serie", description: "", resourceURI: "", urls: [], startYear: 3, endYear: 5, rating: "", type: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), creators: Creators(available: 5, collectionURI: "", items: [], returned: 9), characters: Characters(available: 2, collectionURI: "", items: [], returned: 5), stories: Stories(available: 1, collectionURI: "", items: [], returned: 3), comics: Characters(available: 2, collectionURI: "", items: [], returned: 4), events: Characters(available: 5, collectionURI: "", items: [], returned: 9))
//        
//        self.series = [series1, series2, series3]
    }
}

