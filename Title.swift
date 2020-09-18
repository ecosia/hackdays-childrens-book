import SwiftUI
import AVFoundation

struct Title: View {
    let index: Int
    @Binding var tab: Int
    @Binding var sound: AVAudioPlayer!
    @State private var alpha = Double()
    
    var body: some View {
        Image("title")
            .resizable()
            .scaledToFit()
            .opacity(alpha)
        .onAppear(perform: update)
        .onChange(of: tab) { _ in
            update()
        }
    }
    
    private func update() {
        if tab == index {
            sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "title.m4a", ofType: nil)!))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                sound?.play()
            }
            withAnimation(.easeInOut(duration: 1.5)) {
                alpha = 1
            }
        } else {
            alpha = 0
        }
    }
}
