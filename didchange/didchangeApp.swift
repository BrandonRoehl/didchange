//
//  didchangeApp.swift
//  didchange
//
//  Created by Brandon Roehl on 1/18/25.
//

import SwiftUI

@main
struct didchangeApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: didchangeDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
