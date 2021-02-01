//
//  SearchTabView.swift
//  astore-sui
//

import SwiftUI

struct SearchTabView: View {
  @State var isAccountViewPresented = false
  @State var text: String = ""
  
  var body: some View {
    NavigationView {
      ScrollView {
        CustomSearchBar(text: $text)
       
        Spacer()
        
      }
      .navigationBarTitle("Search")
      .navigationBarItems(leading: SearchBar(text: $text), trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}


struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}

