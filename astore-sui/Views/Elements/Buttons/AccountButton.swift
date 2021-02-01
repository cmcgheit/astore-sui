//
//  AccountButton.swift
//  astore-sui
//

import SwiftUI

struct AccountButton: View {
  @Binding var isAccountViewPresented: Bool
  
  var body: some View {
    Button(action: {
        self.isAccountViewPresented = true
    }) {
      Image(systemName: "person.circle.fill")
        .foregroundColor(.secondary)
        .font(.title)
        .clipShape(Circle())
    }
    .sheet(isPresented: self.$isAccountViewPresented) {
      AccountView()
    }
  }
}
