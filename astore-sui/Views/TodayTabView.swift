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
            //            ForEach(Range(0...4)) { index in
            //                self.setupCurrentDate(by: index)
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
}

  func setupCurrentDate(by index: Int) -> AnyView {
    let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
    return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
  }


//struct TodayTabView_Previews: PreviewProvider {
//  static var previews: some View {
//    TodayTabView()
//  }
//}

var exampleItems = [
    FeedResult(name: "TikTok - Trends Start Here", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Purple114/v4/b0/24/77/b0247741-7213-2321-7474-447627e215bd/AppIcon_TikTok-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/200x200bb.png"),
    FeedResult(name: "ZOOM Cloud Meetings", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Purple114/v4/c4/05/97/c40597b4-ea60-d8ee-3fbf-832977bf43bc/AppIcon-0-0-1x_U007emarketing-0-0-0-9-0-85-220.png/200x200bb.png"),
    FeedResult(name: "YouTube: Watch, Listen, Stream", artworkUrl100: "https://is4-ssl.mzstatic.com/image/thumb/Purple124/v4/56/99/53/569953de-69b9-76b1-98bd-a25f99ccd8df/logo_youtube_color-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/200x200bb.png"),
    FeedResult(name: "Instagram", artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Purple114/v4/30/a3/ae/30a3aeb8-96c2-470e-b22c-8b722e09680d/Prod-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/200x200bb.png"),
    FeedResult(name: "Facebook", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple124/v4/ec/2f/a5/ec2fa5b7-db5c-2656-68f2-492cda200d6f/Icon-Production-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/200x200bb.png")

]
