// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {IMultiaddressResolver} from "./IMultiaddressResolver.sol";

contract MultiaddressResolver is IMultiaddressResolver {
    

    function addrs(bytes32 node, uint256 cointype) external view returns (address[] memory) {
        
    }

    function addrs(bytes32 node) external view returns (address[] memory) {

    }

}