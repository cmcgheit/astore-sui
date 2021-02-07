//
//  Made with ❤ and ☕ 
//

import SwiftUI

class DetailViewModel: ObservableObject {
    // handles selection of item from card view to detail
    
    @Published var selectedItem = FeedResult(name: "", artworkUrl100: "")
    
    @Published var show = false
}
