//
//  TodayTabView.swift
//  astore-sui
//

import SwiftUI

struct TodayTabView: View {
    var animation: Namespace.ID
    @EnvironmentObject var detail: DetailViewModel
    
    var body: some View {
        ScrollView {
            ForEach(Range(0...4)) { index in
                self.setupCurrentDate(by: index)
                
                ForEach(exampleItems){ item in
                    if detail.show {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    else {
                        
                        CardView(cardItem: item, animation: animation)
                            .padding(.horizontal)
                            .padding(.top)
                            .onTapGesture {
                                
                                withAnimation(.spring()) {
                                    
                                    detail.selectedItem = item
                                    detail.show.toggle()
                                }
                            }
                    }
                }
            }
            .padding(.bottom)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea()) // for cards to be defined
    }
    
    func setupCurrentDate(by index: Int) -> AnyView {
        let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
        return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
    }
}


//struct TodayTabView_Previews: PreviewProvider {
//  static var previews: some View {
//    TodayTabView()
//  }
//}

