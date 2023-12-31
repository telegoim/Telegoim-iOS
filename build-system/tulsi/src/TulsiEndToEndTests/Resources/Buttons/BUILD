load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_application",
    "ios_ui_test",
    "ios_unit_test",
)
load(
    "@build_bazel_rules_apple//apple:macos.bzl",
    "macos_application",
    # Enable when macos_test_runner supports macOS UI Tests.
    # "macos_ui_test",
    "macos_unit_test",
)
load(
    "@build_bazel_rules_apple//apple:tvos.bzl",
    "tvos_application",
    "tvos_extension",
)
load(
    "@build_bazel_rules_apple//apple:watchos.bzl",
    "watchos_application",
    "watchos_extension",
)
load(
    "@build_bazel_rules_swift//swift:swift.bzl",
    "swift_library",
)

licenses(["notice"])

# Platform agnostic

objc_library(
    name = "ObjCLib",
    srcs = [
        "ObjCFoo.m",
    ],
    hdrs = [
        "ObjCFoo.h",
    ],
)

cc_library(
    name = "CppLib",
    srcs = [
        "CppFoo.cc",
    ],
    hdrs = [
        "CppFoo.h",
    ],
)

# iOS

## Code

swift_library(
    name = "ButtonsLib",
    srcs = [
        "Buttons/AppDelegate.swift",
        "Buttons/ViewController.swift",
    ],
    module_name = "Buttons",
)

swift_library(
    name = "ButtonsTestsLib",
    srcs = [
        "ButtonsTests/ButtonsTests.swift",
    ],
    module_name = "ButtonsTests",
    deps = [":ButtonsLib"],
)

swift_library(
    name = "ButtonsUITestsLib",
    srcs = [
        "ButtonsUITests/ButtonsUITests.swift",
    ],
    module_name = "ButtonsUITests",
)

## Resources

objc_library(
    name = "ButtonsResources",
    data = ["Buttons/Base.lproj/Main.storyboard"],
)

## Packaging

ios_application(
    name = "Buttons",
    bundle_id = "com.google.Buttons",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["Buttons/Info.plist"],
    minimum_os_version = "11.0",
    watch_application = ":ButtonsWatch",
    deps = [
        ":ButtonsLib",
        ":ButtonsResources",
        ":CppLib",
        ":ObjCLib",
    ],
)

## Tests

ios_unit_test(
    name = "ButtonsTests",
    minimum_os_version = "11.0",
    test_host = ":Buttons",
    deps = [":ButtonsTestsLib"],
)

ios_unit_test(
    name = "ButtonsLogicTests",
    minimum_os_version = "11.0",
    deps = [":ButtonsTestsLib"],
)

ios_ui_test(
    name = "ButtonsUITests",
    minimum_os_version = "11.0",
    test_host = ":Buttons",
    deps = [":ButtonsUITestsLib"],
)

test_suite(
    name = "iOSButtonsTestSuite",
    tests = [
        ":ButtonsLogicTests",
        ":ButtonsTests",
        ":ButtonsUITests",
    ],
)

# watchOS

## Code

swift_library(
    name = "ButtonsWatchExtensionLib",
    srcs = [
        "ButtonsWatchExtension/ComplicationController.swift",
        "ButtonsWatchExtension/ExtensionDelegate.swift",
        "ButtonsWatchExtension/InterfaceController.swift",
        "ButtonsWatchExtension/NotificationController.swift",
    ],
    module_name = "ButtonsWatchExtension",
)

## Packaging

watchos_application(
    name = "ButtonsWatch",
    bundle_id = "com.google.Buttons.watchkitapp",
    extension = ":ButtonsWatchExtension",
    infoplists = ["ButtonsWatch/Info.plist"],
    minimum_os_version = "4.0",
    storyboards = ["ButtonsWatch/Base.lproj/Interface.storyboard"],
)

watchos_extension(
    name = "ButtonsWatchExtension",
    bundle_id = "com.google.Buttons.watchkitapp.watchkitextension",
    infoplists = ["ButtonsWatchExtension/Info.plist"],
    minimum_os_version = "4.0",
    deps = [
        ":ButtonsWatchExtensionLib",
        ":CppLib",
        ":ObjCLib",
    ],
)

