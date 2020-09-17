import SwiftUI

struct PageView: View {
    let page: Page
    let index: Int
    @Binding var tab: Int
    @State private var alpha = Double()
    
    var body: some View {
        ZStack {
            if page.scene != nil {
                Image(page.scene!)
                    .resizable()
                    .scaledToFill()
            }
            if page.title != nil {
                Text(page.title!)
                    .font(Font.largeTitle.bold())
                    .padding()
            }
            ForEach(0 ..< page.characters.count) {
                Image(page.characters[$0].image)
                    .offset(page.characters[$0].offset)
                    .opacity(alpha)
            }
        }.onChange(of: tab) {
            if $0 == index {
                withAnimation(.easeInOut(duration: 1.5)) {
                    alpha = 1
                }
            } else {
                alpha = 0
            }
        }
    }
}
