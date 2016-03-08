//
//  MailgunApiSpecs.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

import Nimble
import Quick
import SwiftMailgun
import ObjectMapper
import Keys

class MailgunApiSpecs: QuickSpec{
    
    
    override func spec() {
        
        let timeout: NSTimeInterval = 10
        
        it("send email without api valid api key"){
            
            let mailgun = MailgunAPI(apiKey: "123123", clientDomain: "sandboxbe44cd7651a44ddb85c646f747d94d7d.mailgun.org")
            
            var result : MailgunResult? = nil
            
            mailgun.sendEmail(to: "cjimenez16@gmail.com", from: "Excited User <mailgun@test.com>", subject: "This is a test", bodyHTML: "<b>test<b>") { mailgunResult in
                
                result = mailgunResult
                
            }
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result?.hasError).toEventually(beTruthy(),timeout:timeout)
            expect(result?.message).toEventuallyNot(beNil(), timeout:timeout)
            
        }
        
        it("send email with valid api key"){
            
            let keys = SwiftmailgunKeys()
            
            let mailgun = MailgunAPI(apiKey: keys.mailgun_Api_Key(), clientDomain: "sandboxbe44cd7651a44ddb85c646f747d94d7d.mailgun.org")
            
            var result : MailgunResult? = nil
            
            mailgun.sendEmail(to: "cjimenez16@gmail.com", from: "<Send To Me> mailgun@test.com", subject: "This is a test", bodyHTML: "<b>test<b>") { mailgunResult in
                
                result = mailgunResult
                
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result?.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result?.message).toEventuallyNot(beNil(), timeout:timeout)
            
        }
//
//        it("send email with inline parameters"){
//            
//            let keys = SwiftmandrillKeys()
//            
//            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
//            
//            var result : MandrillResult? = nil
//            
//            api.sendEmail(from: "test@test.com", fromName: "Test", to: "cjimenez16@gmail.com", subject: "test", html: "test", text: "test"){ mandrillResult in
//                result = mandrillResult
//            }
//            
//            expect(result).toEventuallyNot(beNil(),timeout:timeout)
//            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
//            expect(result!.message).toEventually(beNil(), timeout:timeout)
//            
//        }
//        
//        it("send email with inline parameters to several recipients"){
//            
//            let keys = SwiftmandrillKeys()
//            
//            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
//            
//            var result : MandrillResult? = nil
//            
//            api.sendEmail(from: "test@test.com",fromName: "test", to: ["cjimenez16@gmail.com","test2@test.com"], subject: "test", html: "test", text: "test"){ mandrillResult in
//                result = mandrillResult
//            }
//            
//            expect(result).toEventuallyNot(beNil(),timeout:timeout)
//            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
//            expect(result!.message).toEventually(beNil(), timeout:timeout)
//            
//        }
//        
//        it("send email to several recipients with email object"){
//            
//            let keys = SwiftmandrillKeys()
//            
//            let api = MandrillAPI(ApiKey: keys.mANDRILL_API())
//            
//            var result : MandrillResult? = nil
//            
//            let to1 = MandrillTo(email: "test@test.com")
//            let to2 = MandrillTo(email: "test@test2.com")
//            
//            let email = MandrillEmail(from: "test@test.com", fromName: "test", to: [to1,to2], subject: "test", html: "test", text: "test")
//            
//            api.sendEmail(withEmail: email){ mandrillResult in
//                result = mandrillResult
//            }
//            
//            expect(result).toEventuallyNot(beNil(),timeout:timeout)
//            expect(result!.hasError).toEventually(beFalsy(),timeout:timeout)
//            expect(result!.message).toEventually(beNil(), timeout:timeout)
//            
//        }
        
    }

}

