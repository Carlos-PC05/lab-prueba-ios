import Foundation
import Testing
@testable import UrbanExplorer

struct JSONLoaderTests {
    @Test func cargaDelBundle() throws {
        let spots = try JSONLoader.cargarSpots()
        #expect((8...10).contains(spots.count))
        #expect(Set(spots.map(\.id)).count == spots.count)
    }

    @Test func decodificaFechaYURL() throws {
        let datos = Data("""
        {
          "id": "A1B2C3D4-E5F6-7890-ABCD-EF1234567890",
          "title": "Museo del Prado", "description": "Pinacoteca de Madrid",
          "category": "Museo", "rating": 4.8, "visitCount": 10,
          "isFavorite": false, "createdAt": "2024-03-15T10:30:00Z",
          "tags": ["Arte"], "imageURL": ["https://example.com/prado.jpg"],
          "mainImageURL": "https://example.com/prado-small.jpg",
          "webURL": "https://www.museodelprado.es/", "latitude": 40.4138,
          "longitude": -3.6921, "reviews": [{
            "autor": "Ana", "date": "2024-03-15T10:30:00Z",
            "comment": "Volvería.", "points": 5
          }]
        }
        """.utf8)

        let spot = try JSONLoader.decodificar(Spot.self, de: datos)
        #expect(spot.createdAt == Date(timeIntervalSince1970: 1_710_498_600))
        #expect(spot.reviews.first?.date == spot.createdAt)
        #expect(spot.webURL.absoluteString == "https://www.museodelprado.es/")
        #expect(spot.imageURL.first?.host == "example.com")
    }

    @Test func jsonInvalido() {
        let datos = Data(#"[{ "title": 42 }"#.utf8)
        #expect(throws: DecodingError.self) {
            try JSONLoader.decodificar([Spot].self, de: datos)
        }
    }
}
