#!/usr/bin/env gxi

(import :std/build-script
        :std/make)

(defbuild-script
  `((gxc: "keccak.ss"
          "-ld-options" "-L/usr/lib/x86_64-linux-gnu -lcryptopp"
          "-cc-options" "-I/usr/include/crypto++")))
