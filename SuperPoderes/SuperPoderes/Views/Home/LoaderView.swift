//
//  LoaderView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 29/3/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView(label: {
            Text("Loading...")
                .id(0)
        })
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
