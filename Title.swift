import SwiftUI

struct Title: View {
    let index: Int
    @Binding var tab: Int
    @State private var alpha = Double()
    
    var body: some View {
        ZStack {
            Image("title")
                .resizable()
                .scaledToFit()
                .opacity(alpha)
        }.onAppear(perform: update)
        .onChange(of: tab) { _ in
            update()
        }
    }
    
    private func update() {
        if tab == index {
            withAnimation(.easeInOut(duration: 1.5)) {
                alpha = 1
            }
        } else {
            alpha = 0
        }
    }
}
