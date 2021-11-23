//
//  Profile.swift
//  iBooks
//
//  Created by Linder Hassinger on 22/11/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - View
    var body: some View {
        VStack {
            Image("profile")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
            
            Text("Linder Hassinger").font(.system(size: 18, weight: .semibold))
            
            HStack {
                Image(systemName: "mappin.circle")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Lima, Peru")
                    .font(.body)
            }
            
            Text("I'm a Software Developer")
                .font(.body)
                .padding()
            
            HStack {
                Link(destination: URL(string: "https://www.youtube.com/channel/UCPAg4A1jRtkY3lPdGKGS2Vg")!) {
                    Image("youtube")
                        .font(.title)
                        .foregroundColor(.red)
                }
                Link(destination: URL(string: "https://www.linkedin.com/in/linderhassinger/")!) {
                    Image("linkedin")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Link(destination: URL(string: "https://github.com/linder3hs")!) {
                    Image("github")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            Spacer()
            List {
                Button(action: call) {
                    Label("Call me", systemImage: "phone.circle")
                        .font(.body)
                }
            }
            
        }
    }
}

// MARK: - Functions
private func call() {
    let phoneNumberformatted: String = "tel://+51967617166"
    guard let url = URL(string: phoneNumberformatted) else { return }
    UIApplication.shared.open(url)
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
