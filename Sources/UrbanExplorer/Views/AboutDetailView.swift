#if os(iOS)
import SwiftUI

struct AboutDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: "map.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.teal)
                    .accessibilityHidden(true)

                Text("UrbanExplorer")
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)

                Text("Una guía de monumentos, parques y museos de Madrid. Proyecto de la asignatura Aplicaciones para Dispositivos Móviles en iOS.")
                LabeledContent("Alumno", value: "Carlos Parra Camacho")
            }
            .frame(maxWidth: 520, alignment: .leading)
            .padding(24)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Acerca de")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
