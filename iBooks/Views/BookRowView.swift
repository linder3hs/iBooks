//
//  BoookRow.swift
//  iBooks
//
//  Created by Linder Hassinger on 20/11/21.
//

import SwiftUI

struct BookRowView: View {
    
    //  MARK: - Variables
    @State var book: Item
    
    //  MARK: - Image no load
    let imageNoAvaible = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
    
    //  MARK: - View
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

struct BoookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView(book:
                        Item(
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
                            searchInfo: SearchInfo(textSnippet: "text")
                        )
        )
    }
}
