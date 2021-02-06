//
//  TodayTabView.swift
//  astore-sui
//

import SwiftUI

struct TodayTabView: View {
  
    var body: some View {
        ScrollView {
            ForEach(Range(0...4)) { index in
                self.setupCurrentDate(by: index)
            }
        }
    }

  func setupCurrentDate(by index: Int) -> AnyView {
    let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
    return index == 0 ? AnyView(NavigationViewHeaderWithImageBlock(date: date!)) : AnyView(NavigationViewHeaderBlock(date: date!))
  }
    
    fileprivate func fetchTopFreeAppsData() {
        print("Fetching new JSON DATA somehow...")
        Service.shared.fetchTopFreeApps { (appGroup, err) in
        
            if let err = err {
                print("Failed to fetch  top free apps:", err)
                return
            }
            
            print(appGroup?.feed.results)
        }
    }
}

struct TodayTabView_Previews: PreviewProvider {
  static var previews: some View {
    TodayTabView()
  }
}

//var exampleItems = [
//
//    
//]
