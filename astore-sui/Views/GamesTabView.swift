//
//  GamesTabView.swift
//  astore-sui
//

import SwiftUI

struct GamesTabView: View {
    
    @State var isAccountViewPresented = false
    @State private var topGamesFeed = [FeedResult]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(topGamesFeed, id: \.id) { games in
                    
//                    CardView(cardItem: games, animation: animation)
//                        .padding(.horizontal)
//                        .padding(.top)
                }
            }.onAppear(perform: {
                fetchGamesData()
            })
            .navigationBarTitle("Games")
            .navigationBarItems(trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    fileprivate func fetchGamesData() {
        Service.shared.fetchTopGames { (appGroup, err) in
            if let err = err {
                print("Failed to fetch games:", err)
                return
            }
            topGamesFeed = Service.shared.appArray
        }
    }
}


struct GamesTabView_Previews: PreviewProvider {
  static var previews: some View {
    GamesTabView()
  }
}
