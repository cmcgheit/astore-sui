//
//  Made with ❤ and ☕ 
//

import SwiftUI

struct CardView: View {
    var cardItem: FeedResult
    // getting Current Scheme Color
    @Environment(\.colorScheme) var color
    var animation: Namespace.ID
    
    var body: some View {
        
        VStack{
            
            Image(cardItem.artworkUrl100)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image" + cardItem.id, in: animation)
                .frame(width: UIScreen.main.bounds.width - 30)
            
            HStack{
                
//                Image(cardItem.)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 65, height: 65)
//                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(cardItem.artistName)
                        .fontWeight(.bold)
                    
                    Text(cardItem.name)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                VStack{
                    
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
}
