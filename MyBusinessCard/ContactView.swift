//
//  contactInfoView.swift
//  MyBussinessCard
//
//  Created by Serhii Aksiutin on 10/20/19.
//  Copyright © 2019 Serhii Aksiutin. All rights reserved.
//

import SwiftUI
import MessageUI

struct contactInfo: View {
    private let mailComposeDelegate = MailDelegate()
    
    var icon: String
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .colorInvert()
            .frame(height: 50)
            .overlay(Button(
                action: {
                    print("Button Pushed")
                    if self.text == "serhiiaksiutin@icloud.com" {
                        self.presentMailCompose()
                    } else {
                        self.presentPhoneCaller()
                    }
                    
                }
            )
            {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(Color(red: 0.52, green: 0.101, blue: 0.164))
                Text(text)
                    .foregroundColor(Color(red: 0.52, green: 0.101, blue: 0.164))
                    .bold()
                    .font(.system(size: 22))
                }
            }
        ).padding(.horizontal)
    }
}


extension contactInfo {
    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
//            <# Customize here #>
            controller.dismiss(animated: true)
        }

    }

    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate
        composeVC.setSubject("Job request:")
        composeVC.setToRecipients([text])
        composeVC.setMessageBody("<p>Hi Serhii,</p><p></p><p>You're the greatest iOS Developer. Way to go!!!</p>", isHTML: true)

        vc?.present(composeVC, animated: true)
    }
    
    private func presentPhoneCaller() {
        let url:NSURL? = NSURL(string: "tel://\(text.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil))")
        UIApplication.shared.openURL(url! as URL)
    }
}

#if DEBUG
struct contactInfo_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            contactInfo(icon: "phone.fill", text: "911")
                .background(Color.black)
                .environment(\.colorScheme, .light)

            contactInfo(icon: "phone.fill", text: "911")
                .background(Color.white)
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

