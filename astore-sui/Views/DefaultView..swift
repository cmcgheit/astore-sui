//
//  DefaultView..swift
//  astore-sui
//


import SwiftUI

struct DefaultView: View {
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
        NavigationView {
            
            Text(title)
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarItems(leading: DismissButton(title: "Cancel", presentationMode: _presentationMode))
            
        }
    }
}


struct DefaultView_Previews: PreviewProvider {
  static var previews: some View {
    DefaultView(title: "Default")
  }
}