# tvOS

## Code

swift_library(
    name = "ButtonsTVLib",
    srcs = [
        "ButtonsTV/AppDelegate.swift",
        "ButtonsTV/ViewController.swift",
    ],
    module_name = "ButtonsTV",
)

swift_library(
    name = "ButtonsTVExtensionLib",
    srcs = [
        "ButtonsTVExtension/ServiceProvider.swift",
    ],
    module_name = "ButtonsTVExtension",
)

swift_library(
    name = "ButtonsTVTestsLib",
    srcs = [
        "ButtonsTVTests/ButtonsTVTests.swift",
    ],
)

swift_library(
    name = "ButtonsTVUITestsLib",
    srcs = [
        "ButtonsTVUITests/ButtonsTVUITests.swift",
    ],
)

## Resources

objc_library(
    name = "ButtonsTVResources",
    data = ["ButtonsTV/Base.lproj/Main.storyboard"],
)

## Packaging

tvos_application(
    name = "ButtonsTV",
    bundle_id = "com.google.ButtonsTV",
    extensions = [":ButtonsTVExtension"],
    infoplists = ["ButtonsTV/Info.plist"],
    minimum_os_version = "11.0",
    deps = [
        ":ButtonsTVLib",
        ":ButtonsTVResources",
        ":CppLib",
        ":ObjCLib",
    ],
)

tvos_extension(
    name = "ButtonsTVExtension",
    bundle_id = "com.google.ButtonsTV.ButtonsTVExtension",
    infoplists = ["ButtonsTVExtension/Info.plist"],
    minimum_os_version = "11.0",
    deps = [":ButtonsTVExtensionLib"],
)

# macOS

## Code

swift_library(
    name = "ButtonsMacLib",
    srcs = [
        "ButtonsMac/AppDelegate.swift",
        "ButtonsMac/ViewController.swift",
    ],
    module_name = "ButtonsMac",
)

swift_library(
    name = "ButtonsMacTestsLib",
    srcs = [
        "ButtonsMacTests/ButtonsMacTests.swift",
    ],
    module_name = "ButtonsMacTests",
    deps = [":ButtonsMacLib"],
)

swift_library(
    name = "ButtonsMacUITestsLib",
    srcs = [
        "ButtonsMacUITests/ButtonsMacUITests.swift",
    ],
    module_name = "ButtonsMacUITests",
)

## Resources

objc_library(
    name = "ButtonsMacResources",
    data = ["ButtonsMac/Base.lproj/Main.storyboard"],
)

## Packaging

macos_application(
    name = "ButtonsMac",
    bundle_id = "com.google.ButtonsMac",
    infoplists = ["ButtonsMac/Info.plist"],
    minimum_os_version = "10.13",
    deps = [
        ":ButtonsMacLib",
        ":ButtonsMacResources",
        ":CppLib",
        ":ObjCLib",
    ],
)

## Tests

macos_unit_test(
    name = "ButtonsMacLogicTests",
    bundle_id = "com.google.logic",
    minimum_os_version = "10.13",
    deps = [":ButtonsMacTestsLib"],
)

macos_unit_test(
    name = "ButtonsMacTests",
    minimum_os_version = "10.13",
    test_host = ":ButtonsMac",
    deps = [":ButtonsMacTestsLib"],
)

# Enable when macos_test_runner supports macOS UI Tests.
# macos_ui_test(
#     name = "ButtonsMacUITests",
#     minimum_os_version = "10.13",
#     test_host = ":ButtonsMac",
#     deps = [":ButtonsMacUITestsLib"],
# )

test_suite(
    name = "macOSButtonsTestSuite",
    tests = [
        ":ButtonsMacLogicTests",
        ":ButtonsMacTests",
        # ":ButtonsMacUITests",
    ],
)

filegroup(
    name = "all_files",
    srcs = glob(["**"]),
    visibility = ["//src/TulsiEndToEndTests:__subpackages__"],
)
