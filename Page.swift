import SwiftUI

struct Page {
    let title: LocalizedStringKey?
    let scene: String?
    let characters: [Character]
    
    init(title: LocalizedStringKey? = nil, scene: String? = nil, characters: [Character] = []) {
        self.title = title
        self.scene = scene
        self.characters = characters
    }
}
