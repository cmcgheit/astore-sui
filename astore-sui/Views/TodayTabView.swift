//
//  TodayTabView.swift
//  astore-sui
//

import SwiftUI

struct TodayTabView: View {
    var animation: Namespace.ID
    @EnvironmentObject var detail: DetailViewModel
    @State private var topAppsFeed = [FeedResult]()
    
    var body: some View {
        ScrollView {
            
            ForEach(Range(0...4)) { index in
                self.setupCurrentDate(by: index)
                
                ForEach(topAppsFeed, id: \.id) { apps in //exampleItems
                    if detail.show {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal)
                            .padding(.top)
                    }
                    else {
                        
                        CardView(cardItem: apps, animation: animation)
                            .padding(.horizontal)
                            .padding(.top)
                            .onTapGesture {
                                
                                withAnimation(.spring()) {
                                    
                                    detail.selectedItem = apps
                                    detail.show.toggle()
                                }
                            }
                    }
                }
            }
            .padding(.bottom)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea()) // for cards to be defined
        .onAppear(perform: {
            self.fetchTopApps()
        })
    }
    
    func setupCurrentDate(by index: Int) -> AnyView {
        let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
        return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
    }
    
    func fetchTopApps() {
        Service.shared.fetchTopFreeApps { topApps, err in
            
            if let err = err {
                print("Failed to top free app:", err)
                return
            }
            
            topAppsFeed = Service.shared.appArray
        }
    }
}


//struct TodayTabView_Previews: PreviewProvider {
//  static var previews: some View {
//    TodayTabView()
//  }
//}

