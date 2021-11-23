//
//  SectionDetailView.swift
//  iBooks
//
//  Created by Linder Hassinger on 23/11/21.
//

import SwiftUI

struct SectionDetailView: View {
    @State var title: String
    @State var image: Image
    @State var detail: String
    
    var body: some View {
        HStack {
            VStack(spacing: 5) {
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
                image
                    .font(.system(size: 22))
                    
                Text(detail)
                    .font(.system(size: 13))
                    .foregroundColor(Color.black)
            }
            HStack {
                Divider()
            }.frame(height: 50)
        }
    }
}

//struct SectionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionDetailView()
//    }
//}
