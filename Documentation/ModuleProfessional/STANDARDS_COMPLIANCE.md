# Standards Compliance Documentation

## Cryptographic Standards References

### NIST (National Institute of Standards and Technology)

| Standard | Description | CryptoSwift Implementation |
|----------|-------------|---------------------------|
| FIPS 197 | Advanced Encryption Standard (AES) | AES-128, AES-192, AES-256 |
| FIPS 180-4 | Secure Hash Standard | SHA-1, SHA-224, SHA-256, SHA-384, SHA-512 |
| FIPS 202 | SHA-3 Standard | SHA3-224, SHA3-256, SHA3-384, SHA3-512, Keccak |
| SP 800-38D | GCM Mode of Operation | AES-GCM |
| SP 800-38C | CCM Mode of Operation | AES-CCM |
| SP 800-38A | Block Cipher Modes | ECB, CBC, CFB, OFB, CTR |

### IETF (Internet Engineering Task Force)

| RFC | Description | CryptoSwift Implementation |
|-----|-------------|---------------------------|
| RFC 1321 | MD5 Message-Digest Algorithm | MD5 |
| RFC 3174 | US Secure Hash Algorithm 1 | SHA-1 |
| RFC 6234 | US Secure Hash Algorithms | SHA-224, SHA-256, SHA-384, SHA-512 |
| RFC 2898 | PKCS #5: Password-Based Cryptography | PBKDF1, PBKDF2 |
| RFC 7539 | ChaCha20 and Poly1305 for IETF Protocols | ChaCha20, Poly1305, AEAD_CHACHA20_POLY1305 |
| RFC 4503 | Rabbit Stream Cipher Algorithm | Rabbit |
| RFC 7914 | The scrypt Password-Based Key Derivation Function | Scrypt |
| RFC 5869 | HMAC-based Extract-and-Expand Key Derivation Function | HKDF |
| RFC 4493 | The AES-CMAC Algorithm | CMAC |
| RFC 7253 | OCB Authenticated-Encryption Algorithm | AES-OCB |

### IEEE Standards

| Standard | Description | Relevance |
|----------|-------------|-----------|
| IEEE 802.1AE | MAC Security (MACsec) | GCM mode implementation |

### W3C Standards

| Standard | Description | Relevance |
|----------|-------------|-----------|
| Web Cryptography API | Cryptographic operations in web applications | Algorithm compatibility |

## Padding Standards

| Standard | Description | Implementation |
|----------|-------------|----------------|
| PKCS #5 | Password-Based Cryptography | PKCS5Padding |
| PKCS #7 | Cryptographic Message Syntax | PKCS7Padding |
| ISO/IEC 7816-4 | Smart card commands | ISO78164Padding |
| ISO 10126 | Banking - Procedures for message encipherment | ISO10126Padding |

## Message Authentication Codes

| Standard | Description | Implementation |
|----------|-------------|----------------|
| RFC 2104 | HMAC: Keyed-Hashing for Message Authentication | HMAC |
| RFC 4493 | The AES-CMAC Algorithm | CMAC |
| Poly1305 | One-time authenticator | Poly1305 |
| CBC-MAC | Cipher Block Chaining Message Authentication Code | CBC-MAC |

## Public Key Cryptography

| Standard | Description | Implementation |
|----------|-------------|----------------|
| PKCS #1 | RSA Cryptography Specifications | RSA encryption and signatures |
| X.509 | Public key infrastructure | Certificate parsing (DER/PEM) |
| ASN.1 | Abstract Syntax Notation One | ASN.1 encoding/decoding |

---

*This document provides traceability between industry standards and CryptoSwift implementations.*
