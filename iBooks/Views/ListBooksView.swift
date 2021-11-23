import SwiftUI

struct ListBooksView: View {
    
    // MARK: - Variables
    @ObservedObject var listBooks = ViewModel()
    
    // MARK: - Init
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    // MARK: - View
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    List(listBooks.books, id: \.id) { book in
                        NavigationLink {
                            BookDetailView(book: book)
                        } label: {
                            BookRowView(book: book)
                        }
                    }.task {
                        await listBooks.loadData()
                    }.refreshable {
                        await listBooks.refreshData()
                    }
                }
                
            }
            .navigationTitle("iBooks")
        }
    }
}

struct ListBooks_Previews: PreviewProvider {
    static var previews: some View {
        ListBooksView()
    }
}
