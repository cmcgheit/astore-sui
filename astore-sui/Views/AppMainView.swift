//
//  AppMainView.swift
//  astore-sui
//

import SwiftUI

struct AppMainView: View {
    @Namespace var animation
    @StateObject var detailObject = DetailViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                TodayTabView(animation: animation)
                    .environmentObject(detailObject)
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
            }.opacity(detailObject.show ? 0 : 1) // nav bar hide/show
            
            if detailObject.show {
                
                DetailView(detail: detailObject, animation: animation)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct AppMainView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppMainView()
    }
}
