// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {IMultiaddressResolver} from "./IMultiaddressResolver.sol";
import {ResolverBase} from "ens-contracts/resolvers/ResolverBase.sol";

contract MultiaddressResolver is IMultiaddressResolver, ResolverBase {
    

    uint256 private constant COIN_TYPE_ETH = 60;

    mapping()

    function addrs(bytes32 node, uint256 cointype) external view returns (address[] memory) {
        
    }

    function addrs(bytes32 node) external view returns (address[] memory) {

    }

    function supportsInterface(
        bytes4 interfaceID
    ) public view virtual override returns (bool) {
        return
            interfaceID == type(IMultiaddressResolver).interfaceId ||
            super.supportsInterface(interfaceID);
    }
}