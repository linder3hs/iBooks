//
//  BookImage.swift
//  iBooks
//
//  Created by Linder Hassinger on 23/11/21.
//

import SwiftUI

struct BookImageView: View {
    @State var image: String
    @State var width: CGFloat
    @State var height: CGFloat
    
    let imageNoAvaible = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: width, height: height)
        .scaledToFill()
        .cornerRadius(10)
    }
}

//struct BookImage_Previews: PreviewProvider {
//    static var previews: some View {
//        BookImage()
//    }
//}
