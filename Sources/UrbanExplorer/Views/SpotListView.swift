#if os(iOS)
import SwiftUI

struct SpotListView: View {
    let spots: [Spot]?

    var body: some View {
        NavigationStack {
            List {
                if let spots, !spots.isEmpty {
                    Section("Madrid · \(spots.count) lugares") {
                        ForEach(spots) { spot in
                            NavigationLink {
                                SpotDetailView(spot: spot)
                            } label: {
                                SpotRowView(spot: spot)
                            }
                        }
                    }
                } else {
                    ContentUnavailableView(
                        "Lugares no disponibles",
                        systemImage: "map",
                        description: Text("No hay lugares disponibles en el catálogo local.")
                    )
                }

                Section {
                    NavigationLink {
                        AboutDetailView()
                    } label: {
                        Label("Acerca de UrbanExplorer", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("UrbanExplorer")
        }
    }
}
#endif
