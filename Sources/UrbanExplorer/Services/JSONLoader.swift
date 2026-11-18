import Foundation

enum JSONLoader {
    enum ResourceError: Error {
        case spotsNotFound
    }

    static func cargarSpots() throws -> [Spot] {
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle.main
        #endif

        guard let url = bundle.url(forResource: "spots", withExtension: "json") else {
            throw ResourceError.spotsNotFound
        }
        return try decodificar([Spot].self, de: Data(contentsOf: url))
    }

    static func decodificar<T: Decodable>(_ type: T.Type, de data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(type, from: data)
    }

    static func cargarParaApp() -> [Spot]? {
        do {
            return try cargarSpots()
        } catch ResourceError.spotsNotFound {
            print("No se encuentra spots.json en el bundle de la aplicación.")
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Falta la clave \(key.stringValue) en spots.json: \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Se esperaba \(type) en spots.json: \(context.debugDescription)")
        } catch {
            print("No se pudo cargar spots.json: \(error)")
        }
        return nil
    }
}
