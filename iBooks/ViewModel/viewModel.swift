//
//  viewModel.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    //  MARK: - Variables
    @Published var books = [Item]()
    
    //  MARK: - Functions
    func refreshData() async {
        books.removeAll()
        await loadData()
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=marvel") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode(Welcome.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.books.append(contentsOf: decoder.items)
                })
            }
        } catch {
            print("Invalid data")
        }
    }
    
}
