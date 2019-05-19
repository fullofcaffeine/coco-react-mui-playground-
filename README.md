## Learning experiment. Not suitable for production use.

Almost the same approach as https://github.com/haxe-boilerplate/pwa-ts-haxe-sample but without hxgenjs. Requires classes that will be used from js/ts
to be @:expose'ed and splits the build.hxml into two in order to generate two haxe js bundles - one for the client and another one for the server (we could
have kept a single hxml and a single bundle, though, but to keep things more organized and simpler, I found it better to split).

* Current status is: It could be used as an example of TS<>Haxe interoperability or a base for a better boilerplate, but since hxdtsgen doesn't
work well in all cases, the benefit of this boilerplate is limited.


# FAST FullStack TS + Haxe experiment

This is an ongoing experiment. At the time of this writing, the actual app is a sample/exercise websocket app, so not much to see there in
terms of features. The actual app doesn't really use Haxe, the experiment with Haxe came later, read on.

The actual client is served by Express (dev/prod). On dev it proxies the webpack dev server, on prod it serves the
static files. A self-contained self-servable SPA like this makes it easier to deploy it in PaaS solutions like Heroku. It's also easy enough
to decouple the serving of the client from the server, if needed, in the future.

# TS<>Haxe experiment

The idea is to apply the paretto principle to Haxe and use what works and is easiest 80% of the time and Haxe 20% of the time for the use-cases
where it is really good for or when you feel like it. The focus for this version of the experiment is to:

1) Find a way to - as much as possible - transparently integrate Haxe in a TS/Babel project;
2) Make the Haxe class - as much as possible - 1st class TS citizens.

For #1, we create a `hx` folder under `src` that mirrors the structure of the `ts` source folder. `hxgenjs` will then generate the files in the
correct places, providing the package name for the Haxe class matches the destination folder, and you can then require it from ts. 

For #2 we use the TS definition files that are generated by `hxgenjs`. Check the contents of `build.hxml` to understand how it's done.

## Why
Because TS is nice and Haxe is awesome. It's much easier to start with ES/TS since most of the docs and examples out there are based off it. 
Also, most of the client-side frameworks and libraries are available for TS with type-definitions. It's much easier to build your app infrastructure
with ES/TS and only then researching where Haxe could help. If it can, then the goal is to make it as smooth as possible to switch between and use both
from each other, as needed.

# Running

Tested with Haxe 4.0RC2.

1) Install Lix https://github.com/lix-pm/lix.client#downloading-all-dependencies;
1) Install Haxe 4.0RC with Lix, if necessary: `lix install haxe 4.0.0-rc.2`;
2) Download haxelib dependencies with Lix: `lix download`;
1) haxe build.hxml;
2) yarn;
3) yarn dev.

Then:
1) Search for the output in the shell: `[SERVER] src/hx/server/SuperServerComponent.hx:7: Hello from Haxe running on nodejs from a js file compiled by tsc!`
This it the Haxe class being called from a TS class on the server.
2) Access `localhost:3000` in a browser, open the console and search for a similar message. This is a Haxe calss being called from TS on the client.
3) Play with the app if you want, although the rest doesn't have to do with Haxe at this point :)


# Outstanding issues

1) The definition files generated by `hxgenjs` seem to generate very poor type data. Everything seems to be `Any`'fied. 
2) Since there's no Haxe source for an entry-point (the entry-point being a regualar js file that already exists), the `main.js`
generated by `hxgenjs` is not needed, but is still generated (in blank) and I did not find a way to prevent it from being generated yet.
3) Haxe compilation is still manual and not part of the dev / build pipeline yet, but this is easy to solve (will do in the next iteration).
4) `hxgenjs` automatically generates the TS "externs" (d.ts) for each Haxe class, but if there's a need to use TS from Haxe, Haxe externs still
need to be written manually, it'd be nice to have a process part of the build pipeline that would go through each .ts file and generated an extern so
that the communication would be 100% bidierectional and transparent.
5) I did not find a way to tell the Haxe compiler to include all the packages available, so I had to specify one-by-one in the `build.hxml` with the `include` macro.