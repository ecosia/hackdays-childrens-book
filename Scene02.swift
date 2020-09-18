import SwiftUI
import AVFoundation

struct Scene02: View {
    let index: Int
    @Binding var tab: Int
    @Binding var sound: AVAudioPlayer!
    @State private var chainAlpha = Double()
    @State private var luAlpha = Double()
    
    var body: some View {
        ZStack {
            Image("scene_02")
                .resizable()
                .scaledToFit()
            Image("chainsaw_guy_01")
                .offset(x: 200, y: 70)
                .opacity(chainAlpha)
            Image("lu_02")
                .offset(x: -350, y: 150)
                .opacity(luAlpha)
        }.onAppear(perform: update)
        .onChange(of: tab) { _ in
            update()
        }
    }
    
    private func update() {
        if tab == index {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "chainshaw_guy_01.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    chainAlpha = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "lu_02.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    luAlpha = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                tab += 1
            }
        } else {
            luAlpha = 0
            chainAlpha = 0
        }
    }
}
