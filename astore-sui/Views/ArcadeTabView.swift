//
//  ArcadeTabView.swift
//  astore-sui
//

import SwiftUI

struct ArcadeTabView: View {
  @State var isAccountViewPresented = false
  
  var body: some View {
    ScrollView {
      ArcadeHeader()
     
    }
    .edgesIgnoringSafeArea(.top)
  }
}


struct ArcadeTabView_Previews: PreviewProvider {
  static var previews: some View {
    ArcadeTabView()
  }
}
