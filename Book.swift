import SwiftUI

struct Book: View {
    @State private var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            Title(index: 0, tab: $selected)
                .tag(0)
            Title(index: 1, tab: $selected)
                .tag(1)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
