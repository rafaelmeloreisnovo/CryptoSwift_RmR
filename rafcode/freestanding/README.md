# RAFCODEΦ — isolated freestanding C11 key-policy gate (experimental)

**Scope:** Original, additive policy module. Not forked CryptoSwift code, not an OpenPGP implementation, and not connected to CryptoSwift's Swift APIs. `Sources/CryptoSwift/**` and upstream `LICENSE` remain unchanged.

- Header `include/raf_key_policy.h`, implementation `src/raf_key_policy.c`: freestanding C11, no hosted headers, heap, libc calls, syscalls, third-party source, or inline assembly.
- `tests/test_key_policy.c` is a host-only executable and has a C runtime; this does not change the core's dependency boundary.
- `verify.sh`: GCC/Clang with O0/O2/Os, no undefined symbols in the core object; CI runner/compiler/test harness are **build-time** dependencies.
- **RSA policy** follows RFC 9580 section 12.4: reject <2048 for every operation; reject RSA generation <3072; discourage new RSA generation; gate discouraged 2048-bit operations behind explicit legacy consent, while legacy decryption returns a warning. Size ceiling 8192 bits is a **project policy**, not an RFC-wide limit.
- **RSA presets** 1024 (DENY), 2048 (legacy only), 3072/4096/8192 (policy support) do not imply that a key generator, verifier or cryptographic backend exists. `raf_rsa_modulus_bytes()` reports only public modulus byte lengths.
- **AES** allows 128, 192 and 256-bit keys only. Larger sizes are not AES.
- **PQC:** RFC 9980 defines OpenPGP post-quantum compositions; no such algorithm is implemented here. Its parameter names (e.g. ML-KEM-1024) are **not** RSA modulus lengths.
- No constant-time, side-channel, cryptographic correctness, interoperability, mobile throughput or security certification claims. Inline ASM/NEON may be considered only for independently tested and measured primitives.
- Future Swift adapter must explicitly map errors/warnings, preserve upstream API behavior, and be reviewed before integration.

## Verify

```sh
sh rafcode/freestanding/verify.sh
```

## License/provenance

`LICENSE` here is MIT and applies **only** to original files under `rafcode/freestanding/`. The inherited CryptoSwift project uses its own upstream zlib-like `LICENSE`, which must be preserved with attribution in distributions. See `LICENSE_SCOPE.md` and `../../THIRD_PARTY_PROVENANCE.md`.

**Gate:** IMPLEMENTED_UNTESTED until exact Git blob and CI/runtime evidence; `claim_allowed=false`, no auto-merge.
