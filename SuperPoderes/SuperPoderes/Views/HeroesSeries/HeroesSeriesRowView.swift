//
//  HeroesSeriesRowView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import SwiftUI

struct HeroesSeriesRowView: View {
    
    var serie: Serie
    
    var body: some View {
        VStack {
            
            Text(serie.title)
                .font(.title)
                .padding()
                .bold()
                .opacity(0.7)
                .id(0)
            
            AsyncImage(url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.thumbnailExtension)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .opacity(0.7)
                    .padding()
                    .id(1)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .opacity(0.7)
                    .padding()
            }
            if let description = serie.description {
                Text("\(description)")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
                    .id(2)
                
            } else {
                Text(NSLocalizedString("without_description", comment: ""))
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    struct HeroesSeriesRowView_Previews: PreviewProvider {
        static var previews: some View {
            HeroesSeriesRowView(serie: Serie(id: 1, title: "test", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/4ce59d3a80ff7", thumbnailExtension: .jpg)))
        }
    }
}
