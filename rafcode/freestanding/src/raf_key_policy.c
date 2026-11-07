/* RAFCODE-PHI original module; MIT; no hosted headers or calls. */
#include "raf_key_policy.h"

int raf_rsa_policy(unsigned bits, unsigned operation, unsigned flags) {
    if ((flags & ~3u) != 0u || operation < RAF_KEY_GENERATE ||
        operation > RAF_KEY_VERIFY || bits > 8192u || bits < 2048u ||
        (bits & 7u) != 0u) return RAF_KEY_DENY;

    /* RFC 9580: <2048 MUST NOT be used; <3072 MUST NOT be generated. */
    if (bits < 3072u) {
        if (bits != 2048u || operation == RAF_KEY_GENERATE)
            return RAF_KEY_DENY;
        /* Secret-key decryption is permitted with a deprecation warning. */
        if (operation == RAF_KEY_DECRYPT) return RAF_KEY_ALLOW_WARN;
        /* Other 2048-bit uses are discouraged; explicit legacy-only escape. */
        return (flags & RAF_KEY_EXPLICIT_LEGACY_2048) != 0u
                   ? RAF_KEY_ALLOW_WARN : RAF_KEY_DENY;
    }
    /* RFC 9580 discourages new RSA keys even at modern modulus sizes. */
    if (operation == RAF_KEY_GENERATE)
        return (flags & RAF_KEY_EXPLICIT_RSA_GENERATE) != 0u
                   ? RAF_KEY_ALLOW_WARN : RAF_KEY_DENY;
    return RAF_KEY_ALLOW;
}

int raf_aes_policy(unsigned bits) {
    return (bits == 128u || bits == 192u || bits == 256u)
               ? RAF_KEY_ALLOW : RAF_KEY_DENY;
}

unsigned raf_rsa_modulus_bytes(unsigned bits) {
    if (bits < 2048u || bits > 8192u || (bits & 7u) != 0u) return 0u;
    return bits / 8u;
}
