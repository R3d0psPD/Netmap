# Third-Party Notices

NETMAP is a proprietary application that uses third-party libraries and runtime components. This notice identifies the principal components and explains where their separate license terms apply. The NETMAP EULA does not replace or limit mandatory rights under third-party licenses.

## Qt for Python: PySide6, Shiboken6, and Qt

The Linux release is built with PySide6 6.12.0 and Shiboken6 6.12.0, using Qt 6.12.0 runtime libraries. The package includes dynamically linked Qt runtime libraries and plugins as identified in the release manifest.

Qt for Python and Qt modules may be available under LGPLv3, GPL terms, or commercial terms depending on the component and licensing choice. The exact license for each bundled component must be read with its upstream notices. Copies of the LGPLv3 and GPLv3 license texts are included in LICENSES/. Corresponding PySide/Qt source archives and their checksums are listed in THIRD_PARTY_SOURCES.md and attached to the same GitHub Release.

- Qt for Python: https://doc.qt.io/qtforpython-6/
- Qt licensing obligations: https://www.qt.io/development/open-source-lgpl-obligations
- Qt licensing overview: https://doc.qt.io/qt-6/licensing.html
- PySide6 source archive: see THIRD_PARTY_SOURCES.md
- QtBase source archive: see THIRD_PARTY_SOURCES.md

Users retain the rights granted by applicable Qt/PySide licenses, including rights that may be necessary to replace or modify LGPL-covered libraries and to use modified versions as those licenses require. Nothing in the NETMAP EULA is intended to restrict those rights.

## Nuitka

The executable is compiled with Nuitka. Nuitka is licensed under AGPLv3, and its Runtime Library Exception provides additional permission for target executables when the stated conditions are met. That exception applies to the generated target program, not to redistributing a modified Nuitka compiler under proprietary terms. The relevant license, runtime exception, and notice texts are included in LICENSES/.

- Nuitka project: https://github.com/Nuitka/Nuitka
- Runtime Library Exception: https://github.com/Nuitka/Nuitka/blob/develop/LICENSE-RUNTIME.txt

## Python

The compiled package may include CPython runtime components. Python is licensed under the Python Software Foundation License and includes other separately licensed components. The Python license text used for this build is included in LICENSES/Python-PSF-3.14.txt.

- Python license: https://docs.python.org/3/license.html
- CPython source: https://github.com/python/cpython

## Python dependencies

The package may include Python dependencies used for credential management and cryptographic operations, including keyring, SecretStorage, jeepney, jaraco helpers, cryptography, cffi, pycparser, and more-itertools. Their applicable license texts are included in LICENSES/ and remain in force for those components.

- keyring project: https://github.com/jaraco/keyring
- SecretStorage project: https://github.com/mitya57/secretstorage
- jeepney project: https://github.com/pmarreck/jeepney
- cryptography project: https://github.com/pyca/cryptography
- cffi project: https://cffi.readthedocs.io/

## Bundled system runtime libraries

The standalone directory may contain runtime libraries for OpenSSL, ICU, SQLite, zlib, zstd, bzip2, XZ/lzma, expat, libffi, and libuuid, in addition to Qt/PySide libraries. The corresponding system copyright/license texts for the system libraries included by this build are collected in LICENSES/. These notices apply to those third-party components only and do not grant a license to the NETMAP application source code.

## Nmap

Nmap is a separate system dependency and is not bundled with NETMAP. Install Nmap from a trusted operating-system package manager or the official project site. Nmap's own license and terms apply to Nmap itself.

- Official project: https://nmap.org/
- License information: https://nmap.org/book/man-legal.html

## NETMAP

NETMAP application code and branding are proprietary and are governed by EULA.md. No NETMAP source code is included in the end-user distribution. This proprietary notice does not supersede third-party license rights.
