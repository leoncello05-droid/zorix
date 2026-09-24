import SwiftUI

@main
struct ZorixGameBarApp: App {
    var body: some Scene {
        WindowGroup {
            ZorixGameBarView().frame(width: 550, height: 650)
        }.windowStyle(.hiddenTitleBar)
    }
}

struct ZorixGameBarView: View {
    @State private var selectedProfile = "Potenza Massima"
    @State private var statusMessage = "Sistema pronto per il gaming."
    let profiles = ["Potenza Massima (Ventole 100%)", "Normale / Bilanciato", "Risparmio Energetico"]

    var body: some View {
        ZStack {
            Color.black.opacity(0.4).background(.ultraThinMaterial).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("ZORIX GAME BAR").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(.white).padding(.top, 10)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profilo Sistema & Ventole:").font(.caption).foregroundColor(.white.opacity(0.8))
                    Picker("Profilo", selection: $selectedProfile) {
                        ForEach(profiles, id: \.self) { Text($0).tag($0) }
                    }.pickerStyle(.menu).padding(8).background(Color.white.opacity(0.1)).cornerRadius(10)
                }.padding(.horizontal)
                HStack(spacing: 15) {
                    Button(action: { statusMessage = "🚀 GAME BOOSTER ATTIVO: Priorità CPU e RAM ottimizzate!" }) {
                        Label("GAME BOOSTER", systemImage: "bolt.fill").frame(maxWidth: .infinity).padding().background(Color.blue.opacity(0.4)).foregroundColor(.white).cornerRadius(12)
                    }
                    Button(action: { statusMessage = "✨ WINE 3D RTX: Shader DXVK e impostazioni spinte al massimo!" }) {
                        Label("WINE 3D RTX", systemImage: "cube.transparent.fill").frame(maxWidth: .infinity).padding().background(Color.purple.opacity(0.4)).foregroundColor(.white).cornerRadius(12)
                    }
                }.padding(.horizontal)
                VStack(alignment: .leading, spacing: 10) {
                    Text("📊 Task Manager & Risorse").font(.headline).foregroundColor(.white)
                    VStack(alignment: .leading, spacing: 6) {
                        HStack { Text("CPU in uso:"); Spacer(); Text("18%").bold() }
                        HStack { Text("RAM Utilizzata:"); Spacer(); Text("4.2 GB / 16 GB").bold() }
                        Divider().background(Color.white.opacity(0.2))
                        Text(statusMessage).font(.system(size: 13)).foregroundColor(.cyan)
                    }.padding().background(Color.black.opacity(0.3)).cornerRadius(12)
                }.padding(.horizontal)
                Spacer()
                Button("Chiudi Overlay") { exit(0) }.foregroundColor(.white.opacity(0.7)).padding(.bottom, 10)
            }
        }.cornerRadius(24).overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.white.opacity(0.25), lineWidth: 1.5))
    }
}
