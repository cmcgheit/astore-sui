//
//  Service.swift
//  astore-sui
//

import Foundation

class Service {
    
    static let shared = Service() // singleton
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            // success
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume() // fires off the request
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        
        // make custom url here https://rss.itunes.apple.com/en-us
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                // success
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
            }
            
            
        }.resume()
    }
    
    
    func fetchAppsWeLove(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach({print($0.name)})
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}

