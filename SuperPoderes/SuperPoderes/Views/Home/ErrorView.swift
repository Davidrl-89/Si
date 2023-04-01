//
//  ErrorView.swift
//  IOS Superpoderes
//
//  Created by David Robles Lopez on 1/4/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viemModel: ViewModelHeros
    
    private var textError:String
    
    init(error:String){
        self.textError = error
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
                .offset(x: 20) //ajuste maximo.
                .id(0)
            
            Text("\(textError)")
                .foregroundColor(.red)
                .font(.title)
                .id(1)
            
            Spacer()
            
            Button(NSLocalizedString("back", comment: "")) {
                self.viemModel.status = .none
            }
            .frame(width: 300, height: 50)
            .background(.orange)
            .font(.title2)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10.0, x:20, y: 10)
            .id(2)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error de prueba")
            .environmentObject(ViewModelHeros())
    }
}

