//
//  ContentView.swift
//  Shared
//
//  Created by Ivan Kvasov on 06.05.2021.
//


import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            
            newTextField()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
