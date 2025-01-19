//
//  TestView.swift
//  testUI
//
//  Created by Brandon Roehl on 1/18/25.
//

import SwiftUI
import AppKit

final public class TestDelegate: NSObject { }

extension TestDelegate: NSTextViewDelegate {
    public func textDidChange(_ notification: Notification) {
        print("NSTextViewDelegate")
    }
}

extension TestDelegate: NSTextStorageDelegate {
    public func textStorage(
        _ textStorage: NSTextStorage,
        didProcessEditing editedMask: NSTextStorageEditActions,
        range editedRange: NSRange,
        changeInLength delta: Int
    ) {
        print("NSTextStorageDelegate")
    }
}


extension TestDelegate: NSTextContentStorageDelegate {
    public func textContentStorage(_ textContentStorage: NSTextContentStorage, textParagraphWith range: NSRange) -> NSTextParagraph? {
        print("NSTextContentStorageDelegate")
        return nil
    }
}

extension TestDelegate: NSTextLayoutManagerDelegate {
    public func textLayoutManager(
        _ textLayoutManager: NSTextLayoutManager,
        textLayoutFragmentFor location: NSTextLocation,
        in textElement: NSTextElement
    ) -> NSTextLayoutFragment {
        print("NSTextLayoutManagerDelegate")
        return NSTextLayoutFragment(textElement: textElement, range: textElement.elementRange)
    }
}

struct TestView: NSViewRepresentable {
    let delegate = TestDelegate()
    
    public init() { }

    public func createContentStorage() -> NSTextContainer {
        // MARK: NSTextContentStorageDelegate
        let textContentStorage = NSTextContentStorage()
        textContentStorage.delegate = self.delegate

        // MARK: NSTextLayoutManagerDelegate
        let textLayoutManager = NSTextLayoutManager()
        textLayoutManager.delegate = self.delegate
        textContentStorage.addTextLayoutManager(textLayoutManager)
        
        // MARK: NSTextStorageDelegate
        textContentStorage.textStorage?.delegate = self.delegate

        let textContainer = NSTextContainer()
        textLayoutManager.textContainer = textContainer

        return textContainer
    }

    public func makeNSView(context: Context) -> NSTextView {
        let container = self.createContentStorage()
        let textView = NSTextView(frame: CGRect(), textContainer: container)
        return textView
    }

    public func updateNSView(_ scrollView: NSTextView, context: Context) {
    }
}
