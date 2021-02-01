//
//  SectionHeaderBlock.swift
//  astore-sui
//

import SwiftUI

struct SectionHeaderBlock: View {
  var title: String = "Title"
  
  var body: some View {
    VStack(alignment: .leading) {
      Divider()
      HStack {
        Text(title)
            .font(.title)
          .bold()
      }
    }
  }
}


struct SectionHeaderBlock_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeaderBlock()
  }
}
