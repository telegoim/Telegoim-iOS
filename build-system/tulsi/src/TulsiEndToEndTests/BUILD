load("//src/TulsiGeneratorIntegrationTests:tulsi_integration_test.bzl", "tulsi_integration_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

licenses(["notice"])

test_suite(name = "TulsiEndToEndTests")

swift_library(
    name = "TulsiEndToEndTestBase",
    testonly = 1,
    srcs = [
        "TulsiEndToEndTest.swift",
    ],
    module_name = "TulsiEndToEndTestBase",
    deps = [
        "//src/TulsiGenerator:tulsi_generator_lib",
        "//src/TulsiGeneratorIntegrationTests:BazelIntegrationTestCase",
    ],
)

tulsi_integration_test(
    name = "TulsiEndToEndTest",
    size = "large",
    testonly = 1,
    srcs = [
        "ButtonsEndToEndTest.swift",
    ],
    data = [
        "Resources/Buttons.tulsiproj",
        "//:tulsi.zip",
        "//src/TulsiEndToEndTests/Resources/Buttons:all_files",
    ],
    deps = [
        ":TulsiEndToEndTestBase",
    ],
)
