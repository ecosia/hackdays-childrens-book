import SwiftUI
import AVFoundation

struct Book: View {
    @State private var selected = 0
    @State private var sound: AVAudioPlayer!
    
    var body: some View {
        TabView(selection: $selected) {
            Title(index: 0, tab: $selected, sound: $sound)
                .tag(0)
            Scene01(index: 1, tab: $selected, sound: $sound)
                .tag(1)
            Scene02(index: 2, tab: $selected, sound: $sound)
                .tag(2)
            Scene03(index: 3, tab: $selected, sound: $sound)
                .tag(3)
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onAppear {
            sound = AVAudioPlayer()
        }
    }
}
