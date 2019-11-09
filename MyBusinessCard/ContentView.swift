//
//  ContentView.swift
//  MyBussinessCard
//
//  Created by Serhii Aksiutin on 10/20/19.
//  Copyright © 2019 Serhii Aksiutin. All rights reserved.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.52, green: 0.101, blue: 0.164)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("serhii")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150.0, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(lineWidth: 5).colorInvert())
                Text("Sam Appleseed")
                    .font(Font.custom("Redressed-Regular", size: 40))
                    .bold()
                    .colorInvert()
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .colorInvert()
                contactInfo(icon: "envelope.fill", text:  "samappleseed@icloud.com")
                contactInfo(icon: "phone.fill", text: "+1 555 555 5555")
            }

        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ContentView()
               .environment(\.colorScheme, .dark)
        }
    }
}
#endif


