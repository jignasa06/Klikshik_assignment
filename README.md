Klikshik — Event Album (Flutter)

A small Flutter assignment app that demonstrates UI, API integration, state management (Riverpod), and Git workflow.
Implements: mock Google auth (mocked), loading flow, events list, album grid, full-photo viewer with like toggle, slideshow mode, and a unit test.

Demo / Figma

Figma (design + prototype):
https://www.figma.com/design/HBi5bzcDwy303jDLqEBbMS/Assignment---Flutter-Mobile

https://www.figma.com/proto/HBi5bzcDwy303jDLqEBbMS/Assignment---Flutter-Mobile

Features

Auth screen (mocked Google sign-in)

Loading screen

Events list (fetches from MockAPI or local static JSON)

Album grid per event (fetches photos filtered by eventId)

Full-screen photo viewer with:

Like / unlike (per-photo state via Riverpod StateProvider.family)

Clean folder structure 

If HTTP fetch fails:

Verify the exact MockAPI endpoint in a browser.

Notes & future improvements

Persist liked state to local storage (Hive / SharedPreferences) or backend.

Improve image caching with cached_network_image.

Add pull-to-refresh on the events and albums screens.

Add animations (Hero, subtle scale on like tap).

Add error retry UI for network failures.
