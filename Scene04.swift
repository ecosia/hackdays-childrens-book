import SwiftUI
import AVFoundation

struct Scene04: View {
    let index: Int
    @Binding var tab: Int
    @Binding var sound: AVAudioPlayer!
    
    var body: some View {
        Image("scene_04")
            .resizable()
            .scaledToFit()
            .onAppear(perform: update)
            .onChange(of: tab) { _ in
                update()
        }
    }
    
    private func update() {
        if tab == index {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "lu_04.m4a", ofType: nil)!))
                sound.play()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                tab += 1
            }
        }
    }
}
