import SwiftUI

struct PageView: View {
    let page: Page
    let index: Int
    @Binding var tab: Int
    
    var body: some View {
        Circle()
            .onAppear(perform: start)
            .onChange(of: tab) {
                if $0 == index {
                    start()
                }
            }
    }
    
    private func start() {
        
    }
}
