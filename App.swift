import SwiftUI
import NetworkExtension

@main
struct RegeditApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}

struct ContentView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("2026 ENGINE: FREE FIRE")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(.white)
                
                Button(action: startEngine) {
                    Text(isActive ? "NETWORK INJECTED" : "INITIALIZE REGEDIT")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(isActive ? .black : .cyan)
                        .padding()
                        .background(isActive ? Color.green : Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(isActive ? Color.clear : Color.cyan, lineWidth: 2))
                }
            }
        }
    }
    
    func startEngine() {
        NETunnelProviderManager.loadAllFromPreferences { managers, _ in
            let manager = managers?.first ?? NETunnelProviderManager()
            let config = NETunnelProviderProtocol()
            config.providerBundleIdentifier = "com.fox.regedit.extension"
            config.serverAddress = "Proxy-Core"
            manager.protocolConfiguration = config
            manager.isEnabled = true
            manager.saveToPreferences { _ in
                try? manager.connection.startVPNTunnel()
                isActive = true
            }
        }
    }
}
