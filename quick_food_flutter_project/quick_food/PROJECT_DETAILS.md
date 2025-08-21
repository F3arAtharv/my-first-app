# Project Detail Form — Flutter Android App

**Project Title:** QuickFood — Minimal Food Ordering App

**Objective:** Build a well-structured Flutter app (4–5 screens) demonstrating core concepts taught in lectures: widgets, state management (Provider), navigation, forms/validation, async/asset loading, local persistence, theming, lists/grids, basic testing.

**Target Platform:** Android (minSdk per Flutter default). Also runs on iOS/Web for demo.

**Primary Users:** Anyone browsing and placing a simple food order (demo).

## Features (Core + Extras)
- Product catalog (loaded from local JSON asset)
- Product detail page
- Cart with quantity updates
- Checkout form with validation (name, address, phone)
- Local persistence of cart using SharedPreferences (async)
- Drawer navigation + About dialog
- Material 3 theming + simple animations via default transitions
- Unit test example

## Architecture
- **State Management:** `provider` + `ChangeNotifier` (CartProvider)
- **Data Layer:** Local `assets/products.json`
- **Persistence:** `shared_preferences` for cart
- **Navigation:** Imperative `Navigator` with `MaterialPageRoute`
- **Structure:**
  - `lib/models/` — `Product`, `CartItem`
  - `lib/providers/` — `CartProvider`
  - `lib/screens/` — `Splash`, `Home`, `ProductDetail`, `Cart`, `Checkout`, `Orders`
  - `lib/widgets/` — `ProductCard`, `CartItemTile`
  - `assets/products.json`

## Screens
1. **Splash** — loads persisted cart + products
2. **Home** — grid of products, drawer to Orders/About
3. **Product Detail** — info + add to cart
4. **Cart** — list, update qty, remove, proceed
5. **Checkout** — form + validation, place order (clears cart)
6. **Orders** — placeholder (can be extended)

## Packages
- `provider`, `shared_preferences`, `intl`

## Build & Run
```bash
flutter pub get
flutter run
```

## Possible Extensions
- Replace local JSON with REST API (`http`), add search/filter
- Hive for richer offline storage
- Animations (Hero, implicit/explicit)
- Theming toggle (dark/light) with persistence
- Unit tests for provider logic
```
