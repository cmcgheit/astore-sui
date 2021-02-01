//
//  AppsTabView.swift
//  astore-sui
//


import SwiftUI

struct AppsTabView: View {
  @State var isAccountViewPresented = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        
      }
      .navigationBarTitle("Apps")
      .navigationBarItems(trailing: AccountButton(isAccountViewPresented: $isAccountViewPresented))
    }
  }
}


struct AppsTabView_Previews: PreviewProvider {
  static var previews: some View {
    AppsTabView()
  }
}
