# appnap_on_powerstate

A shell script and launchAgent that disables *AppNap* if the AC adapter is
plugged in and enables *AppNap* otherwise. The launchAgent runs the shell
script to check the AC adapter status every 300s.


## Install

`appnap_on_powerstate.sh` is installed to `~/bin/` and `local.apppnap_on_powerstate.plist`
is installed to `~/Library/LaunchAgents/`.

```bash
make install
make activate
```

Optionally, use `make install INSTALL_DIR=path/to/local/bin` to change
where `appnap_on_powerstate.sh` is installed to.


## Uninstall

Stops, removes, and unloads the launchAgent. Deletes the launchAgent plist and
the shell script.

```bash
make uninstall
```


## License

Copyright (c) 2014-2015 Aram Avila-Herrera. Released under the MIT License
(MIT). See [`LICENSE`](./LICENSE) for details.
