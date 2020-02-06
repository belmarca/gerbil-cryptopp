;; keccak.ss

(import :std/foreign
        :std/text/hex)

(export keccak-256
        %keccak-256)

(begin-ffi (%keccak-256)
  (c-declare "
#include <cryptopp/cryptlib.h>
#include <cryptopp/keccak.h>
#include <cryptopp/hex.h>
#include <cryptopp/filters.h>

const char* keccak_256(const char* in)
{
using namespace CryptoPP;
std::string msg = in;
std::string* digest = new std::string();
Keccak_256 hash;

StringSource foo(in, true,
new HashFilter(hash,
  new HexEncoder(
     new StringSink(*digest))));

return digest->c_str();
}
")
  (define-c-lambda %keccak-256 (nonnull-char-string) char-string "___return((char*)keccak_256(___arg1));"))

(def (keccak-256 s)
  (hex-decode (%keccak-256 s)))
