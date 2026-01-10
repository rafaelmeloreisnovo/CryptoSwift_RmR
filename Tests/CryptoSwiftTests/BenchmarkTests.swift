//
//  CryptoSwift
//
//  Copyright (C) Marcin Krzyżanowski <marcin@krzyzanowskim.com>
//  This software is provided 'as-is', without any express or implied warranty.
//
//  In no event will the authors be held liable for any damages arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
//  - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
//  - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
//  - This notice may not be removed or altered from any source or binary distribution.
//

import Foundation
import XCTest
@testable import CryptoSwift

/// Comprehensive benchmark tests for CryptoSwift library.
/// These tests run separately from the main test suite to avoid penalizing CI/CD pipelines.
/// Run with: swift test -c release --filter "BenchmarkTests"
final class BenchmarkTests: XCTestCase {

  // MARK: - Test Data
  private let smallData = Array<UInt8>(repeating: 0xAB, count: 1024)
  private let mediumData = Array<UInt8>(repeating: 0xAB, count: 64 * 1024)
  private let largeData = Array<UInt8>(repeating: 0xAB, count: 1024 * 1024)

  private let aesKey16 = Array<UInt8>(repeating: 0x2B, count: 16)
  private let aesKey32 = Array<UInt8>(repeating: 0x2B, count: 32)
  private let aesIV = Array<UInt8>(repeating: 0x00, count: 16)
  private let chachaKey = Array<UInt8>(repeating: 0x00, count: 32)
  private let chachaIV = Array<UInt8>(repeating: 0x00, count: 12)

  // MARK: - AES Benchmarks

  func testBenchmarkAES128CBCEncrypt() {
    let aes = try! AES(key: aesKey16, blockMode: CBC(iv: aesIV), padding: .pkcs7)
    measure {
      _ = try! aes.encrypt(largeData)
    }
  }

  func testBenchmarkAES256CBCEncrypt() {
    let aes = try! AES(key: aesKey32, blockMode: CBC(iv: aesIV), padding: .pkcs7)
    measure {
      _ = try! aes.encrypt(largeData)
    }
  }

  func testBenchmarkAESGCMEncrypt() {
    let gcm = GCM(iv: aesIV, mode: .combined)
    let aes = try! AES(key: aesKey16, blockMode: gcm, padding: .noPadding)
    measure {
      _ = try! aes.encrypt(mediumData)
    }
  }

  func testBenchmarkAESCTREncrypt() {
    let aes = try! AES(key: aesKey16, blockMode: CTR(iv: aesIV), padding: .noPadding)
    measure {
      _ = try! aes.encrypt(largeData)
    }
  }

  // MARK: - ChaCha20 Benchmarks

  func testBenchmarkChaCha20Encrypt() {
    let chacha = try! ChaCha20(key: chachaKey, iv: chachaIV)
    measure {
      _ = try! chacha.encrypt(largeData)
    }
  }

  // MARK: - Digest Benchmarks

  func testBenchmarkMD5() {
    measure {
      _ = Digest.md5(largeData)
    }
  }

  func testBenchmarkSHA1() {
    measure {
      _ = Digest.sha1(largeData)
    }
  }

  func testBenchmarkSHA256() {
    measure {
      _ = Digest.sha256(largeData)
    }
  }

  func testBenchmarkSHA512() {
    measure {
      _ = Digest.sha512(largeData)
    }
  }

  func testBenchmarkSHA3_256() {
    measure {
      _ = Digest.sha3(largeData, variant: .sha256)
    }
  }

  // MARK: - HMAC Benchmarks

  func testBenchmarkHMACSHA256() {
    measure {
      _ = try! HMAC(key: aesKey32, variant: .sha2(.sha256)).authenticate(largeData)
    }
  }

  // MARK: - PBKDF2 Benchmarks

  func testBenchmarkPBKDF2_1000Iterations() {
    let password: Array<UInt8> = Array("password".utf8)
    let salt: Array<UInt8> = Array("saltsalt".utf8)
    measure {
      _ = try! PKCS5.PBKDF2(password: password, salt: salt, iterations: 1000, keyLength: 32, variant: .sha2(.sha256)).calculate()
    }
  }

  // MARK: - CRC Benchmarks

  func testBenchmarkCRC32() {
    measure {
      _ = largeData.crc32()
    }
  }

  func testBenchmarkCRC16() {
    measure {
      _ = largeData.crc16()
    }
  }

  // MARK: - Blowfish Benchmarks

  func testBenchmarkBlowfishCBC() {
    let key = Array<UInt8>(repeating: 0x01, count: 16)
    let iv = Array<UInt8>(repeating: 0x00, count: 8)
    let blowfish = try! Blowfish(key: key, blockMode: CBC(iv: iv), padding: .pkcs7)
    measure {
      _ = try! blowfish.encrypt(mediumData)
    }
  }
}

extension BenchmarkTests {
  static func allTests() -> [(String, (BenchmarkTests) -> () -> Void)] {
    [
      ("testBenchmarkAES128CBCEncrypt", testBenchmarkAES128CBCEncrypt),
      ("testBenchmarkAES256CBCEncrypt", testBenchmarkAES256CBCEncrypt),
      ("testBenchmarkAESGCMEncrypt", testBenchmarkAESGCMEncrypt),
      ("testBenchmarkAESCTREncrypt", testBenchmarkAESCTREncrypt),
      ("testBenchmarkChaCha20Encrypt", testBenchmarkChaCha20Encrypt),
      ("testBenchmarkMD5", testBenchmarkMD5),
      ("testBenchmarkSHA1", testBenchmarkSHA1),
      ("testBenchmarkSHA256", testBenchmarkSHA256),
      ("testBenchmarkSHA512", testBenchmarkSHA512),
      ("testBenchmarkSHA3_256", testBenchmarkSHA3_256),
      ("testBenchmarkHMACSHA256", testBenchmarkHMACSHA256),
      ("testBenchmarkPBKDF2_1000Iterations", testBenchmarkPBKDF2_1000Iterations),
      ("testBenchmarkCRC32", testBenchmarkCRC32),
      ("testBenchmarkCRC16", testBenchmarkCRC16),
      ("testBenchmarkBlowfishCBC", testBenchmarkBlowfishCBC)
    ]
  }
}
