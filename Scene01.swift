import SwiftUI
import AVFoundation

struct Scene01: View {
    let index: Int
    @Binding var tab: Int
    @Binding var sound: AVAudioPlayer!
    @State private var pandaAlpha = Double()
    @State private var luAlpha = Double()
    
    var body: some View {
        ZStack {
            Image("scene_01")
                .resizable()
                .scaledToFit()
            Image("red_panda_01")
                .offset(x: 125, y: 150)
                .opacity(pandaAlpha)
            Image("lu_01")
                .offset(x: -125, y: 120)
                .opacity(luAlpha)
        }.onAppear(perform: update)
        .onChange(of: tab) { _ in
            update()
        }
    }
    
    private func update() {
        if tab == index {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "lu_01.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    luAlpha = 1
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "red_panda_01.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    pandaAlpha = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                tab += 1
            }
        } else {
            luAlpha = 0
            pandaAlpha = 0
        }
    }
}
