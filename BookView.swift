import SwiftUI

struct BookView: View {
    @State private var selected = 0
    private let pages = [Page()]
    
    var body: some View {
        TabView(selection: $selected) {
            ForEach(0 ..< pages.count) {
                PageView(page: pages[$0], index: $0,tab: $selected)
                    .tag($0)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
