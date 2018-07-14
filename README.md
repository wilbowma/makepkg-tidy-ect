makepkg-tidy-ect
===

A `libmakepkg` tidy extension that runs `ect` on all PNGs, JPEGs, ZIPs, XPIs,
and GZIPs in an installed package, optimizing their size.

## Installation
Drop `tidy_ect.sh` into `/usr/share/makepkg/tidy`.
Or, preferably, install from `makepkg-tidy-ect` from the AUR.

To enable it during a `makepkg` run, see below.

## Usage
Add one or more of the following to the `OPTIONS` array used by `makepkg`.
This can be done on a per-`PKGBUILD` basis, or in `/etc/makepkg.conf`.

Currently, optimizing ZIP and XPI files are disabled due to a possible
bug.

- `ect`: enables all of the following options.
- `ect_png`: compresses all PNGs found in the `pkgdir`.
- `ect_jpg`: compresses all JPGs found in the `pkgdir`.
- `ect_zip`: compresses all ZIPs found in the `pkgdir`.
- `ect_xpi`: compresses all XPIs found in the `pkgdir`.
- `ect_gzip`: compresses all GZIPs found in the `pkgdir`.

For example, my `OPTIONS` array in `/etc/makepkg.conf` is the following:

```
OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge ect !debug)
```
