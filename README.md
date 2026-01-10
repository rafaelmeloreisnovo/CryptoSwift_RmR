<div align="center">

# 🔐 CryptoSwift

### A Comprehensive Cryptographic Library for Swift

[![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20Android%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20visionOS%20%7C%20Linux-4E4E4E.svg?colorA=28a745&style=for-the-badge)](#platform-support)
[![Swift](https://img.shields.io/badge/Swift-5.6%20%7C%205.7%20%7C%205.8%20%7C%205.9%20%7C%206.0%20%7C%206.2-FA7343.svg?style=for-the-badge&logo=swift&logoColor=white)](#swift-versions-support)
[![License](https://img.shields.io/badge/License-zlib-blue.svg?style=for-the-badge)](#license)

[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat-square&colorA=28a745&colorB=4E4E4E)](https://github.com/swiftlang/swift-package-manager)
[![Carthage](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat-square&colorA=28a745&colorB=4E4E4E)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/cocoapods/v/CryptoSwift.svg?style=flat-square&label=CocoaPods&colorA=orange&colorB=4E4E4E)](https://cocoapods.org/pods/CryptoSwift)

**Pure Swift implementation of cryptographic algorithms with zero external dependencies**

[#PureSwift](https://twitter.com/hashtag/pureswift)

</div>

---

## 📋 Table of Contents

<details>
<summary>Click to expand</summary>

- [Abstract](#-abstract)
- [Key Features](#-key-features)
- [Standards Compliance](#-standards-compliance)
- [Architecture Overview](#-architecture-overview)
- [Installation](#-installation)
- [Quick Start Guide](#-quick-start-guide)
- [Comprehensive API Reference](#-comprehensive-api-reference)
  - [Hash Functions](#hash-functions-digest)
  - [Symmetric Encryption](#symmetric-encryption)
  - [Asymmetric Encryption (RSA)](#asymmetric-encryption-rsa)
  - [Message Authentication](#message-authentication-codes-mac)
  - [Key Derivation Functions](#key-derivation-functions)
  - [Block Cipher Modes](#block-cipher-modes-of-operation)
  - [AEAD Algorithms](#authenticated-encryption-with-associated-data-aead)
- [Advanced Usage Patterns](#-advanced-usage-patterns)
- [Performance Considerations](#-performance-considerations)
- [Security Best Practices](#-security-best-practices)
- [Platform Support](#-platform-support)
- [Swift Version Compatibility](#-swift-versions-support)
- [Contributing](#-contributing)
- [Support & Sponsors](#-support--sponsors)
- [License](#-license)
- [References](#-references)
- [Changelog](#-changelog)

</details>

---

## 📖 Abstract

**CryptoSwift** is a production-ready, pure Swift cryptographic library implementing industry-standard algorithms compliant with NIST, IETF, and ISO specifications. Designed with a focus on security, performance, and developer ergonomics, this library provides a comprehensive suite of cryptographic primitives suitable for enterprise-grade applications.

> **Note**: The `main` branch follows the latest released version of Swift. For legacy Swift versions, refer to the [version compatibility matrix](#-swift-versions-support).

---

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| 🔒 **Pure Swift** | Zero external dependencies; entirely implemented in Swift |
| 🚀 **High Performance** | Optimized for release builds with Whole-Module Optimization |
| 📦 **Incremental Processing** | Stream-based encryption/decryption for memory-efficient large file handling |
| 🔄 **Cross-Platform** | iOS, macOS, watchOS, tvOS, visionOS, Linux, and Android support |
| 📚 **Comprehensive API** | Convenient extensions for `String`, `Data`, and `Array<UInt8>` |
| ✅ **Standards Compliant** | Implementations verified against NIST, IETF, and ISO test vectors |

---

## 📜 Standards Compliance

CryptoSwift implements algorithms in accordance with the following international standards:

### NIST (National Institute of Standards and Technology)

| Standard | Description | Implementation |
|----------|-------------|----------------|
| [FIPS 197](https://csrc.nist.gov/pubs/fips/197/final) | Advanced Encryption Standard (AES) | AES-128, AES-192, AES-256 |
| [FIPS 180-4](https://csrc.nist.gov/pubs/fips/180-4/upd1/final) | Secure Hash Standard | SHA-1, SHA-224, SHA-256, SHA-384, SHA-512 |
| [FIPS 202](https://csrc.nist.gov/pubs/fips/202/final) | SHA-3 Standard | SHA3-224, SHA3-256, SHA3-384, SHA3-512, Keccak |
| [SP 800-38A](https://csrc.nist.gov/pubs/sp/800/38/a/final) | Block Cipher Modes | ECB, CBC, CFB, OFB, CTR |
| [SP 800-38C](https://csrc.nist.gov/pubs/sp/800/38/c/upd1/final) | CCM Mode | AES-CCM |
| [SP 800-38D](https://csrc.nist.gov/pubs/sp/800/38/d/final) | GCM Mode | AES-GCM |

### IETF (Internet Engineering Task Force)

| RFC | Description | Implementation |
|-----|-------------|----------------|
| [RFC 1321](https://tools.ietf.org/html/rfc1321) | MD5 Message-Digest Algorithm | MD5 |
| [RFC 2104](https://tools.ietf.org/html/rfc2104) | HMAC: Keyed-Hashing for Message Authentication | HMAC |
| [RFC 2898](https://tools.ietf.org/html/rfc2898) | PKCS #5: Password-Based Cryptography | PBKDF1, PBKDF2 |
| [RFC 4493](https://tools.ietf.org/html/rfc4493) | The AES-CMAC Algorithm | CMAC |
| [RFC 4503](https://tools.ietf.org/html/rfc4503) | Rabbit Stream Cipher | Rabbit |
| [RFC 5869](https://tools.ietf.org/html/rfc5869) | HKDF | HKDF |
| [RFC 7253](https://tools.ietf.org/html/rfc7253) | OCB Mode | AES-OCB |
| [RFC 7539](https://tools.ietf.org/html/rfc7539) | ChaCha20 and Poly1305 | ChaCha20, Poly1305, AEAD |
| [RFC 7914](https://tools.ietf.org/html/rfc7914) | Scrypt | Scrypt |

### Additional Standards

| Standard | Description | Implementation |
|----------|-------------|----------------|
| [ISO/IEC 7816-4](https://www.iso.org/standard/77180.html) | Smart Card Commands | ISO78164 Padding |
| [ISO 10126](https://en.wikipedia.org/wiki/Padding_(cryptography)#ISO_10126) | Banking Message Encipherment | ISO10126 Padding |
| [PKCS #1](https://www.rfc-editor.org/rfc/rfc8017) | RSA Cryptography Specifications | RSA Encryption/Signatures |

---

## 🏗 Architecture Overview

```
CryptoSwift/
├── Sources/
│   └── CryptoSwift/
│       ├── AEAD/                 # Authenticated Encryption with Associated Data
│       ├── ASN1/                 # ASN.1 Encoding/Decoding
│       ├── BlockMode/            # Block Cipher Modes (CBC, GCM, CTR, etc.)
│       ├── CS_BigInt/            # Big Integer Arithmetic for RSA
│       ├── Foundation/           # Foundation Framework Extensions
│       ├── PEM/                  # PEM Encoding/Decoding
│       ├── PKCS/                 # PKCS Standards Implementation
│       ├── RSA/                  # RSA Public-Key Cryptography
│       ├── AES.swift             # AES Implementation
│       ├── ChaCha20.swift        # ChaCha20 Stream Cipher
│       ├── MD5.swift             # MD5 Hash Function
│       ├── SHA1.swift            # SHA-1 Hash Function
│       ├── SHA2.swift            # SHA-2 Family
│       ├── SHA3.swift            # SHA-3 Family
│       └── ...
├── Tests/
│   ├── CryptoSwiftTests/         # Comprehensive Test Suite
│   └── TestsPerformance/         # Performance Benchmarks
└── Documentation/
    └── ModuleProfessional/       # Professional Documentation
```

---

## 📦 Installation

### Swift Package Manager (Recommended)

Add CryptoSwift to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.9.0")
]
```

Then add `CryptoSwift` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: ["CryptoSwift"]
)
```

### Carthage

Add to your `Cartfile`:

```ruby
github "krzyzanowskim/CryptoSwift"
```

Run `carthage update` and follow the [integration instructions](https://github.com/Carthage/Carthage#getting-started).

### CocoaPods

> ⚠️ **Deprecation Notice**: CocoaPods support is deprecated. Migration to Swift Package Manager is recommended.

```ruby
pod 'CryptoSwift', '~> 1.8.4'
```

### XCFramework (Binary Distribution)

For optimized binary distribution, use the build script:

```bash
./scripts/build-framework.sh
```

This generates `CryptoSwift.xcframework` with Release optimizations enabled.

### Xcode Project Integration

Add as a Git submodule:

```bash
git submodule add https://github.com/krzyzanowskim/CryptoSwift.git
```

> **Performance Note**: Enable **Whole-Module Optimization** for production builds. Debug builds may exhibit up to 10,000x slower performance.

### Hardened Runtime (macOS)

When using **Sign to Run Locally** with Hardened Runtime:
- Use a proper Development Signing Certificate, **or**
- Add the `com.apple.security.cs.disable-library-validation` entitlement

---

## 🚀 Quick Start Guide

### Import the Library

```swift
import CryptoSwift
```

### Basic Hashing

```swift
// String hashing
let hash = "Hello, World!".md5()    // MD5 hash
let sha256 = "Hello, World!".sha256() // SHA-256 hash

// Data hashing
let data = Data([0x01, 0x02, 0x03])
let dataHash = data.sha256()
```

### AES Encryption/Decryption

```swift
do {
    let key: [UInt8] = Array("keykeykeykeykeyk".utf8) // 16 bytes for AES-128
    let iv: [UInt8] = Array("drowssapdrowssap".utf8)  // 16 bytes IV
    
    let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)
    
    // Encrypt
    let plaintext = Array("Secret message".utf8)
    let ciphertext = try aes.encrypt(plaintext)
    
    // Decrypt
    let decrypted = try aes.decrypt(ciphertext)
    let message = String(bytes: decrypted, encoding: .utf8)
} catch {
    print("Encryption error: \(error)")
}
```

---

## 📚 Comprehensive API Reference

### Hash Functions (Digest)

CryptoSwift provides implementations of cryptographic hash functions compliant with FIPS 180-4 and FIPS 202.

| Algorithm | Output Size | Standard | Security Level |
|-----------|-------------|----------|----------------|
| MD5 | 128 bits | RFC 1321 | ⚠️ Deprecated |
| SHA-1 | 160 bits | FIPS 180-4 | ⚠️ Deprecated |
| SHA-224 | 224 bits | FIPS 180-4 | ✅ Recommended |
| SHA-256 | 256 bits | FIPS 180-4 | ✅ Recommended |
| SHA-384 | 384 bits | FIPS 180-4 | ✅ Recommended |
| SHA-512 | 512 bits | FIPS 180-4 | ✅ Recommended |
| SHA3-224 | 224 bits | FIPS 202 | ✅ Recommended |
| SHA3-256 | 256 bits | FIPS 202 | ✅ Recommended |
| SHA3-384 | 384 bits | FIPS 202 | ✅ Recommended |
| SHA3-512 | 512 bits | FIPS 202 | ✅ Recommended |

#### Usage Examples

```swift
// Direct computation
let bytes: [UInt8] = [0x01, 0x02, 0x03]
let md5Hash = Digest.md5(bytes)
let sha256Hash = Digest.sha256(bytes)
let sha3Hash = Digest.sha3(bytes, variant: .sha256)

// Extension methods
let data = Data([0x01, 0x02, 0x03])
let hash = data.sha256()

// Incremental hashing for large data
var digest = SHA256()
try digest.update(withBytes: [0x31, 0x32])
try digest.update(withBytes: [0x33])
let result = try digest.finish()
```

#### Cyclic Redundancy Check (CRC)

```swift
let crc16 = bytes.crc16()
let crc32 = bytes.crc32()
let crc32c = bytes.crc32c()
```

---

### Symmetric Encryption

#### AES (Advanced Encryption Standard)

FIPS 197 compliant implementation supporting all standard key sizes:

| Variant | Key Size | Block Size | Rounds |
|---------|----------|------------|--------|
| AES-128 | 16 bytes | 16 bytes | 10 |
| AES-192 | 24 bytes | 16 bytes | 12 |
| AES-256 | 32 bytes | 16 bytes | 14 |

```swift
// AES-256 with CBC mode
let key: [UInt8] = /* 32 bytes */
let iv = AES.randomIV(AES.blockSize)

let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)
let encrypted = try aes.encrypt(plaintext)
let decrypted = try aes.decrypt(encrypted)
```

#### ChaCha20 Stream Cipher

RFC 7539 compliant stream cipher:

```swift
let encrypted = try ChaCha20(key: key, iv: iv).encrypt(message)
let decrypted = try ChaCha20(key: key, iv: iv).decrypt(encrypted)
```

#### XChaCha20 Extended Nonce

Extended nonce variant for enhanced security:

```swift
let encrypted = try XChaCha20(key: key, iv: iv).encrypt(message)
let decrypted = try XChaCha20(key: key, iv: iv).decrypt(encrypted)
```

#### Rabbit Stream Cipher

RFC 4503 compliant:

```swift
let encrypted = try Rabbit(key: key, iv: iv).encrypt(message)
let decrypted = try Rabbit(key: key, iv: iv).decrypt(encrypted)
```

#### Blowfish

```swift
let encrypted = try Blowfish(key: key, blockMode: CBC(iv: iv), padding: .pkcs7).encrypt(message)
let decrypted = try Blowfish(key: key, blockMode: CBC(iv: iv), padding: .pkcs7).decrypt(encrypted)
```

---

### Asymmetric Encryption (RSA)

PKCS #1 compliant RSA implementation supporting encryption and digital signatures.

#### Key Generation

```swift
// Generate 2048-bit RSA key pair
let rsaKey = try RSA(keySize: 2048)
```

#### Encryption/Decryption

```swift
// Alice generates a key pair
let alicePrivateKey = try RSA(keySize: 2048)
let alicePublicKeyData = try alicePrivateKey.publicKeyExternalRepresentation()

// Bob imports Alice's public key and encrypts
let bobsImport = try RSA(rawRepresentation: alicePublicKeyData)
let encrypted = try bobsImport.encrypt("Secret message".bytes)

// Alice decrypts with private key
let decrypted = try alicePrivateKey.decrypt(encrypted)
```

#### Digital Signatures

```swift
// Sign message
let signature = try privateKey.sign("Message to sign".bytes)

// Verify signature
let isValid = try publicKey.verify(signature: signature, for: "Message to sign".bytes)
```

#### Apple Security Framework Interoperability

```swift
// CryptoSwift RSA → SecKey
let attributes: [String: Any] = [
    kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
    kSecAttrKeyClass as String: kSecAttrKeyClassPrivate,
    kSecAttrKeySizeInBits as String: 2048
]
let secKey = SecKeyCreateWithData(try rsaKey.externalRepresentation() as CFData, 
                                   attributes as CFDictionary, nil)

// SecKey → CryptoSwift RSA
let cfdata = SecKeyCopyExternalRepresentation(secKey, nil)
let rsaKey = try RSA(rawRepresentation: cfdata as! Data)
```

---

### Message Authentication Codes (MAC)

| Algorithm | Standard | Description |
|-----------|----------|-------------|
| HMAC | RFC 2104 | Hash-based Message Authentication Code |
| CMAC | RFC 4493 | Cipher-based Message Authentication Code |
| Poly1305 | RFC 7539 | One-time Authenticator |
| CBC-MAC | NIST SP 800-38B | Cipher Block Chaining MAC |

```swift
let key: [UInt8] = /* authentication key */

// HMAC
let hmac = try HMAC(key: key, variant: .sha2(.sha256)).authenticate(message)

// CMAC
let cmac = try CMAC(key: key).authenticate(message)

// Poly1305
let poly = try Poly1305(key: key).authenticate(message)
```

---

### Key Derivation Functions

#### PBKDF2 (RFC 2898)

```swift
let password = Array("password".utf8)
let salt = Array("saltvalue".utf8)

let derivedKey = try PKCS5.PBKDF2(
    password: password,
    salt: salt,
    iterations: 100_000,  // Recommended minimum for password hashing
    keyLength: 32,        // 256 bits
    variant: .sha2(.sha256)
).calculate()
```

#### Scrypt (RFC 7914)

Memory-hard key derivation function:

```swift
let key = try Scrypt(
    password: password,
    salt: salt,
    dkLen: 64,
    N: 16384,  // CPU/memory cost
    r: 8,      // Block size
    p: 1       // Parallelization
).calculate()
```

#### HKDF (RFC 5869)

```swift
let key = try HKDF(
    password: inputKeyMaterial,
    salt: salt,
    info: contextInfo,
    keyLength: 32,
    variant: .sha256
).calculate()
```

---

### Block Cipher Modes of Operation

| Mode | Type | Authentication | Parallelizable |
|------|------|----------------|----------------|
| ECB | Basic | ❌ | ✅ Encryption/Decryption |
| CBC | Basic | ❌ | Decryption only |
| PCBC | Basic | ❌ | ❌ |
| CFB | Stream | ❌ | Decryption only |
| OFB | Stream | ❌ | ❌ |
| CTR | Stream | ❌ | ✅ Encryption/Decryption |
| GCM | AEAD | ✅ | ✅ Encryption/Decryption |
| CCM | AEAD | ✅ | ❌ |
| OCB | AEAD | ✅ | ✅ Encryption/Decryption |

#### GCM Mode (Recommended for AEAD)

```swift
let gcm = GCM(iv: iv, mode: .combined)
let aes = try AES(key: key, blockMode: gcm, padding: .noPadding)
let encrypted = try aes.encrypt(plaintext)
let authTag = gcm.authenticationTag  // Authentication tag
```

#### CCM Mode

```swift
let ccm = CCM(
    iv: iv,
    tagLength: 16,
    messageLength: plaintext.count,
    additionalAuthenticatedData: aad
)
let aes = try AES(key: key, blockMode: ccm, padding: .noPadding)
let encrypted = try aes.encrypt(plaintext)
```

---

### Authenticated Encryption with Associated Data (AEAD)

#### ChaCha20-Poly1305 (RFC 7539)

```swift
let result = try AEADChaCha20Poly1305.encrypt(
    plaintext,
    key: key,
    iv: nonce,
    authenticationHeader: additionalData
)

let decrypted = try AEADChaCha20Poly1305.decrypt(
    ciphertext,
    key: key,
    iv: nonce,
    authenticationHeader: additionalData,
    authenticationTag: tag
)
```

#### XChaCha20-Poly1305

Extended nonce variant:

```swift
let result = try AEADXChaCha20Poly1305.encrypt(
    plaintext,
    key: key,
    iv: nonce,  // 24 bytes
    authenticationHeader: additionalData
)
```

---

### Data Padding Schemes

| Scheme | Standard | Use Case |
|--------|----------|----------|
| PKCS #7 | RFC 5652 | Block cipher padding (recommended) |
| PKCS #5 | RFC 2898 | Legacy compatibility |
| Zero Padding | — | Fixed-length data |
| ISO 7816-4 | ISO/IEC 7816-4 | Smart card applications |
| ISO 10126 | ISO 10126 | Random padding |
| No Padding | — | Pre-padded data |

```swift
// Automatic padding
let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)

// Manual padding
let padded = Padding.pkcs7.add(to: bytes, blockSize: AES.blockSize)
```

---

## 🔬 Advanced Usage Patterns

### Incremental Encryption (Stream Processing)

For memory-efficient processing of large files:

```swift
var encryptor = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7).makeEncryptor()

var ciphertext: [UInt8] = []
ciphertext += try encryptor.update(withBytes: chunk1)
ciphertext += try encryptor.update(withBytes: chunk2)
ciphertext += try encryptor.update(withBytes: chunk3)
ciphertext += try encryptor.finish()
```

### Data Type Conversions

```swift
// Hexadecimal encoding/decoding
let bytes = Array<UInt8>(hex: "0x010203")
let hex = bytes.toHexString()

// Base64 operations
let base64 = bytes.toBase64()
let decoded = "SGVsbG8=".decryptBase64(cipher)

// String to bytes
let stringBytes: [UInt8] = "plaintext".bytes
```

### Convenience Extensions

```swift
let plain = Data([0x01, 0x02, 0x03])
let encrypted = try plain.encrypt(ChaCha20(key: key, iv: iv))
let decrypted = try encrypted.decrypt(ChaCha20(key: key, iv: iv))
```

---

## ⚡ Performance Considerations

### Build Configuration Impact

| Configuration | Relative Performance | Use Case |
|---------------|---------------------|----------|
| Release + WMO | 1x (Baseline) | Production |
| Release | ~2-5x slower | — |
| Debug | ~100-10,000x slower | Development only |

### Optimization Recommendations

1. **Enable Whole-Module Optimization**
   ```
   Build Settings → Swift Compiler - Code Generation → Optimization Level → -O -whole-module-optimization
   ```

2. **Use XCFramework for SPM**
   - SPM uses debug configuration for Xcode debug builds
   - Embed pre-built `CryptoSwift.xcframework` for development performance

3. **Incremental Processing**
   - Use stream APIs for large data to minimize memory footprint

4. **Algorithm Selection**
   - Prefer ChaCha20-Poly1305 for software-only implementations
   - Use AES-GCM when hardware acceleration is available

---

## 🛡 Security Best Practices

### Recommendations

| Practice | Recommendation |
|----------|----------------|
| **Key Generation** | Use cryptographically secure random number generators |
| **Key Storage** | Utilize platform keychain services (iOS Keychain, macOS Keychain) |
| **IV/Nonce** | Never reuse with the same key; generate randomly |
| **Hash Selection** | Prefer SHA-256 or SHA-3 for new applications |
| **Password Storage** | Use Scrypt or PBKDF2 with ≥100,000 iterations |
| **Authenticated Encryption** | Use GCM, CCM, or ChaCha20-Poly1305 |

### Security Advisory

> ⚠️ **MD5 and SHA-1 are cryptographically broken** for security-sensitive applications. Use only for legacy compatibility or non-security checksums.

### Export Compliance

This distribution includes cryptographic software. Verify compliance with local laws regarding:
- Import restrictions
- Export/re-export regulations
- Usage limitations

See [Wassenaar Arrangement](https://www.wassenaar.org/) for international guidelines.

---

## 🌐 Platform Support

| Platform | Minimum Version | Architecture |
|----------|-----------------|--------------|
| iOS | 11.0 | arm64, arm64e |
| macOS | 10.13 | x86_64, arm64 |
| watchOS | 4.0 | arm64_32, arm64 |
| tvOS | 11.0 | arm64 |
| visionOS | 1.0 | arm64 |
| Linux | — | x86_64, arm64 |
| Android | — | arm64-v8a, x86_64 |

---

## 📊 Swift Versions Support

| Swift Version | Branch | CryptoSwift Version | Status |
|---------------|--------|---------------------|--------|
| 6.2+ | `main` | Latest | ✅ Active |
| 5.3 - 5.9 | `swift53` | ≤ 1.8.5 | 🔒 Maintenance |
| 5.1 | `swift51` | ≤ 1.3.3 | ⚠️ Unsupported |
| 5.0 | `swift5` | ≤ 1.2.0 | ⚠️ Unsupported |
| 4.2 | `swift42` | ≤ 0.15.0 | ⚠️ Unsupported |
| 4.0 | `swift4` | ≤ 0.12.0 | ⚠️ Unsupported |
| 3.x | `swift3`/`swift32` | ≤ 0.7.0 | ❌ Deprecated |
| 2.x | `swift2`/`swift21` | ≤ 0.5.2 | ❌ Deprecated |

---

## 🤝 Contributing

We welcome contributions from the community! Please review our guidelines before submitting:

1. **Read** [CONTRIBUTING.md](CONTRIBUTING.md)
2. **Fork** the repository
3. **Create** a feature branch
4. **Test** your changes thoroughly
5. **Submit** a pull request

### Reporting Issues

- **Bugs**: [Open a discussion](https://github.com/krzyzanowskim/CryptoSwift/discussions)
- **Feature Requests**: [Open a discussion](https://github.com/krzyzanowskim/CryptoSwift/discussions)
- **Security Vulnerabilities**: Follow responsible disclosure practices

---

## 💖 Support & Sponsors

The financial sustainability of CryptoSwift is made possible by our generous sponsors:

[![GitHub Sponsors](https://img.shields.io/badge/Sponsor-❤️-ea4aaa?style=for-the-badge&logo=github-sponsors)](https://github.com/sponsors/krzyzanowskim)

### Premium Sponsors

<a href="https://www.emergetools.com">
  <img alt="Emerge Tools" width="200" src="https://github-production-user-asset-6210df.s3.amazonaws.com/758033/256565082-a21f5ac1-ef39-4b56-a8d2-575adeb7fe55.png" />
</a>

[Emerge Tools](https://www.emergetools.com/) — Revolutionary products designed to supercharge mobile apps and the teams that build them.

---

## 📜 License

**CryptoSwift** is released under a permissive zlib-style license.

```
Copyright (C) 2014-2025 Marcin Krzyżanowski <marcin@krzyzanowskim.com>

This software is provided 'as-is', without any express or implied warranty.

In no event will the authors be held liable for any damages arising from
the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation is required.

2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

3. This notice may not be removed or altered from any source or binary
   distribution.

4. Redistributions of any form whatsoever must retain the following
   acknowledgment: 'This product includes software developed by
   "Marcin Krzyzanowski" (https://krzyzanowskim.com/).'
```

---

## 📖 References

### Standards Documents

1. NIST FIPS 197. *Advanced Encryption Standard (AES)*. 2001.
2. NIST FIPS 180-4. *Secure Hash Standard (SHS)*. 2015.
3. NIST FIPS 202. *SHA-3 Standard: Permutation-Based Hash and Extendable-Output Functions*. 2015.
4. NIST SP 800-38A. *Recommendation for Block Cipher Modes of Operation*. 2001.
5. NIST SP 800-38C. *Recommendation for Block Cipher Modes of Operation: The CCM Mode*. 2004.
6. NIST SP 800-38D. *Recommendation for Block Cipher Modes of Operation: Galois/Counter Mode (GCM)*. 2007.

### RFCs

7. RFC 1321. Rivest, R. *The MD5 Message-Digest Algorithm*. 1992.
8. RFC 2104. Krawczyk, H., Bellare, M., Canetti, R. *HMAC: Keyed-Hashing for Message Authentication*. 1997.
9. RFC 2898. Kaliski, B. *PKCS #5: Password-Based Cryptography Specification*. 2000.
10. RFC 4493. Song, J.H., et al. *The AES-CMAC Algorithm*. 2006.
11. RFC 5869. Krawczyk, H., Eronen, P. *HMAC-based Extract-and-Expand Key Derivation Function (HKDF)*. 2010.
12. RFC 7253. Krovetz, T., Rogaway, P. *The OCB Authenticated-Encryption Algorithm*. 2014.
13. RFC 7539. Nir, Y., Langley, A. *ChaCha20 and Poly1305 for IETF Protocols*. 2015.
14. RFC 7914. Percival, C., Josefsson, S. *The scrypt Password-Based Key Derivation Function*. 2016.

### Additional Resources

15. Schneier, B. *Description of a New Variable-Length Key, 64-Bit Block Cipher (Blowfish)*. 1993.
16. Bernstein, D.J. *The Poly1305-AES Message-Authentication Code*. 2005.

---

## 📝 Changelog

See [CHANGELOG](./CHANGELOG) for complete version history.

---

## 👨‍💻 Author

**CryptoSwift** is owned and maintained by [Marcin Krzyżanowski](https://www.krzyzanowskim.com).

[![Twitter Follow](https://img.shields.io/twitter/follow/krzyzanowskim?style=social)](https://x.com/krzyzanowskim)

---

<div align="center">

**Made with ❤️ in Pure Swift**

[Report Bug](https://github.com/krzyzanowskim/CryptoSwift/discussions) · [Request Feature](https://github.com/krzyzanowskim/CryptoSwift/discussions) · [Documentation](./Documentation/ModuleProfessional)

</div>
