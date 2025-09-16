'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "53016abac6f2a935e33246608a5af899",
".git/config": "39daae38fc0d8d765ec490e373d92246",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "8d0edaa18e4441225dcf4a7aeedde398",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "36daa0ac92e36a43322d62a71ce80e76",
".git/logs/refs/heads/gh-pages": "839b72f55ce955bc97451773a186555b",
".git/logs/refs/heads/master": "b195e7b1f86ea40da8ecf449b0a48d45",
".git/logs/refs/remotes/origin/gh-pages": "b5f7d531010cc50a7723aeb034f83749",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/04/561ec7bcb2e06a271dc4d433938005292df515": "ca1ea25439e6c6db42dc49cc1503af31",
".git/objects/05/f94372161f7734ab9ec39239352fd1a0e00c5c": "873e6115c72c2c24a7c44f3e96c5782a",
".git/objects/0b/5cab8c2c93ae8789ca36e50b87e5814f63bc7e": "5dbf3fe5ec5b001148c00e1809613645",
".git/objects/0c/cdf1e107a0f71804bc5c6b427f7c22eb9dc7f2": "7d3007e1617ad0d1303cf6a59673c6c3",
".git/objects/16/79a363f6517956d8eef274bdf4be4ae1fc36ee": "a875dbfbf2a482754fafdcc51d14e844",
".git/objects/18/ba83c9c54e177418c3f25fe753a36fd60ce363": "28d44cf2439f980e17f485773850a84a",
".git/objects/19/dddab461d73b89ee57a15aaed66644e3c21b25": "e70e7b4198d8fc8a5ea5a2334466621c",
".git/objects/1b/f662e80d9b344de1921cacf5594e7cb186dd81": "edebae00a794b670c5e02ad63abb8e92",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/26/9fdc25f3e465b7999414cd0876187e3921a36e": "f657fcfa2772946f68017905850537b5",
".git/objects/27/1f1ea741141d482ac8bb5cc3fa75654bee79ad": "346745cf15f2ddef653cc1880b3dc2ae",
".git/objects/27/613e73a8ec8c52314cd5d66e65b1d63e27cfe8": "e7fb61e2eadad0bd2de56209a5b28186",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/2e/16007bb524007e30a828b74490e0b845e17a13": "ee61cd33aef6c480243f04c330777479",
".git/objects/2f/70a62e376129917ebc45d65819acf13281a766": "19b456a9633924715422ca089da2bc03",
".git/objects/30/6942dc5bda024438722d4da845f397d2b10e14": "682a06660c7a1bece06811374e7444ab",
".git/objects/35/4518fd42d5e5660657b36f8e51a8743540b7db": "1446affb06e10023986b5d4d3df70fc4",
".git/objects/3d/ceea456d6b247bbeecc8ea56494ceeef623e55": "51b4f9e651840035e3e648741d0874f7",
".git/objects/41/cb3807e49b243f646704458a6cba1a9d134d9f": "0f8c388d219bf646e6e6f8e807c88421",
".git/objects/44/ccf8bc0da885d6a508cc85bbd6a033f060e78f": "e711a983e0be887e9f95cfc7ebd2ce57",
".git/objects/4b/982ec94f6bd02c03db5ca16935e05ba76ef53f": "f25648bd159a06f7a5ae81d976ab5c0f",
".git/objects/4b/aeebc809a5e523bf5577925cd211f43c9eeef6": "dff1179ff884bf9f3625f02b7c2b98af",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/53/9c554b5792a3a1d670224a8e9bbf8190632db4": "466ccb6a96fae7ea111f8e06e296e36b",
".git/objects/57/2c168535652258e624673e9c8d0e08e868cd34": "9cb2c8c2d9184e78dd312056ca09a58f",
".git/objects/65/8259c2a4a88ae6d97454646e8f909dae05210a": "228857fd17eb2ce8eb93cec6ad507161",
".git/objects/67/c6d0f19a1e3902e6a7b5c5c878ee33bc7a7b07": "9cf1235fc9b12d50f47047d500091d0f",
".git/objects/68/4ebd569fbeb890b1d8d3ce73cfdf3bb4d78022": "5426d825b86be5392670df2e71e30aa0",
".git/objects/6a/95c6705527c592620a73bd5edc0807593fdd10": "dd8f4b4ca3ce73bfe86ab34c5bf85559",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6d/e699e7d8a5c33612134f300efb62492591dc3d": "8ef72e528bbbf8ee9ed4267de1522ac2",
".git/objects/6d/f2b253603094de7f39886aae03181c686e375b": "4e432986780adf1da707b08f0bc71809",
".git/objects/70/a6afb809d588470d110ca2e31576c51633dedc": "2441c9bb5a90777716147377f2f8f8a7",
".git/objects/72/7c3cb721dd33abd674a8f166628de3f7617646": "f9e1694120b51f1cd6c02d79fc667ab7",
".git/objects/73/6794cdec8f97d685b038d44c3120a4934ddaf5": "e7fe3fe9f9aaeb9b7de35d8cd4295dc7",
".git/objects/74/c2d22f4715d194d0aa07597ebeae235ea9d4a1": "3e684d69188bcef1b9a0e91acd9e3cc0",
".git/objects/75/925f12def0b4dcb54cf6a57f46641111f5a4c5": "5d419936a37255518403a7df6dd394c5",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/80/606c2149e3277055d937322548290c38086ac5": "81cf612de8315d585b2047c400ae669e",
".git/objects/83/044cfd35be1bebe511104906be27722f67c8e3": "66c9819e279e3fe36d8fdcf5e2738dce",
".git/objects/86/786dfa2e8e57ff028204c8f28e51bde35424ad": "ae6779db062a0c5c1ea9627a6bb01108",
".git/objects/8b/72434c976f4dd8f9851e2b12743a98b50d0e1b": "9d9194c20327dbdce964ed5bcbbe8864",
".git/objects/8e/03552ed1752adaf331ebefb188ce624a616460": "b09cb0666e2c842e2794d910f70a3f3f",
".git/objects/8e/7634d0a83766e88bafffc9742b9b8734ddee7d": "73fc539ad7665c3a35209e045e8bc169",
".git/objects/92/eb9a932c7da7685a26ea896bff56bf42f54569": "0c95eb263915038b228cced06bf80f06",
".git/objects/95/15c81c03ff5a1c7f655f1989ac24e1cdfb8081": "a98fc092d6e7e70642fa8fc797e697f9",
".git/objects/96/6420b17eb45e3164ab887173bceecfec740605": "6192d1863a3d6cc1e2298e9664f78629",
".git/objects/97/b6eee463de5e4fcf79c6570e4173f50eca81d5": "b58977ec52e0607f13c5710fd432ef21",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/aa/a026dff6ab0598acbcf26ca2db796c81daf6ef": "cf9f37d4d956e83101bf5bc97771e9ef",
".git/objects/b2/65ed4d1aeed8cefebd1168b81a6ffb368b0cdb": "1bb905c1172188cf1c3a2e9fa123dccf",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b9/f3492df2246ac74a35c1cf49ec8590c46f0c37": "89496a3087b2c3dbecc6c6bc2f6dfa53",
".git/objects/bd/b00e6faa9a0e6e5c36cbae405dae4a5bd73e51": "5fbdc7629e53bc2bc89261437bf2f572",
".git/objects/bf/2435860466318b16d2145dc0117a2d1e90a968": "70e5d82bdd65b2fc131a9ee5fc97c7da",
".git/objects/c0/04e3d60c65e25553a749590fb6c86f63f7f109": "e096d7abe275a973541ceedf3cdca090",
".git/objects/c1/15e11a8d36c386ccf9375c2bf6d334c1b55d24": "65ab93a5041717084d765d126f40e90b",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/ce/8f3f60f936959d2b26dee6f8d47079c57d3c53": "604b7dec4d329cbd27236883b763692f",
".git/objects/ce/ab6e27d9a7aeeaa0a6ab83c25070388de29df5": "89e0d51bc016da953da1bc5894373310",
".git/objects/d2/3dcaa7da90318e92326d348cd37d940b5bf85d": "5efe3676c91689d14fe9b2e378947ce6",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/98f4740749229e0203bff244ca8631d31b1b94": "b787b7b4ab9ca140ec97741d1099f277",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/1e9624f2617a504f9ea7257e615f913c04bbc5": "2618d5a914ed37dd2d819d2c4d9511b1",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/4024d96402828cad320fe2fca94a7baf4f3f1f": "8eedf059a2473a4409050a724cc0d734",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f1/d15b2e5851a44bf7159fb12d7abdcafa3c82d7": "c5668f72d2dc59419b8267e20152f6fe",
".git/objects/f1/d663e82e1bafff741de281a9edbb0f46f8b866": "f79a94c6b83574e47886d4889e6a20af",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f9/198dfd1918f938c8712560acd88168be1ed83e": "f416218d49af45e8e0a9fa054b5ca7fe",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/fe/6c883bef19da0b14fa803223693fb8c93b20f9": "d92c6c19a874e6f7e9079cf93f57f5f7",
".git/refs/heads/gh-pages": "522ac152d5f64951074ac57ccf512b90",
".git/refs/heads/master": "7089ef7bf21600745a673379949d8c46",
".git/refs/remotes/origin/gh-pages": "522ac152d5f64951074ac57ccf512b90",
"assets/AssetManifest.bin": "97df64b608d7d42555a3c6916cd174d0",
"assets/AssetManifest.bin.json": "151386763c473c7f95ed9faad20972fa",
"assets/AssetManifest.json": "7bf7aeec7517ea0c9cf324b8771726fb",
"assets/assets/cv/OmaymaITTAQICV.pdf": "d15c28f451b663b07faab7edce1903d5",
"assets/FontManifest.json": "2b52acee7bee9f34d372a965ef37754f",
"assets/fonts/MaterialIcons-Regular.otf": "368465043d3f6b49c971818a4b12449f",
"assets/lib/assets/icons/icons8-github-100.svg": "edd2906685e30d7b5ea8febe2a4bcec0",
"assets/lib/assets/icons/icons8-gitlab-100.svg": "6807c1b59ff7f4f2573b30d82e762a06",
"assets/lib/assets/icons/icons8-gmail-96.svg": "2677eee145226619d39e771d22a7ce2e",
"assets/lib/assets/icons/icons8-linkedin-100.svg": "2fa056c3a645bacdb31d62f493a33878",
"assets/lib/assets/images/profile.png": "807ddd6f1e61641679211d75c1d58fc0",
"assets/lib/assets/projects/lsAgency.png": "b9aa5b5772506003ebe7934a7feb7f97",
"assets/lib/assets/projects/meteo-logo.png": "69fcb9e524bb742657bce162bcc182c6",
"assets/lib/assets/projects/MyBookShelf.jpg": "4d3b5f707ee07ffd3306491290e5508f",
"assets/lib/assets/projects/MyBookShelfCover.png": "9a09a0130822acb82cf18d37540bfe08",
"assets/lib/assets/projects/OCP-logo.png": "20ae8c33e3f44dd6f05ae2ef7ee3c35c",
"assets/lib/assets/videos/appMeteoDemo.MP4": "cd1438136b38d668925e251c1f5032e1",
"assets/NOTICES": "f4525e3d4712ffade3182cd633b5c398",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/syncfusion_flutter_pdfviewer/assets/fonts/RobotoMono-Regular.ttf": "5b04fdfec4c8c36e8ca574e40b7148bb",
"assets/packages/syncfusion_flutter_pdfviewer/assets/highlight.png": "7384946432b51b56b0990dca1a735169",
"assets/packages/syncfusion_flutter_pdfviewer/assets/squiggly.png": "c9602bfd4aa99590ca66ce212099885f",
"assets/packages/syncfusion_flutter_pdfviewer/assets/strikethrough.png": "cb39da11cd936bd01d1c5a911e429799",
"assets/packages/syncfusion_flutter_pdfviewer/assets/underline.png": "c94a4441e753e4744e2857f0c4359bf0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "14159505df7e9688caa198a55d4215fc",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "7948f10e34612d0b3f689132a427e0ab",
"icons/icon-192.png": "929a69cbced169c4395786e8fd4a05b2",
"icons/icon-512.png": "7bf1305c8e42ce35d52f5b2757ad7a57",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/maskable-512.png": "7bf1305c8e42ce35d52f5b2757ad7a57",
"index.html": "67bb1a22ef9407c254219e993f87fe30",
"/": "67bb1a22ef9407c254219e993f87fe30",
"main.dart.js": "7c3c457d9e45766e9c8f2f11ff54afa5",
"manifest.json": "bcc2ed030a901a5a51599ff983814636",
"version.json": "d02225c28af61dfa2ed5fe64f9c0ae2a"};
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
