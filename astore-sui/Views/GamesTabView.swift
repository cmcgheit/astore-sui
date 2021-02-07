//
//  GamesTabView.swift
//  astore-sui
//

import SwiftUI

struct GamesTabView: View {
    
    @State var isAccountViewPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
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
            
            print(appGroup?.feed.results)
        }
    }
}


struct GamesTabView_Previews: PreviewProvider {
  static var previews: some View {
    GamesTabView()
  }
}
