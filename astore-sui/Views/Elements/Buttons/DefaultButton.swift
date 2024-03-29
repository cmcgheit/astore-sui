//
//  DefaultButton.swift
//  astore-sui
//

import SwiftUI

struct DefaultButton: View {
  @Environment (\.colorScheme) var colorScheme:ColorScheme
  @State var isPresented = false
  let title: String
  
  var body: some View {
    Button(action: {
        self.isPresented = true
    }) {
      Text(title)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .foregroundColor(colorScheme == .light ? .blue : .white)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
    .sheet(isPresented: self.$isPresented) {
        DefaultView(title: self.title)
    }
  }
}
  
  
struct DefaultButtonView_Previews: PreviewProvider {
  static var previews: some View {
    DefaultButton(title: "Title")
  }
}

