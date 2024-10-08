// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MultiaddressResolver} from "src/MultiaddressResolver.sol";

contract MockPublicResolver is MultiaddressResolver {
    bool auth = true;

    function setAuth(bool auth_) public {
        auth = auth_;
    }

    function isAuthorised(bytes32) internal view override returns (bool) {
        return auth;
    }
}
