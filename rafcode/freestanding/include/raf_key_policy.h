/* RAFCODE-PHI original module; MIT; not upstream CryptoSwift source. */
#ifndef RAF_KEY_POLICY_H
#define RAF_KEY_POLICY_H
#ifdef __cplusplus
extern "C" {
#endif

enum raf_key_result {
    RAF_KEY_DENY = 0,
    RAF_KEY_ALLOW = 1,
    RAF_KEY_ALLOW_WARN = 2
};
enum raf_key_operation {
    RAF_KEY_GENERATE = 1,
    RAF_KEY_ENCRYPT = 2,
    RAF_KEY_DECRYPT = 3,
    RAF_KEY_SIGN = 4,
    RAF_KEY_VERIFY = 5
};
enum raf_key_flags {
    RAF_KEY_EXPLICIT_RSA_GENERATE = 1,
    RAF_KEY_EXPLICIT_LEGACY_2048 = 2
};
/* Policy only: no key generation, RSA arithmetic, encryption, or signatures. */
int raf_rsa_policy(unsigned bits, unsigned operation, unsigned flags);
int raf_aes_policy(unsigned bits);
unsigned raf_rsa_modulus_bytes(unsigned bits);
#ifdef __cplusplus
}
#endif
#endif
