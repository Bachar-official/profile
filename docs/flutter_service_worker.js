'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6b0a144a5b61f06be8355edb9ac6b8b6",
"assets/AssetManifest.bin.json": "fa92ccd4b79f590b1d0f9cbf1ed22a41",
"assets/AssetManifest.json": "9fb21dd156d06ec6405befd33f93c119",
"assets/assets/flags/EO.jpg": "ac1b884061473da1902447eb239141b7",
"assets/assets/flags/GB.png": "bac8b4136b41545bc2c3328b300ab049",
"assets/assets/flags/RU.png": "4efebad94ffa6d17481d2802586b84a0",
"assets/assets/fonts/OpenSans-Bold.ttf": "50145685042b4df07a1fd19957275b81",
"assets/assets/fonts/OpenSans-BoldItalic.ttf": "78b08a68d05d5fabb0b8effd51bf6ade",
"assets/assets/fonts/OpenSans-CondBold.ttf": "c28df5d67b8e0fd14ff07235537b1c77",
"assets/assets/fonts/OpenSans-CondLight.ttf": "78a0d7e644be8aa2110679f957a5b0db",
"assets/assets/fonts/OpenSans-CondLightItalic.ttf": "41ed7255ac9480384eaeb613726802a5",
"assets/assets/fonts/OpenSans-ExtraBold.ttf": "8bac22ed4fd7c8a30536be18e2984f84",
"assets/assets/fonts/OpenSans-ExtraBoldItalic.ttf": "73d6bb0d4f596a91992e6be32e82e3bc",
"assets/assets/fonts/OpenSans-Italic.ttf": "c7dcce084c445260a266f92db56f5517",
"assets/assets/fonts/OpenSans-Light.ttf": "1bf71be111189e76987a4bb9b3115cb7",
"assets/assets/fonts/OpenSans-LightItalic.ttf": "6943fb6fd4200f3d073469325c6acdc9",
"assets/assets/fonts/OpenSans-Regular.ttf": "629a55a7e793da068dc580d184cc0e31",
"assets/assets/fonts/OpenSans-Semibold.ttf": "33f225b8f5f7d6b34a0926f58f96c1e9",
"assets/assets/fonts/OpenSans-SemiboldItalic.ttf": "73f7301a9cd7a086295401eefe0c998f",
"assets/assets/fonts/symbol.ttf": "abcec08d1f89ef9540cd5a7281a3fae5",
"assets/assets/photos/avatar.png": "94cafb0ff3bf5d45c2cb33ca7f0665b3",
"assets/assets/services/email.svg": "eaeb9e0aa7a151410785ae00eea37429",
"assets/assets/services/github.svg": "e93ce4901b284ed2de89565dab5d5605",
"assets/assets/services/location.svg": "3bf4d9fc8f2f0f35efb3b6fc68583ca7",
"assets/assets/services/telegram.svg": "a22a3f5338cb69187aacf590b1a536f4",
"assets/FontManifest.json": "fc00e2b859eb65dab5336ac59e90bec4",
"assets/fonts/MaterialIcons-Regular.otf": "df6eb9309e2579a48f5c1cb09632e995",
"assets/NOTICES": "857b88dd2ade870bca79e168d091e7b8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "9abfb1f4cc4a0f9bcfa871e83fd533ef",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "2936d6ec8830a0f24b8175917e013087",
"icons/Icon-192.png": "8c53b4ebdcc8b9b75202a1f7cb4261ab",
"icons/Icon-512.png": "bed19e5fc1071728d9f814352db7c064",
"icons/Icon-maskable-192.png": "4f529c35a42effec02600953dd71d3b2",
"icons/Icon-maskable-512.png": "2b0dc58255f932192b4b656b9a6942fd",
"index.html": "a0400bf32326080cfb292d1bf3ab49ec",
"/": "a0400bf32326080cfb292d1bf3ab49ec",
"main.dart.js": "73e539915912000b3afc8f2aec08f2eb",
"manifest.json": "c135fcc0f33041d4ddc442f169cc3ef5",
"version.json": "ed4196a263a7919322bbf877a1c4ca63"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
