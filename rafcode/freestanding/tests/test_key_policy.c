#include "raf_key_policy.h"
#define CHECK(expr) do { if (!(expr)) return __LINE__; } while (0)
int main(void) {
    CHECK(raf_rsa_policy(1024u, RAF_KEY_DECRYPT, 3u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(1024u, RAF_KEY_VERIFY, 3u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(2048u, RAF_KEY_GENERATE, 3u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(2048u, RAF_KEY_DECRYPT, 0u) == RAF_KEY_ALLOW_WARN);
    CHECK(raf_rsa_policy(2048u, RAF_KEY_SIGN, 0u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(2048u, RAF_KEY_VERIFY, 2u) == RAF_KEY_ALLOW_WARN);
    CHECK(raf_rsa_policy(3072u, RAF_KEY_GENERATE, 0u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(3072u, RAF_KEY_GENERATE, 1u) == RAF_KEY_ALLOW_WARN);
    CHECK(raf_rsa_policy(4096u, RAF_KEY_ENCRYPT, 0u) == RAF_KEY_ALLOW);
    CHECK(raf_rsa_policy(8192u, RAF_KEY_VERIFY, 0u) == RAF_KEY_ALLOW);
    CHECK(raf_rsa_policy(8193u, RAF_KEY_VERIFY, 0u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(4096u, 0u, 0u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(4096u, 6u, 0u) == RAF_KEY_DENY);
    CHECK(raf_rsa_policy(4096u, RAF_KEY_DECRYPT, 4u) == RAF_KEY_DENY);
    CHECK(raf_rsa_modulus_bytes(8192u) == 1024u);
    CHECK(raf_rsa_modulus_bytes(4096u) == 512u);
    CHECK(raf_rsa_modulus_bytes(1024u) == 0u);
    CHECK(raf_aes_policy(128u) == RAF_KEY_ALLOW);
    CHECK(raf_aes_policy(192u) == RAF_KEY_ALLOW);
    CHECK(raf_aes_policy(256u) == RAF_KEY_ALLOW);
    CHECK(raf_aes_policy(512u) == RAF_KEY_DENY);
    CHECK(raf_aes_policy(8192u) == RAF_KEY_DENY);
    return 0;
}
