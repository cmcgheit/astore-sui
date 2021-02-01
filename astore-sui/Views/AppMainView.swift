//
//  AppMainView.swift
//  astore-sui
//

import SwiftUI

struct AppMainView: View {
    
    var body: some View {
        TabView {
            TodayTabView()
                .tabItem {
                    Image(systemName: "note")
                    Text("Today")
                }

            GamesTabView()
                .tabItem {
                    Image(systemName: "keyboard")
                    Text("Games")
                }
            
            AppsTabView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Apps")
                }
            
            ArcadeTabView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Arcade")
                }
            
            SearchTabView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
    
    fileprivate func fetchAppsData() {
        print("Fetching new JSON DATA somehow...")
        Service.shared.fetchAppsWeLove { (appGroup, err) in
            if let err = err {
                print("Failed to fetch games:", err)
                return
            }
            
            print(appGroup?.feed.results)
        }
    }
}


struct AppMainView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppMainView()
    }
}
