//
//  ExpandableText.swift
//  iBooks
//
//  Created by Linder Hassinger on 23/11/21.
//

import SwiftUI

struct ExpandableTextView: View {
    @State private var expanded: Bool = false
       @State private var truncated: Bool = false
       private var text: String

       let lineLimit: Int

       init(_ text: String, lineLimit: Int) {
           self.text = text
           self.lineLimit = lineLimit
       }

       private var moreLessText: String {
           if !truncated {
               return ""
           } else {
               return self.expanded ? "read less" : " read more"
           }
       }
       
       var body: some View {
           VStack(alignment: .leading) {
               Text(text)
                   .lineLimit(expanded ? nil : lineLimit)
                   .background(
                       Text(text).lineLimit(lineLimit)
                           .background(GeometryReader { visibleTextGeometry in
                               ZStack { //large size zstack to contain any size of text
                                   Text(self.text)
                                       .background(GeometryReader { fullTextGeometry in
                                           Color.clear.onAppear {
                                               self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                           }
                                       })
                               }
                               .frame(height: .greatestFiniteMagnitude)
                           })
                           .hidden() //keep hidden
               )
               if truncated {
                   Button(action: {
                       withAnimation {
                           expanded.toggle()
                       }
                   }, label: {
                       Text(moreLessText)
                   })
               }
           }
       }
}

struct ExpandableText_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTextView("In this example we leverage main text view’s background to evaluate weather text is being shrunk or not. We put background as Zstack with maximum possible height and set the text without any line limit. Then compere the height to evaluate if text is big to have expand shrink button.", lineLimit: 4)
    }
}
