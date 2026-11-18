#if os(iOS)
import SwiftUI

struct SpotDetailView: View {
    let spot: Spot

    var body: some View {
        List {
            Section {
                AsyncImage(url: spot.mainImageURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill()
                    } else {
                        Rectangle()
                            .fill(.teal.opacity(0.12))
                            .overlay {
                                Image(systemName: spot.category.symbol)
                                    .font(.largeTitle)
                                    .foregroundStyle(.teal)
                            }
                    }
                }
                .frame(height: 180)
                .clipped()
                .listRowInsets(EdgeInsets())
                .accessibilityHidden(true)

                Text(spot.description)
                Link(destination: spot.webURL) {
                    Label("Web oficial", systemImage: "arrow.up.right")
                }
            }

            Section("Ficha del lugar") {
                LabeledContent("Categoría", value: spot.category.rawValue)
                LabeledContent("Añadido", value: spot.createdAt.formatted(date: .long, time: .omitted))
                LabeledContent("Latitud", value: spot.latitude.formatted(.number.precision(.fractionLength(5))))
                LabeledContent("Longitud", value: spot.longitude.formatted(.number.precision(.fractionLength(5))))
            }

            if !spot.reviews.isEmpty {
                Section("Reseñas de ejemplo") {
                    ForEach(spot.reviews) { review in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(review.autor).font(.headline)
                            Text(review.comment)
                            Text("\(review.points)/5 · \(review.date.formatted(date: .abbreviated, time: .omitted))")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle(spot.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#endif
