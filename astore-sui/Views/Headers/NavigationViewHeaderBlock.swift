//
//  NavigationViewHeaderBlock.swift
//  astore-sui
//

import SwiftUI

struct NavigationViewHeaderBlock: View {
  @State var isAccountViewPresented = false
  let date: Date
  
  var body: some View {
    VStack {
      Text(date.toFullDateFormat())
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
        .foregroundColor(.secondary)
      
      HStack {
        Text(date.toWeekDayFormat())
          .font(.title)
          .bold()
          .padding(.leading)
        
        Spacer()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.top, 32)
  }
}


struct NavigationViewHeaderBlock_Previews: PreviewProvider {
  static var previews: some View {
    NavigationViewHeaderBlock(date: Date())
  }
}
