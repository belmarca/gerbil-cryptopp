# gerbil-cryptopp
Cryptopp ffi

## Usage

This code has a memory leak (`digest` is never `delete`d).

```scheme
> (import :belmarca/keccak :std/iter)
> (%keccak-256 "Hello, world!")
"B6E16D27AC5AB427A7F68900AC5559CE272DC6C37C82B3E052246C82244C50E4"
> (keccak-256 "Hello, world!")
#u8(182
    225
    109
    39
    172
    90
    180
    39
    167
    246
    137
    0
    172
    85
    89
    206
    39
    45
    198
    195
    124
    130
    179
    224
    82
    36
    108
    130
    36
    76
    80
    228)
```
