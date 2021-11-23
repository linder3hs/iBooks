import SwiftUI

struct ListBooksView: View {
    
    @ObservedObject var listBooks = ViewModel()
    
    @State var books = [Item]()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
//                    Text("iBooks").font(.system(size: 21, weight: .bold)).foregroundColor(.black)
                    List(books, id: \.id) { book in
                        NavigationLink {
                            BookDetailView(book: book)
                        } label: {
                            BookRowView(book: book)
                        }
                    }.task {
                        await listBooks.loadData()
                        books.append(contentsOf: listBooks.books)
                    }.refreshable {
                        books.removeAll()
                        await listBooks.loadData()
                        books.append(contentsOf: listBooks.books)
                    }
                }
                
            }
            .navigationTitle("iBooks")
//            .navigationBarHidden(true)
            
        }
    }
}

struct ListBooks_Previews: PreviewProvider {
    static var previews: some View {
        ListBooksView()
    }
}
