//
//  BaseNetwork.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import Foundation

let server = "https://gateway.marvel.com"

struct HTTPMethods {
    static let get = "GET"
    static let content = "application/json"
}

enum endpoints: String {
    case herosList = "/v1/public/characters"
    case herosSeries = "/series"
}

enum auth: String {
    case ts = "1"
    case apikey = "8f51a9862c502e8fe4c2afc233a5f52e"
    case hash = "ba5deceee6018c9a89168def0068021d"
}

enum OrderBy: String {
    case formerModified = "-modified"
    case startYear = "startYear"
}

struct BaseNetwork {
    
    // Lista de heroes
    func getSessionHeros(sortBy orderMethod: OrderBy) -> URLRequest {
        
        let accessAuth = "?ts=\(auth.ts.rawValue)&apikey=\(auth.apikey.rawValue)&hash=\(auth.hash.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlcad: String = "\(server)\(endpoints.herosList.rawValue)\(accessAuth)\(sortBy)"
        let url = URL(string: urlcad)
        
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    // Lista de series
    func getSessionHerosSeries(with heroId: Int, sortBy orderMethod: OrderBy) -> URLRequest {
        
        let accessAuth = "?ts=\(auth.ts.rawValue)&apikey=\(auth.apikey.rawValue)&hash=\(auth.hash.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlcad: String = "\(server)\(endpoints.herosList.rawValue)/\(heroId)\(endpoints.herosSeries.rawValue)\(accessAuth)\(sortBy)"
        let url = URL(string: urlcad)
        
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}
