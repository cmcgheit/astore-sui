//
//  ItemDetailsLabel.swift
//  astore-sui
//

import SwiftUI

struct ItemDetailsLabel: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .foregroundColor(.secondary)
  }
}


struct ItemDetailsLabel_Previews: PreviewProvider {
  static var previews: some View {
    ItemDetailsLabel(text: "Details")
  }
}
