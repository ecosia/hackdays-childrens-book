import SwiftUI

struct BookView: View {
    @State private var selected = 0
    private let pages = [
        Page(title: "The Forest Book"),
        Page(scene: "scene_01", characters: [.init(image: "red_panda_01", offset: .init(width: -70, height: 200))]),
        Page(scene: "scene_02", characters: [.init(image: "lu_02", offset: .init(width: -450, height: 150))]),
        Page(scene: "scene_03", characters: [])]
    
    var body: some View {
        TabView(selection: $selected) {
            ForEach(0 ..< pages.count) {
                PageView(page: pages[$0], index: $0,tab: $selected)
                    .tag($0)
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}
