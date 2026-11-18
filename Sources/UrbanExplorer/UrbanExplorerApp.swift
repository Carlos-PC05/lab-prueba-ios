#if os(iOS)
import SwiftUI

@main
struct UrbanExplorerApp: App {
    private let spots = JSONLoader.cargarParaApp()

    var body: some Scene {
        WindowGroup {
            SpotListView(spots: spots)
                .tint(.teal)
        }
    }
}
#endif
