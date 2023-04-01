//
//  Status.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 28/3/23.
//

import Foundation

//Mis estados de la navegacion Principal
enum Status {
    case none, loading, loaded, error(error: String)
}
