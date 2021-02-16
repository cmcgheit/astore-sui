//
//  Made with ❤ and ☕ 
//

import SwiftUI

struct CardView: View {
    var cardItem: FeedResult
    
    @Environment(\.colorScheme) var color
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack {
        
            RemoteImage(url: cardItem.artworkUrl100)
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image" + cardItem.id, in: animation)
                .frame(width: UIScreen.main.bounds.width - 30)
                
            HStack {
                                
                VStack(alignment: .leading, spacing: 6) {
                    
                    RemoteImage(url: cardItem.artworkUrl100)
                        .frame(width: 65, height: 65)
                        .cornerRadius(15)
                        
                    
                    Text(cardItem.name)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    
                    Button(action: {}) {
                        
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                    }
                    
                    Text("In App Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .matchedGeometryEffect(id: "content" + cardItem.id, in: animation)
            .padding()
        }
        .frame(height: 320)
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
    }
    
    fileprivate func fetchTopFreeAppsData() {
        Service.shared.fetchTopFreeApps { (appGroup, err) in
        
            if let err = err {
                print("Failed to fetch  top free apps:", err)
                return
            }
            
            print(appGroup?.feed.results)
        }
    }
}
