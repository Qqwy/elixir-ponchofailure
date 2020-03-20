An example of how using a mix task alias in a local dependency can break the mix building process.


To reproduce, do the following:

```
cd releases/main
iex -S mix
```

This will result in something along the lines of:

```
Erlang/OTP 21 [erts-10.0.5] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

==> otherapp
Compiling 1 file (.ex)
Generated otherapp app
==> webinterface
building JS dependencies for the development environment
npm WARN assets No description
npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@1.2.12 (node_modules/fsevents):
npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@1.2.12: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})

audited 15245 packages in 5.814s
found 7 vulnerabilities (2 low, 4 moderate, 1 high)
  run `npm audit fix` to fix them, or `npm audit` for details
Hash: 1fc94cc9b786e491ad40
Version: webpack 4.4.0
Time: 482ms
Built at: 2020-3-20 21:01:38
                Asset       Size       Chunks             Chunk Names
       ../css/app.css   10.6 KiB  ./js/app.js  [emitted]  ./js/app.js
               app.js   7.26 KiB  ./js/app.js  [emitted]  ./js/app.js
       ../favicon.ico   1.23 KiB               [emitted]  
../images/phoenix.png   13.6 KiB               [emitted]  
        ../robots.txt  202 bytes               [emitted]  
[../deps/phoenix_html/priv/static/phoenix_html.js] 2.21 KiB {./js/app.js} [built]
[./css/app.css] 39 bytes {./js/app.js} [built]
[./js/app.js] 493 bytes {./js/app.js} [built]
   [0] multi ./js/app.js 28 bytes {./js/app.js} [built]
    + 2 hidden modules
Child mini-css-extract-plugin node_modules/css-loader/dist/cjs.js!css/app.css:
    [./node_modules/css-loader/dist/cjs.js!./css/app.css] 284 bytes {mini-css-extract-plugin} [built]
    [./node_modules/css-loader/dist/cjs.js!./css/phoenix.css] 10.9 KiB {mini-css-extract-plugin} [built]
        + 1 hidden module
==> main
Unchecked dependencies for environment dev:
* otherapp (../../apps/otherapp)
  could not find an app file at "_build/dev/lib/otherapp/ebin/otherapp.app". This may happen if the dependency was not yet compiled or the dependency indeed has no app file (then you can pass app: false as option)
** (Mix) Can't continue due to errors on dependencies

```

Note that removing `:otherapp` from the dependencies resolves the issue, 
as does removing the alias in `apps/webinterface/mix.exs`.
