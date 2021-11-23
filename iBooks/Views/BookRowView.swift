//
//  BoookRow.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import SwiftUI

struct BookRowView: View {
    
    @State var book: Item
    
    let imageNoAvaible = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
    
    var body: some View {
        HStack {
            BookImageView(image: book.volumeInfo.imageLinks?.thumbnail ?? imageNoAvaible, width: 70, height: 90)
          
            VStack(alignment: .leading) {
                Text(book.volumeInfo.title)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Text(book.volumeInfo.categories?[0] ?? "nada").foregroundColor(Color("SecondaryText"))
                Spacer()
                HStack {
                    Text("Publisher: \(book.volumeInfo.publisher ?? "Anonymous")")
                        .font(.system(size: 13))
                        .foregroundColor(Color.gray)
                }
            }
            Spacer()
        }
    }
}

//struct BoookRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BookRow(book: Item())
//    }
//}
