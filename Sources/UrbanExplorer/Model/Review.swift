import Foundation

struct Review: Codable, Identifiable, Hashable {
    let autor: String
    let date: Date
    let comment: String
    let points: Int

    var id: Self { self }
}
