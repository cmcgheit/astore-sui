//
//  Made with ❤ and ☕ 
//

import SwiftUI

class DetailViewModel: ObservableObject {

    @Published var selectedItem = FeedResult(name: "", artistName: "", artworkUrl100: "")
    
    @Published var show = false
}
