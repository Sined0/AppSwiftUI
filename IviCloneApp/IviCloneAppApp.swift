//
//  IviCloneAppApp.swift
//  IviCloneApp
//
//  Created by Denis on 29.09.2021.
//

import SwiftUI
import Firebase
@main
struct IviCloneAppApp: App {
    @UIApplicationDelegateAdaptor(FireConn.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class FireConn: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
