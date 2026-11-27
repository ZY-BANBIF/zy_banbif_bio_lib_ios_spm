// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zy_banbif_bio_lib_ios_spm",

    defaultLocalization: "es",

    platforms: [
        .iOS(.v15)
    ],

    products: [
        .library(
            name: "zy_banbif_bio_lib_ios_spm",
            targets: [
                "zy_banbif_bio_ios_spm_wrapper"
            ]
        )
    ],

    dependencies: [
        // UI Banbif
        .package(
            url: "https://github.com/ZY-BANBIF/zy_banbif_lib_ui_ios_spm.git",
            from: "1.0.27"
        ),
        // Face Banbif
        .package(
            url: "https://github.com/ZY-BANBIF/zy_lib_face_ios_spm_banbif.git",
            from: "1.0.6"
        ),
        // Face PDV Idemia
        .package(
            url: "https://github.com/ZY-IDEMIA/zy_lib_pdv_zytrust_ios_spm.git",
            from: "1.0.0"
        ),
        // OCR Banbif
        .package(
            url: "https://github.com/ZY-BANBIF/zy_lib_regula_ocr_ios_spm_banbif.git",
            from: "1.0.2"
        ),
        // JWTDecode
        .package(
            url: "https://github.com/auth0/JWTDecode.swift.git",
            from: "3.1.0"
        ),
        // CryptoSwift
        .package(
            url: "https://github.com/krzyzanowskim/CryptoSwift.git",
            from: "1.8.0"
        ),
        // NewRelicAgent
        .package(
            url: "https://github.com/newrelic/newrelic-ios-agent-spm",
            from: "7.5.0"
        )
    ],

    targets: [
        // XCFramework BIO alojado en Artifactory
        .binaryTarget(
            name: "zy_banbif_bio_lib_ios_spm",
            url: "https://repo.zytrust.com/artifactory/zy-mobile-maven/spm/banbif/biolib/1.0.1/zy_banbif_bio_lib_ios_spm.xcframework.zip",
            checksum: "279849d3a366415ba3fbf13f681cbb4c4ab8d5260ee20b90b2ffd4e3fc29b144"
        ),

        // Target intermediario
        .target(
            name: "zy_banbif_bio_ios_spm_wrapper",
            dependencies: [
                "zy_banbif_bio_lib_ios_spm",
                .product(
                    name: "zy_banbif_lib_ui_ios_spm",
                    package: "zy_banbif_lib_ui_ios_spm"
                ),
                .product(
                    name: "zy_lib_face_ios_spm_banbif",
                    package: "zy_lib_face_ios_spm_banbif"
                ),
                .product(
                    name: "zy_lib_pdv_zytrust_ios_spm",
                    package: "zy_lib_pdv_zytrust_ios_spm"
                ),
                .product(
                    name: "zy_lib_regula_ocr_ios_spm_banbif",
                    package: "zy_lib_regula_ocr_ios_spm_banbif"
                ),
                .product(
                    name: "JWTDecode",
                    package: "jwtdecode.swift"
                ),
                .product(
                    name: "CryptoSwift",
                    package: "cryptoswift"
                ),
                .product(
                    name: "NewRelic",
                    package: "newrelic-ios-agent-spm"
                )
            ],
            path: "Sources/Wrapper"
        )
    ]
)
