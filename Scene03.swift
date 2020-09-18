import SwiftUI
import AVFoundation

struct Scene03: View {
    let index: Int
    @Binding var tab: Int
    @Binding var sound: AVAudioPlayer!
    @State private var chainAlpha = Double()
    @State private var luAlpha = Double()
    
    var body: some View {
        ZStack {
            Image("scene_03")
                .resizable()
                .scaledToFit()
            Image("elephant_01")
                .offset(x: 80, y: -220)
                .opacity(chainAlpha)
            Image("lu_03")
                .offset(x: -70, y: 100)
                .opacity(luAlpha)
        }.onAppear(perform: update)
        .onChange(of: tab) { _ in
            update()
        }
    }
    
    private func update() {
        if tab == index {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "lu_03.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    luAlpha = 1
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                sound = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "elephant_01.m4a", ofType: nil)!))
                sound.play()
                withAnimation(.easeInOut(duration: 1)) {
                    chainAlpha = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                tab += 1
            }
        } else {
            luAlpha = 0
            chainAlpha = 0
        }
    }
}
