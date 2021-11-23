//
//  ContentView.swift
//  iBooks
//
//  Created by Linder Hassinger on 19/11/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - View
    var body: some View {
        
        TabView {
            ListBooksView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProfileView()
                .font(.system(size: 30, weight: .bold))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }.accentColor(Color("TabBarColor"))
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
