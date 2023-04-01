//
//  HeroesRowView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import SwiftUI

struct HeroesRowView: View {
    
    var hero: Heros
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: "\(hero.thumbnail.path).\(hero.thumbnail.thumbnailExtension)")) {Image in
                Image
                    .resizable()
                    .frame(width:300 ,height: 300)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .id(0)
            } placeholder: {
                Image(systemName: "person")
            }
            
            Text(hero.name)
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .id(1)
        }
    }
}


struct HeroesRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowView(hero: Heros(id: 95865, name: "Outlaw (Inez Temple)", description: "", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: .jpg), resourceURI: "", comics: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), series: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: "")], returned: 2), stories: Stories(available: 1, collectionURI: "", items: [StoriesItem(resourceURI: "", name: " ", type: .cover)], returned: 1), events: Comics(available: 2, collectionURI: "", items: [ComicsItem(resourceURI: "", name: ""),ComicsItem(resourceURI: "", name: " ")], returned: 2), urls: [URLElement(type: .detail, url: "")]))
    }
}
