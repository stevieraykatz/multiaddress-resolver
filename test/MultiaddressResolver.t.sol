// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Test} from "forge-std/Test.sol";
import {MultiaddressResolver} from "src/MultiaddressResolver.sol";
import {MockPublicResolver} from "./MockPublicResolver.sol";

contract MultiaddressResolverTest is Test {
    MockPublicResolver public resolver;

    function setUp() public {
        resolver = new MockPublicResolver();
    }

    function test_addsMultipleAddresses() public {}
}
