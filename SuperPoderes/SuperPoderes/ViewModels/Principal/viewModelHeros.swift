//
//  viewModelHeros.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import Foundation
import Combine

final class viewModelHeros: ObservableObject {
    @Published var heros: [Heros]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    
    init(testing: Bool = false) {
        if (testing){
            getHerosTesting()
        } else{
            getHeros(sortBy: .formerModified)
        }
    }
    
    func getHeros(sortBy order: OrderBy) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeros(sortBy: .formerModified))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                //TODO OK
                return $0.data
            }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error buscando heroes")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
                self.heros = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    //For UI Desing
    func getHerosTesting() {
        let hero1 = Heros(id: 0001, name: "David", description: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [], returned: 12), series: Comics(available: 12, collectionURI: "", items: [], returned: 12), stories: Stories(available: 12, collectionURI: "", items: [], returned: 12), events: Comics(available: 12, collectionURI: "", items: [], returned: 2), urls: [])
        
        let hero2 = Heros(id: 0001, name: "Jose", description: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 1, collectionURI: "", items: [], returned: 12), series: Comics(available: 12, collectionURI: "", items: [], returned: 12), stories: Stories(available: 12, collectionURI: "", items: [], returned: 12), events: Comics(available: 12, collectionURI: "", items: [], returned: 2), urls: [])
        
        self.heros = [hero1, hero2]
    }
}
