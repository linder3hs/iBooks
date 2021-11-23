//
//  viewModel.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var books = [Item]()
        
    func loadData() async {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=marvel") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode(Welcome.self, from: data) {
                self.books = decoder.items
            }
        } catch {
            print("Invalid data")
        }
        
        
    }
    
}
