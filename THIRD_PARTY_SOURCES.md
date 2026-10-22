# Third-Party Corresponding Source

This file identifies corresponding source archives for third-party runtime components included in the Linux distribution. These archives contain third-party source code only; they do not contain the NETMAP application source code.

Download the matching archives from the **Assets** section of the same NETMAP GitHub Release. Verify the files using the SHA-256 values recorded in the release asset manifest before using them.

## PySide6 and Shiboken6 6.12.0

- Archive: `NETMAP-PySide6-6.12.0-source.tar.xz`
- Upstream location:
  https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.12.0-src/pyside-setup-everywhere-src-6.12.0.tar.xz
- Upstream SHA-256:
  `099c1a597cf33c1b000e11cf68a0b82d216fb802bf81726efc720394f10c7751`

## QtBase 6.12.0

- Archive: `NETMAP-QtBase-6.12.0-source.tar.xz`
- Upstream location:
  https://download.qt.io/archive/qt/6.12/6.12.0/submodules/qtbase-everywhere-src-6.12.0.tar.xz
- Upstream SHA-256:
  `a951bd163c7b80fc6b8c88d7668fb56abf91c152373e13c10666763238131307`

## QtSvg 6.12.0

- Archive: `NETMAP-QtSvg-6.12.0-source.tar.xz`
- Upstream location: https://download.qt.io/archive/qt/6.12/6.12.0/submodules/qtsvg-everywhere-src-6.12.0.tar.xz
- Downloaded upstream archive SHA-256: `e4ab39534ec97987b1b9b60ef7f4d3253d5912a69f8c713a01753174a4029331`

## QtWayland 6.12.0

- Archive: `NETMAP-QtWayland-6.12.0-source.tar.xz`
- Upstream location: https://download.qt.io/archive/qt/6.12/6.12.0/submodules/qtwayland-everywhere-src-6.12.0.tar.xz
- Upstream SHA-256: `ae14d9bcf1bb3c300a3ab2e6a53f50284e5c6c966a4ac4cc5aedcb1bc74e4d02`

These archives correspond to the Qt/PySide source versions used by the packaged runtime. Other separately licensed components, if present in the release manifest, keep their own license and corresponding-source requirements. The release is not ready for publication if any bundled LGPL/GPL component has an unresolved corresponding-source, relinking, or notice obligation.
