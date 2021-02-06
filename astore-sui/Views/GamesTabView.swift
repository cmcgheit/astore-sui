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
                
            }
            .navigationBarTitle("Games")
            .navigationBarItems(trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    fileprivate func fetchGamesData() {
        print("Fetching new JSON DATA somehow...")
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
