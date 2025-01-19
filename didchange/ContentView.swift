//
//  ContentView.swift
//  didchange
//
//  Created by Brandon Roehl on 1/18/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: didchangeDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(didchangeDocument()))
}
