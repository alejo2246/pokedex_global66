# Pokédex App

Aplicación Flutter que consume la [PokéAPI](https://pokeapi.co/) para listar y explorar Pokémon, con soporte para favoritos, filtros por tipo, búsqueda en tiempo real e internacionalización (español/inglés).

---

## Tabla de contenidos

- [Requisitos](#requisitos)
- [Instrucciones para correr el proyecto](#instrucciones-para-correr-el-proyecto)
- [Arquitectura](#arquitectura)
- [Decisiones de diseño](#decisiones-de-diseño)
- [Llamados a la API y por qué se necesitaron más de dos](#llamados-a-la-api-y-por-qué-se-necesitaron-más-de-dos)
- [Stack tecnológico](#stack-tecnológico)
- [Capas de seguridad](#capas-de-seguridad)
- [Internacionalización (i18n)](#internacionalización-i18n)
- [Tests](#tests)
- [Uso de IA](#uso-de-ia)

---

## Requisitos

| Herramienta | Versión mínima |
|-------------|----------------|
| Flutter     | 3.11.0         |
| Dart        | 3.7.0          |
| Android SDK | API 21+        |
| Xcode       | 15+ (para iOS) |

---

## Instrucciones para correr el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/alejo2246/pokedex_global66
cd pokedex_global66
```

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Generar código (Riverpod, Freezed, JSON)

El proyecto utiliza generación de código para providers, data classes y serialización. Los archivos generados (`.g.dart`, `.freezed.dart`) ya están incluidos en el repositorio, pero si realizas cambios en clases anotadas, vuelve a ejecutar:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Para modo watch durante desarrollo:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 4. Ejecutar la app

```bash
# En el dispositivo/emulador por defecto
flutter run

# En release (mejor rendimiento)
flutter run --release
```

### 5. Ejecutar los tests

```bash
flutter test
```

---

## Arquitectura

El proyecto implementa **Clean Architecture** dividida en tres capas principales, organizadas por feature. Cada feature es independiente y sigue la misma estructura interna.

```
lib/
├── core/              # Infraestructura compartida (red, router, utilidades)
├── design_system/     # Componentes visuales reutilizables (Atomic Design)
├── features/          # Módulos de negocio (cada uno con sus propias capas)
│   ├── pokedex/
│   ├── favorites/
│   ├── onboarding/
│   ├── splash/
│   ├── home/
│   ├── profile/
│   └── regions/
└── l10n/              # Localizaciones generadas
```

### Capas dentro de cada feature

```
feature/
├── data/
│   ├── dto/           # Data Transfer Objects (Freezed + JSON)
│   ├── datasources/   # Fuentes de datos (local/remoto)
│   └── repositories/  # Implementaciones de los contratos del dominio
├── domain/
│   ├── entities/      # Modelos de negocio puros
│   ├── repositories/  # Interfaces (contratos)
│   └── usecases/      # Casos de uso (una responsabilidad por clase)
└── presentation/
    ├── pages/         # Widgets de pantalla (ConsumerWidget)
    └── viewmodels/    # Estado UI con Riverpod (@riverpod class)
```

### Flujo de datos

```
UI (Page)
  └─► ViewModel (Riverpod Notifier)
        └─► UseCase (Dominio)
              └─► Repository Interface
                    └─► Repository Impl (Datos)
                          ├─► Remote DataSource (Dio → PokeAPI)
                          └─► Local DataSource (SharedPreferences)
```

La UI nunca conoce la fuente de datos. El dominio nunca depende de Flutter ni de paquetes externos. Los repositorios son la única puerta entre datos y negocio.

### Design System (Atomic Design)

Los componentes visuales siguen la metodología **Atomic Design**:

| Nivel | Ejemplos |
|-------|----------|
| **Atoms** | `AppButton`, `TypeBadge`, `FavoriteIcon`, `ShimmerBox`, `AppDotsIndicator` |
| **Molecules** | `PokemonCard`, `PokemonCardSkeleton`, `AppErrorState`, `AppMultiSelect` |
| **Organisms** | `PokedexSkeletonList` |
| **Templates** | `AppOnboarding` |

Los **tokens** de diseño (colores, tipografía, espaciado, radios) están centralizados en `design_system/tokens/`, asegurando consistencia visual en toda la aplicación.

---

## Decisiones de diseño

### Result type — manejo de errores tipado

Se implementó un tipo sellado `Result<T>` con variantes `Success` y `Failure` para eliminar el uso de excepciones no controladas. Esto obliga a que cada capa maneje explícitamente los casos de error, haciendo el flujo predecible:

```dart
sealed class Result<T> { const Result(); }

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  final FailureType type;
  const Failure({required this.message, required this.type});
}

// Uso en ViewModel — el compilador obliga a manejar ambos casos
switch (result) {
  case Success(:final data) => state = AsyncData(data),
  case Failure(:final message) => state = AsyncError(message, StackTrace.current),
}
```

### Riverpod con anotaciones

Se usó `@riverpod` para generar providers automáticamente, reduciendo código boilerplate y evitando errores de tipado manuales. Los ViewModels son `@riverpod class` que extienden la clase `_$NombreViewModel` generada por `riverpod_generator`.

### Freezed para inmutabilidad

Todas las entidades, DTOs y estados del ViewModel son inmutables gracias a `freezed`. Esto previene mutaciones accidentales del estado, simplifica los tests y habilita `copyWith` sin código manual.

### Filtrado client-side

La PokéAPI **no soporta filtrado por tipo ni búsqueda por nombre como parámetros de query**. El endpoint `/pokemon` solo acepta `limit` y `offset` para paginación, por lo que no es posible delegar los filtros al servidor.

Dado esto, el filtrado se implementó en el cliente: los Pokémon se cargan por páginas de 50 y se acumulan en memoria. El filtro por tipo y la búsqueda por nombre operan sobre ese conjunto local sin peticiones adicionales a la API. Esto garantiza una experiencia de filtrado instantánea sin latencia de red.

### Skeleton loaders

En lugar de un spinner genérico, se implementaron skeleton screens que replican la forma de los cards reales, mejorando la percepción de velocidad de carga.

### Favoritos con persistencia local

Los favoritos se guardan en `SharedPreferences` como lista de IDs. El `FavoritesViewModel` mantiene un `Set<String>` de IDs favoritos para lookups en O(1) al renderizar cada card en el listado.

---

## Llamados a la API y por qué se necesitaron más de dos

La evaluación especifica dos endpoints:

1. `GET /pokemon` — Lista de Pokémon
2. `GET /pokemon/{name}` — Detalle individual

**El problema:** El endpoint de lista (`/pokemon`) solo devuelve `name` y `url` de cada Pokémon. No incluye tipos, atributo visual necesario para los cards del listado.

Adicionalmente, el endpoint de detalle no incluye descripciones textuales, categoría de especie, ratio de género ni debilidades por tipo. Esto obligó a los siguientes llamados adicionales:

### Llamada 3 — Enriquecimiento de la lista con `/pokemon/{id}`

Para mostrar los tipos (badges de colores) en cada card del listado, se llama a `/pokemon/{id}` por cada Pokémon al cargar la página. Las llamadas se ejecutan en paralelo con `Future.wait()` para minimizar latencia:

```dart
// GetPokemonListUseCase
final enrichedPokemons = await Future.wait(
  pokemonList.map((p) async {
    final result = await _repository.getPokemonDetail(p.id);
    return result is Success ? result.data : p; // fallback al pokemon base si falla
  }),
);
```

Este enriquecimiento es necesario porque la UI de la lista requiere los tipos para mostrar los badges y el color de fondo de cada card.

### Llamada 4 — Especie del Pokémon con `/pokemon-species/{id}`

El endpoint `/pokemon/{id}` no incluye:

- Descripción/flavor text en diferentes idiomas
- Categoría (ej. "Pokémon Semilla")
- Ratio de género
- Tasa de captura

Para obtener estos datos en la pantalla de detalle, se llama a `/pokemon-species/{id}`. Las descripciones vienen en múltiples idiomas; se filtra por `es` (español) con fallback a `en`.

### Llamada 5 — Datos de tipo con `/type/{typeName}`

Para calcular las **debilidades** del Pokémon (qué tipos le hacen doble daño), es necesario consultar las relaciones de daño de cada tipo. El endpoint `/pokemon/{id}` devuelve los tipos del Pokémon, pero no sus debilidades.

```dart
// Para un Pokémon con dos tipos se hacen hasta 2 llamadas en paralelo
final typeResults = await Future.wait(
  pokemon.types.map((type) => _repository.getPokemonType(type.name)),
);
// Se aplican multiplicadores y se filtran tipos con multiplicador > 1.0
```

### Resumen de llamados

| # | Endpoint | Cuándo | Por qué es necesario |
|---|----------|--------|---------------------|
| 1 | `GET /pokemon?limit=50&offset=N` | Paginación de lista | Obtener nombres e IDs |
| 2 | `GET /pokemon/{id}` (paralelo) | Por cada Pokémon en lista | Obtener tipos para badges y color de card |
| 3 | `GET /pokemon/{id}` | Al abrir detalle | Stats, habilidades, sprites |
| 4 | `GET /pokemon-species/{id}` | Al abrir detalle | Descripción, categoría, género |
| 5 | `GET /type/{typeName}` (paralelo) | Al abrir detalle | Calcular debilidades |

> Las llamadas 2 a 5 son necesarias porque la PokéAPI sigue un diseño REST granular donde cada recurso vive en su propio endpoint. No existe un endpoint único que devuelva todos los datos necesarios para la UI.

---

## Stack tecnológico

| Categoría | Librería | Versión | Uso |
|-----------|----------|---------|-----|
| **HTTP** | `dio` | ^5.9.2 | Cliente HTTP con interceptores y manejo de errores tipado |
| **State management** | `flutter_riverpod` | ^3.2.1 | State management reactivo con providers |
| **State codegen** | `riverpod_annotation` + `riverpod_generator` | ^4.0.2 / ^4.0.3 | Generación de providers con anotaciones `@riverpod` |
| **Data classes** | `freezed` + `freezed_annotation` | ^3.2.5 / ^3.1.0 | Clases inmutables con `copyWith`, `==`, `toString` |
| **JSON** | `json_serializable` + `json_annotation` | ^6.13.0 / ^4.11.0 | Serialización/deserialización JSON type-safe |
| **Navegación** | `go_router` | ^17.1.0 | Routing declarativo con deep linking y shell routes |
| **Imágenes** | `cached_network_image` | ^3.4.1 | Caché automático de imágenes de red |
| **SVG** | `flutter_svg` | ^2.2.4 | Iconos de tipos en SVG |
| **Almacenamiento local** | `shared_preferences` | ^2.3.2 | Persistencia de favoritos y estado de onboarding |
| **Audio** | `audioplayers` | ^6.6.0 | Efecto de sonido en la pantalla de splash |
| **i18n** | `flutter_localizations` | SDK | Traducciones ES/EN oficiales de Flutter |
| **Testing** | `mocktail` | ^1.0.4 | Mocks type-safe para tests unitarios |
| **Linting** | `flutter_lints` + `riverpod_lint` | — | Reglas de calidad de código |

---

## Capas de seguridad

### 1. HTTPS exclusivo

Todos los endpoints utilizan HTTPS. No se realizan llamadas HTTP inseguras. La base URL de la API y el CDN de imágenes de GitHub usan TLS.

### 2. Interceptor de red con headers seguros

`NetworkServiceInterceptor` aplica automáticamente los headers correctos en todas las peticiones salientes, y está diseñado como punto de extensión para inyectar tokens de autenticación:

```dart
options.headers['Content-Type'] = 'application/json';
options.headers['Accept'] = 'application/json';
// Punto de extensión: inyectar Bearer token si se implementara auth
```

### 3. Timeouts configurados

Se configuraron timeouts de conexión y recepción para evitar que la app quede bloqueada indefinidamente ante redes lentas o servidores caídos:

```dart
connectTimeout: Duration(seconds: 10),
receiveTimeout: Duration(seconds: 10),
```

### 4. Manejo tipado de errores de red

`DioExceptionHandler` mapea cada tipo de error de Dio a una `Failure` tipada con categorías claras:

```dart
enum FailureType { network, server, unexpected }
```

Esto evita que stack traces internos o mensajes técnicos del servidor se propaguen a la UI. El usuario siempre ve un mensaje controlado y localizado.

### 5. Null safety y tipado estático

El proyecto usa Dart con null safety activado. Toda la deserialización de JSON pasa por clases Freezed con tipos explícitos, previniendo crashes por datos inesperados o malformados provenientes de la API.

### 6. Inmutabilidad del estado

Los ViewModels usan estado inmutable (Freezed). Ningún componente de UI puede mutar el estado directamente; todas las modificaciones pasan por métodos controlados del ViewModel. Esto elimina efectos secundarios inesperados.

### 7. Datos locales no sensibles

Los únicos datos persistidos localmente son:

- IDs de Pokémon favoritos (lista de strings)
- Flag booleano de onboarding visto

No se almacenan datos sensibles del usuario. Se incluyó un comentario explícito en el código indicando que si la app manejara autenticación, se usaría `flutter_secure_storage` (almacenamiento cifrado) en lugar de SharedPreferences.

### 8. Sin secretos en el código fuente

No hay API keys, tokens ni credenciales en el código. La PokéAPI es pública y no requiere autenticación. No se usa `.env` porque no hay secretos que proteger en esta app.

---

## Internacionalización (i18n)

La app soporta **español** e **inglés** mediante el sistema oficial `flutter_localizations`.

- Las traducciones se definen en archivos `.arb` ubicados en `l10n/`
- El idioma activo por defecto es español (`Locale('es')`)
- Se implementó una extensión `context.l10n` para acceso ergonómico en toda la app

```dart
// Acceso a traducciones
Text(context.l10n.navPokedex)
Text(context.l10n.resultsFound(count))
```

Las descripciones de especies obtenidas de la PokéAPI también se filtran por idioma (`es` con fallback a `en`), mostrando los flavor texts en el idioma activo cuando están disponibles.

---

## Tests

El proyecto incluye tests unitarios y de widget organizados en la misma estructura que `lib/`:

```
test/
├── core/
│   ├── pokemon_type_test.dart       # Enum de tipos y colores
│   ├── result_test.dart             # Tipo sellado Result<T>
│   └── string_helper_test.dart      # Utilidades de strings
└── features/
    ├── pokedex/
    │   ├── data/                    # Serialización DTOs, repository impl
    │   ├── domain/                  # GetPokemonListUseCase, GetPokemonDetailUseCase
    │   └── presentation/            # PokedexViewModel, PokedexState, pages
    └── favorites/
        ├── data/                    # FavoritesLocalDataSource, repository
        ├── domain/                  # GetFavoritesUseCase, ToggleFavoriteUseCase
        └── presentation/            # FavoritesViewModel, FavoritesPage
```

**Estrategia de mocking:** Se usan las interfaces del dominio para mockear repositorios con `mocktail`, permitiendo tests rápidos y deterministas sin dependencias externas. Los providers de Riverpod se sobreescriben en tests usando `ProviderContainer` con `overrides`.

```bash
# Correr todos los tests
flutter test

# Con coverage
flutter test --coverage
```

---

## Uso de IA

Se utilizó **Claude Code** (Anthropic) como asistente de desarrollo a lo largo del proyecto.

### Cómo se usó

- **Scaffold de arquitectura:** Se describió la arquitectura deseada (Clean Architecture + Riverpod + Freezed) y se generó la estructura de carpetas y archivos base como punto de partida.
- **Tests:** Se generaron los tests unitarios describiendo los comportamientos a verificar, luego se revisaron y ajustaron manualmente para garantizar cobertura real.

### Rules aplicadas al trabajar con IA

- El código generado siempre fue revisado antes de aceptarlo al repositorio.
- No se aceptó código que no siguiera la arquitectura definida previamente.
- Se priorizó legibilidad y mantenibilidad sobre código "inteligente" o demasiado conciso.
- Se verificó que los tests mockearan correctamente las dependencias sin hardcodear comportamientos frágiles.