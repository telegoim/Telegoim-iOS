# Copyright 2016 The Tulsi Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Simple mock test.

package(
    default_visibility = ["//TestSuite:__subpackages__"],
)

load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")

test_suite(
    name = "explicit_XCTests",
    tests = [
        ":LogicTest",
        ":XCTest",
    ],
)

objc_library(
    name = "XCTestLib",
    srcs = ["XCTest.m"],
    deps = ["//TestSuite:ApplicationLibrary"],
)

ios_unit_test(
    name = "XCTest",
    minimum_os_version = "11.0",
    runner = "@build_bazel_rules_apple//apple/testing/default_runner:ios_default_runner",
    test_host = "//TestSuite:TestApplication",
    deps = [":XCTestLib"],
)

objc_library(
    name = "LogicTestLib",
    srcs = ["LogicTest.m"],
)

ios_unit_test(
    name = "LogicTest",
    minimum_os_version = "11.0",
    runner = "@build_bazel_rules_apple//apple/testing/default_runner:ios_default_runner",
    deps = [":LogicTestLib"],
)
