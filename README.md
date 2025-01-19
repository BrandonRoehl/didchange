While this next line exists none of the following fire
just looking for an explination as to why? Comment it out to
fix it. This happens regardless of what ones are enabled and
breaks all delegate call backs no all sub views.
- ``NSTextDelegate.textDidChange(_:)``
- ``NSTextContentStorageDelegate.textContentStorage(_:textParagraphWith:)``
- ``NSTextLayoutManagerDelegate.textLayoutManager(_:textLayoutFragmentFor:in:)``
- ``NSTextStorageDelegate.textStorage(_:didProcessEditing:range:changeInLength:)``

What I have been able to determin is there are a couple
conditions required to break it.
1. You must have a ``FileDocument`` bound to your view
2. You must create an attach a `Task` as a `@State`

Was trying to debounce the @Binding update via `onChange` when
I noticed this as it worked before I used a delegate to do the
update and regular ``TextView`` didn't seem to be affected.
