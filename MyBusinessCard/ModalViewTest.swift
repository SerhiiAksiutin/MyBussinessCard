//
//  ModalTest.swift
//  MyBussinessCard
//
//  Created by Serhii Aksiutin on 10/20/19.
//  Copyright © 2019 Serhii Aksiutin. All rights reserved.
//


import SwiftUI
import MessageUI

struct ModalView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                print("dismisses form")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }
            .padding(.bottom, 50)
            Text("This is a modal")
        }
    }
}


