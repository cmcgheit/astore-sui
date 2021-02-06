//
//  Service.swift
//  astore-sui
//

import Foundation

class Service {
    
    static let shared = Service()
    
    // generics better here right :)
    // https://rss.itunes.apple.com/en-us
    
    func searchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes apps from Service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume()
    }
    
    func fetchTopGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let topGamesURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: topGamesURL) { data, resp, err in
            
            if let err = err {
                completion(nil, err)
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
    
    func fetchTopFreeApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let freeAppsURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: freeAppsURL) { data, resp, err in
            
            if let err = err {
                completion(nil, err)
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
    
    func fetchTopGrossingApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let topGrossingURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: topGrossingURL) { data, resp, err in
            
            if let err = err {
                completion(nil, err)
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
    
    func fetchAppsWeLove(completion: @escaping (AppGroup?, Error?) -> ()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json ") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            
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

