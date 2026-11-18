# UrbanExplorer

[![Compilación y pruebas iOS](https://github.com/Carlos-PC05/lab-prueba-ios/actions/workflows/ios.yml/badge.svg?branch=main)](https://github.com/Carlos-PC05/lab-prueba-ios/actions/workflows/ios.yml)

Prototipo del Entregable parcial 1. La app muestra ocho puntos de interés de Madrid a partir de un catálogo local. Las puntuaciones, los recuentos y las reseñas son datos de ejemplo. El catálogo y la información de cada ficha funcionan sin conexión. Si la foto remota no carga, la ficha muestra un icono local de su categoría.

## Omarchy con xtool

Con Swift 6 y el SDK Darwin de xtool ya instalados, ejecuta desde la raíz del repositorio:

```sh
swift test
xtool dev build
```

Las tres pruebas del modelo y del cargador corren en Linux. xtool compila los mismos fuentes para iOS arm64 y deja una app sin firmar en `xtool/UrbanExplorer.app`. El JSON se incluye como recurso de SwiftPM.

## macOS con Xcode

```sh
git clone https://github.com/Carlos-PC05/lab-prueba-ios.git
cd lab-prueba-ios
open UrbanExplorer.xcodeproj
```

En Xcode 16 o posterior, selecciona el esquema compartido **UrbanExplorer** y un iPhone con un runtime de iOS instalado. Pulsa **Cmd+R** para ejecutar la app o **Cmd+U** para compilar y ejecutar las pruebas. El proyecto incluye el JSON en el bundle principal y no necesita dependencias externas.

## Pruebas y evidencia

Hay **3 pruebas de Swift Testing**. Las tres se redactaron antes de implementar el modelo y el cargador durante esta prueba asistida por IA.

| Prueba | Qué comprueba |
| --- | --- |
| `cargaDelBundle` | El catálogo incluido tiene entre 8 y 10 lugares con identificadores únicos. |
| `decodificaFechaYURL` | El decodificador convierte las fechas ISO 8601, la URL web y la URL de imagen a tipos de Foundation. |
| `jsonInvalido` | Un documento JSON mal formado lanza `DecodingError`. |

GitHub Actions compila la app y corre las pruebas con `xcodebuild test` en un simulador de iPhone tras cada push. Cada ejecución publica el artefacto **evidencia-ios** con el log, el resultado de Xcode (`.xcresult`) y una captura de la lista cuando la app se inicia correctamente.

## Imágenes

Las miniaturas proceden de Wikimedia Commons. Cada ficha de Commons identifica al autor y las condiciones de reutilización.

- [Palacio Real de Madrid](https://commons.wikimedia.org/wiki/File:Vista_de_parte_del_Real_Palacio_desde_la_Cuesta_de_la_Vega.jpg)
- [Parque del Buen Retiro](https://commons.wikimedia.org/wiki/File:MADRID_051116_MXALX_041.jpg)
- [Museo Nacional del Prado](https://commons.wikimedia.org/wiki/File:Puerta_de_Vel%C3%A1zquez_Museo_Prado.jpg)
- [Museo Reina Sofía](https://commons.wikimedia.org/wiki/File:Museo_Nacional_Centro_de_Arte_Reina_Sof%C3%ADa_%2848733949301%29.jpg)
- [Templo de Debod](https://commons.wikimedia.org/wiki/File:Templo_de_Debod-Madrid.jpg)
- [Plaza Mayor](https://commons.wikimedia.org/wiki/File:Madrid_Plaza_Mayor_%2848733706273%29.jpg)
- [Puerta de Alcalá](https://commons.wikimedia.org/wiki/File:Madrid-_Puerta_de_Alcal%C3%A1_-_51454836861.jpg)
- [Real Jardín Botánico](https://commons.wikimedia.org/wiki/File:Madrid_-_Real_Jard%C3%ADn_Bot%C3%A1nico_1.JPG)
