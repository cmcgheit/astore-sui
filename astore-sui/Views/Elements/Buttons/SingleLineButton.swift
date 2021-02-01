//
//  SingleLineButton.swift
//  astore-sui
//

import SwiftUI

struct SingleLineButton: View {
  @State var isPresented = false
  let title: String
  
  var body: some View {
    Button(action: {
        self.isPresented = true
    }) {
      Text(title)
    }
    .sheet(isPresented: self.$isPresented) {
        DefaultView(title: self.title)
    }
  }
}


struct SingleLineButton_Previews: PreviewProvider {
  static var previews: some View {
    SingleLineButton(isPresented: false, title: "GET")
      .previewLayout(.sizeThatFits)
  }
}
