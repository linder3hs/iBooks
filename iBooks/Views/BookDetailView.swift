//
//  BookDetail.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import SwiftUI
import WebKit

struct BookDetailView: View {
    
    @State var book: Item
    
    let imageNoAvaible = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 6) {
                BookImageView(image: book.volumeInfo.imageLinks?.thumbnail ?? imageNoAvaible, width: 150, height: 220)
                
                Text(book.volumeInfo.title)
                    .font(.title)
                
                if let category = book.volumeInfo.categories {
                    Text(category[0])
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                
                if let rating = book.volumeInfo.averageRating {
                    VStack(alignment: .leading, spacing: 5) {
                        RatingView(rating: .constant(Int(rating)))
                        HStack {
                            Text(String(book.volumeInfo.ratingsCount!))
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                            Text("rating count")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                
                Link("BUY | FREE", destination: URL(string: book.volumeInfo.previewLink)!)
                    .font(.system(size: 16, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                
                Divider()
            }.padding()
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Description")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                ExpandableTextView(book.volumeInfo.description ?? "", lineLimit: 4)
                
            }.padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                Divider()
                    .padding(.bottom, 5)
                HStack(spacing: 20) {
                    if let publisher = book.volumeInfo.publisher {
                        SectionDetailView(title: "PUBLISHER", image: Image(systemName: "book"), detail: publisher)
                    }
                    
                    if let publishedDate = book.volumeInfo.publishedDate {
                        SectionDetailView(title: "PUBLISHED DATE", image: Image(systemName: "calendar"), detail: publishedDate)
                    }
                    
                    if let languae = book.volumeInfo.language {
                        SectionDetailView(title: "LANGUAGE", image: Image(systemName: "doc.richtext"), detail: languae.rawValue)
                    }
                    
                    if let pageCount = book.volumeInfo.pageCount {
                        
                         SectionDetailView(title: "PAGE COUNT", image: Image(systemName: "book.closed"), detail: String(pageCount))
                    }
                }.padding()
                Divider()
                    .padding(.top, 5)
            }.padding()
        }
    }
}

//struct BookDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BookDetail()
//    }
//}
