//
//  BookDetail.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import SwiftUI
import WebKit

struct BookDetailView: View {
    
    // MARK: - Variables
    @State var book: Item
    
    // MARK: - Image not load
    let imageNoAvaible = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png"
    
    // MARK: - View
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

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Item(
            id: "1",
            etag: "1",
            selfLink: "1",
            volumeInfo: VolumeInfo(title: "title",
                                   publisher: "1223",
                                   publishedDate: "111",
                                   description: "detail",
                                   industryIdentifiers: [IndustryIdentifier(type: TypeEnum.isbn10, identifier: "1")],
                                   readingModes: ReadingModes(text: true, image: true),
                                   pageCount: 11,
                                   printType: PrintType.book,
                                   categories: ["categiory"],
                                   averageRating: 1.2,
                                   ratingsCount: 12,
                                   maturityRating: MaturityRating.notMature,
                                   allowAnonLogging: true,
                                   contentVersion: "12",
                                   panelizationSummary: PanelizationSummary(containsEpubBubbles: true, containsImageBubbles: true),
                                   comicsContent: true, imageLinks: ImageLinks(smallThumbnail: "image", thumbnail: "image"),
                                   language: Language.en,
                                   previewLink: "link",
                                   infoLink: "link",
                                   canonicalVolumeLink: "link",
                                   subtitle: "subtitle",
                                   authors: ["Romeo"]),
            saleInfo: SaleInfo(country: Country.pe,
                               saleability: Saleability.forSale,
                               isEbook: true,
                               listPrice: SaleInfoListPrice(amount: 100.2, currencyCode: "S/"),
                               retailPrice: SaleInfoListPrice(amount: 100.2, currencyCode: "S/"),
                               buyLink: "LINK",
                               offers: [Offer(finskyOfferType: 100,
                                              listPrice: OfferListPrice(amountInMicros: 100, currencyCode: "S/"),
                                              retailPrice: OfferListPrice(amountInMicros: 100, currencyCode: "S/"))]),
            accessInfo: AccessInfo(country: Country.pe,
                                   viewability: Viewability(rawValue: "1")!,
                                   embeddable: true,
                                   publicDomain: true,
                                   textToSpeechPermission: TextToSpeechPermission.allowed,
                                   epub: Epub(isAvailable: true, acsTokenLink: "link"),
                                   pdf: Epub(isAvailable: true, acsTokenLink: "link"),
                                   webReaderLink: "link",
                                   accessViewStatus: AccessViewStatus.sample, quoteSharingAllowed: true),
            searchInfo: SearchInfo(textSnippet: "text"))
        )
    }
}
