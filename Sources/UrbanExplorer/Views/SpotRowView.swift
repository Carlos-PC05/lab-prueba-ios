#if os(iOS)
import SwiftUI

struct SpotRowView: View {
    let spot: Spot

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: spot.category.symbol)
                .font(.title3)
                .foregroundStyle(.teal)
                .frame(width: 32)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(spot.title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(spot.category.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(spot.tags.joined(separator: " · "))
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 4)

            Label(spot.rating.formatted(.number.precision(.fractionLength(1))), systemImage: "star.fill")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.primary)
                .accessibilityLabel("Puntuación")
                .accessibilityValue(spot.rating.formatted())
        }
        .padding(.vertical, 6)
        .accessibilityElement(children: .combine)
    }
}

extension Spot.Category {
    var symbol: String {
        switch self {
        case .monumento: "building.columns"
        case .parque: "leaf"
        case .restaurante: "fork.knife"
        case .museo: "photo.artframe"
        }
    }
}
#endif
