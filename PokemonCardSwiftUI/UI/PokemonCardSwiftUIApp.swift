//
//  PokemonCardSwiftUIApp.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

@main
struct PokemonCardSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("ホーム", systemImage: "house.fill")
                    }
                
                SearchView(viewModel: .init())
                    .tabItem {
                        Label("検索", systemImage: "magnifyingglass")
                    }
                
                NotifyView()
                    .tabItem {
                        Label("通知", systemImage: "bell.fill")
                    }
                
                SettingView()
                    .tabItem {
                        Label("設定", systemImage: "gearshape.fill")
                    }
            }
        }
    }
}
