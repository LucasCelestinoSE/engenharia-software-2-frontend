'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "2fadc561b29fbb3d6b8be7bb521db029",
".git/config": "361f36a9018cae8ae53010ba0934222a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "2d13a97fc502833643b6acd20900a49c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "a6081512b51e70036607448dcae36184",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "8cdb5a36c8d183131fb88daea9f9ffd6",
".git/logs/refs/heads/main": "da4ee65ea9b22cbd52268c3358da6c2f",
".git/logs/refs/remotes/origin/HEAD": "86dde624ef292907a38bbd8cc39d8464",
".git/logs/refs/remotes/origin/main": "235d70ca5fbb353ae0a674e1999e655a",
".git/objects/11/6f6e6f34e954eaa5fab0a10a972e368c7e28e1": "ae99f9f826ea7077e57377dfeb50a63d",
".git/objects/17/fe7933c8b5779300b7d2636c3a40108a650b32": "ec874635e3a4de8a9726fea77555b5ed",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/22/94ebf40ebff0048b364c95c1dc3d034a1cf7a2": "9a22fbd83aadfce288b74541115308d1",
".git/objects/2a/7fcc77f1a45681d97a56806869b726a14d593a": "c5b650c760a28f75aaf2824739bec684",
".git/objects/2b/812b247c9a668b91ae6754f29480920a1526a3": "f7b3a31d74fc1f0dcada002173970724",
".git/objects/30/6f239d71727fcd0217af3e3b4fe42ac6d26623": "db11c4239153286ce242a3bfb62afc52",
".git/objects/3f/fceee947bb36c37f7947f883d17707a815429e": "0c49a850cadcf02147efff4ab2e8399e",
".git/objects/42/4375b1f72fb8118461f7a385d1017ecee4ea0f": "30e4c1921899a1b704685fdf3a194efd",
".git/objects/46/04540006b8a9ae65a95eef068700420b1793d9": "1c29bca05980a95d186cdb1b4f43473b",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/51/60e0a376053b1f1c73e7e4346b6b4d3157308e": "d12e58b600222efaba129c8976fb3f34",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/56/745254fdafd5a9dac1522b098894416ea46850": "1e9a7db6652354067301de4b5861e4de",
".git/objects/5b/29c798a9216d00b0f76f51fd05fc7f006120ad": "a7339852a87fbb03d3a6c9e65ce04389",
".git/objects/60/271ce9088a1bdf9ad4bf8efa1bd9993539490a": "265120ff77718917f316a602fa79003c",
".git/objects/63/5021942fb159f6a8555576ab84aaf938f3cb2a": "ce7d429deabc2279367febba1348f1b6",
".git/objects/6a/54716cfbb46cf4e3bf2d5a77283ace0cf59b45": "9f638cefee84c14708dad945373f37b0",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6c/51718d3cdf561a50808907b962cae1be7490b0": "c67f1d7be95970b2a7d604244be9d11e",
".git/objects/6d/36c919fa6ba781788667f3e70d5c94d6679ea9": "b7809a4bec7033c7f5da4f6bc09e8ba9",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/76/9d35f84db13ab3c1b12faa192d651e415896f5": "cf003a5ff3fdfc76cbaee9e618b369f1",
".git/objects/78/c1d28aa6e17f0d78e81cc6cbb3a318df2af811": "e5bd087e65d5b2f5db2e9e178375cca6",
".git/objects/79/1d27f8ab35be83ee2a9fab97ba380d04f1604c": "4e0690d3c2abdbdb3d731c23a512a419",
".git/objects/7f/a6541c52358797808e81b701cc7886d4337de3": "d2d6a95a1a1aeb276acf2bea19b44653",
".git/objects/80/01c78014e6010ef6dd3ccb9384ab29e4f67070": "dd41ff042c6c268539ff9db72210ab5b",
".git/objects/80/56679a83a77d96ec45092828abc88a58e330c7": "aa9f4bffb2b70ed48d51861df34e72c8",
".git/objects/85/a0551004372784f6c1d942837524afbb1f402a": "dcbd94479b73cf4b0d2e46f49b5342ee",
".git/objects/87/8c2c5bab3a941136b1ae0ec09dac25d4f592aa": "b06708ef39450f5ce802642fd518b960",
".git/objects/88/b1bb1d98e114a7123bb1cc17fddc3c18a08366": "7038bbd0f442e194a332a15c182d86d5",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/4fb75ec12608dec7d9819fa770b40c444224ba": "f524652386855c1951989e99b24def73",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/97/1a326b9f0d7a3e16f45e930e2c1ff5b09710f1": "344bc35c141cf114369861969932e6fa",
".git/objects/98/4163d79c348ddd23cca96e52ee5247b1c0cb0e": "763497c7a5bb87db1ba69d6167060418",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/a5/5a31ee2631a68b977be375ed655f1c1a6dc3c3": "a26d46d5d2d6558ea9c82afc402d2f3f",
".git/objects/af/e48e83255e078f458ab897a985a44d412437a9": "7a43fcab30493b6bd97e27b52740c49d",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/ba/4fd3f8f1b3cb7ceb20ff1049558c1b0278d30c": "5c6f8d36f2bc9f6b6dcd92de6bce6dca",
".git/objects/ba/b7df5a74589c949afeee8cf8943791334d1b0e": "0b56cdc8f91b7d1d78ac2be229f86b61",
".git/objects/bb/187f41be0b4bf14583afcef15e8ea027c3ce3c": "d386149e88e2ec82d8b1a50c1d3ca096",
".git/objects/c2/0ecdc8046ad904ba04b5975bc59feabb5a54f1": "72c90e2096c572ddfbd222716322e874",
".git/objects/c2/5e16093c5cfaddacdb6d5532d2945333b2b5ee": "082918ef3e3e6c7fcc9cd2f41840c8aa",
".git/objects/c3/4a124afaed23a430754691d42130d632b32ebc": "0f5a3e15a3615a87645a7a8b874ee04f",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/cd/c444995336b7685b1e0b65c93f95830f5065d4": "811815442c51643af2a49eae309dcbbc",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/dc/789af2e52edd51220a6d4630c5655c40be4596": "415a03ce6ba060d924a8707b6d9493c9",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e6/8bd5983e8c2ed6af6752c47e537a361c7d6103": "88b02654aad6dfab8bf4cb27c379be18",
".git/objects/e7/8708731de6afbf496524c62154540ffbeb5395": "65f3763ebadbc962862d9a85080e443d",
".git/objects/e9/3e44664c10674e1602ae35052b8b3e7a534158": "53afc8f9614026dbcc72db2956f039d3",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/a3aa112e42459136cfc6f2272c9ced9580d9c2": "fd02d318ed120c99c22568d5d0fdb484",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/ae1cf50a4dd85e222be5993c0f53c2b86d2840": "bb11d2932878b53a0a2ba32a772dd32f",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fb/329d8a18508277d3c683e4da332a70c4880ff3": "5e9a4a0b08292439e3f6f2ab462782b3",
".git/objects/fc/5989715e2cfee86e2ca635ec576444403651f3": "54471b821dabab2234260356d7b01edc",
".git/objects/fc/ec4197de44e5fddb819f2e9864334adca67daf": "080be57495a662e276cca08663eb973d",
".git/refs/heads/main": "fe51791a004c8327968897ba7d3144c3",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "fe51791a004c8327968897ba7d3144c3",
"assets/AssetManifest.bin": "1be8990859d62bc71eec8ff7ed67d7fc",
"assets/AssetManifest.bin.json": "265cfaf3602c085fbee4b154c7c71c19",
"assets/AssetManifest.json": "35b4406037112809ac8d24ce8962f6af",
"assets/assets/images/correct_icon.svg": "c4f766f74b47a0e8d49703e19d9b83b7",
"assets/assets/images/emoji_amarelo.svg": "61fbad8ccb1119adcaaf9f463eb2042a",
"assets/assets/images/emoji_azul.svg": "0b8573f59d84fc1ac89b203b4f7fb77a",
"assets/assets/images/emoji_cinza.svg": "2a0ad663563702344518964cc2c139cf",
"assets/assets/images/emoji_verde.svg": "32711a931e4c984cbaf47bc041116cdb",
"assets/assets/images/emoji_vermelho.svg": "d0bc4bd67de46285dadaf7c88ff0d74e",
"assets/assets/images/foto_perfil.png": "647160bfc06fec5965336aa66b67fb9a",
"assets/assets/images/hand_icon.svg": "da2b41c6ae6817487725eddb35542e0f",
"assets/assets/images/header.png": "5a8a6e52b53f222b4e3ed5b83e95e540",
"assets/assets/images/header.svg": "9cea62c08301583111a4d4cc02f97b17",
"assets/assets/images/inital_image.png": "45657e4fd16b261a507c7b8c74b23c46",
"assets/assets/images/initial_image_tree.svg": "cb9a4b69b4f2963a9933c6765106ab29",
"assets/assets/images/notification_icon.svg": "573968773c9dfb908edc8b76deb34696",
"assets/assets/images/person_icon.svg": "eb24433bfc768bd6350c118caf224f4e",
"assets/assets/images/s.svg": "0ba0503d427d66e4cfe5b7c438060ed4",
"assets/assets/images/verificado.png": "77a79403cf335a848637099be938166d",
"assets/assets/meditacaoGuiada.mp3": "efb424d76f0c96e5eeb1dad7f9957f17",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "cb74a095e04bd15bdabc3c183a32e4cf",
"assets/NOTICES": "3df26907577b38da4127429b81459a27",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "b78fbab253df526babd334906a765ab0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2699583c5ccd8c8518317fd595fe6cbf",
"/": "2699583c5ccd8c8518317fd595fe6cbf",
"main.dart.js": "b28c3742374b667aae84c9a35e48fc46",
"manifest.json": "f744b2bd4163c4c1494e36855a222c72",
"version.json": "f4ca56354af0450d6898a6e1e636de90"};
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
