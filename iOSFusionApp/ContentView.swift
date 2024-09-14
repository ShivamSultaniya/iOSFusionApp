//
//  ContentView.swift
//  iOSFusionApp
//
//  Created by Shivam Sultaniya on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false

    var body: some View {
        Group {
            if hasSeenOnboarding{
                TabView{
                    HomeView()
                        .tag(Tab.home)
                        .tabItem { Tab.home.tabContent }
                    Search()
                        .tag(Tab.search)
                        .tabItem { Tab.search.tabContent }
                    Portfolio()
                        .tag(Tab.portfolio)
                        .tabItem { Tab.portfolio.tabContent }
                }
            }
            
            else{
                IntroScreen()
            }
        }
    }
}

#Preview {
    ContentView()
}
