import 'package:go_router/go_router.dart';

import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/home/presentation/pages/home_shell_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/pokedex/domain/entities/pokemon.dart';
import '../../features/pokedex/presentation/pages/pokedex_page.dart';
import '../../features/pokedex/presentation/pages/pokemon_detail_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/regions/presentation/pages/regions_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'route_names.dart';

enum BottomNavTab { pokedex, regions, favorites, profile }

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/${AppRoute.splash}',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/${AppRoute.splash}',
        name: AppRoute.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/${AppRoute.onboarding}',
        name: AppRoute.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeShellPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.pokedex}',
                name: AppRoute.pokedex,
                builder: (context, state) => const PokedexPage(),
                routes: [
                  GoRoute(
                    path: '${AppRoute.pokemonDetail}/:id',
                    name: AppRoute.pokemonDetail,
                    builder: (context, state) {
                      final pokemonId = state.pathParameters['id']!;
                      final pokemon = state.extra as Pokemon;
                      return PokemonDetailPage(
                        pokemonId: pokemonId,
                        pokemon: pokemon,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.regions}',
                name: AppRoute.regions,
                builder: (context, state) => const RegionsPage(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.favorites}',
                name: AppRoute.favorites,
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/${AppRoute.profile}',
                name: AppRoute.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
