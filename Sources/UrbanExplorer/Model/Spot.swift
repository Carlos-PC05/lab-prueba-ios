import Foundation

struct Spot: Codable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let category: Category
    let rating: Double
    let visitCount: Int
    let isFavorite: Bool
    let createdAt: Date
    let tags: [String]
    let imageURL: [URL]
    let mainImageURL: URL
    let webURL: URL
    let latitude: Double
    let longitude: Double
    let reviews: [Review]

    enum Category: String, Codable {
        case monumento = "Monumento"
        case parque = "Parque"
        case restaurante = "Restaurante"
        case museo = "Museo"
    }
}
