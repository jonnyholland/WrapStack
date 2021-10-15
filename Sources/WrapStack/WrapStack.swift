import SwiftUI

@available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
public struct WrapStack<Model, V>: View where Model: Hashable, V: View {
    
    public init(
        _ models: [Model],
        @ViewBuilder content: @escaping WrapStack<Model, V>.ViewGenerator
    ) {
        self.models = models
        self.content = content
    }
    public typealias ViewGenerator = (Model) -> V
    
    var models: [Model]
    var content: ViewGenerator
    var horizontalSpacing: CGFloat = 4
    var verticalSpacing: CGFloat = 4
    
    @State private var totalHeight
    = CGFloat.zero       // << variant for ScrollView/List
                         //    = CGFloat.infinity   // << variant for VStack
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .modifier(HeightModifier())
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.models, id: \.self) { models in
                content(models)
                    .padding(.horizontal, horizontalSpacing)
                    .padding(.vertical, verticalSpacing)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if (abs(width - dimension.width) > geometry.size.width)
                        {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if models == self.models.last! {
                            width = 0 //last item
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {dimension in
                        let result = height
                        if models == self.models.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
        .preference(key: HeightPreference.self, value: totalHeight)
    }
}
