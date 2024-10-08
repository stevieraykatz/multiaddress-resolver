// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {EnumerableSetLib} from "solady/utils/EnumerableSetLib.sol";
import {ResolverBase} from "ens-contracts/resolvers/ResolverBase.sol";

import {IMultiaddressResolver} from "./IMultiaddressResolver.sol";

contract MultiaddressResolver is IMultiaddressResolver, ResolverBase {
    using EnumerableSetLib for EnumerableSetLib.AddressSet;

    uint256 private constant COIN_TYPE_ETH = 60;

    mapping(uint64 version => mapping(bytes32 node => mapping(uint256 cointype => EnumerableSetLib.AddressSet addresses))) versionable_addressSets;

    function addAddrs(bytes32 node, address[] calldata addrs) external authorised(node) {
        addAddrs(node, addrs, COIN_TYPE_ETH);
    }

    function addAddrs(bytes32 node, address[] calldata addrs, uint256 cointype) public authorised(node) {
        uint64 version = version[node];
        for(uint256 i; i < addrs.length; i++){
           versionable_addressSets[version][node][cointype].add(addrs[i]);
        }
        emit AddressesAdded(node, addrs, cointype);
    }

    function removeAddrs(bytes32 node, address[] calldata addrs) external authorised(node) {
        removeAddrs(node, addrs, COIN_TYPE_ETH);
    }

    function removeAddrs(bytes32 node, address[] calldata addrs, uint256 cointype) public authorised(node) {
        uint64 version = version[node];
        for(uint256 i; i < addrs.length; i++){
           versionable_addressSets[version][node][cointype].remove(addrs[i]);
        }
        emit AddressesRemoved(node, addrs, cointype);
    }

    function addrs(bytes32 node, uint256 cointype) external view returns (address[] memory) {
        return versionable_addressSets[version[node]][node][cointype].values;
    }

    function addrs(bytes32 node) external view returns (address[] memory) {
        return versionable_addressSets[version[node]][node][COIN_TYPE_ETH].vlaues;
    }

    function supportsInterface(
        bytes4 interfaceID
    ) public view virtual override returns (bool) {
        return
            interfaceID == type(IMultiaddressResolver).interfaceId ||
            super.supportsInterface(interfaceID);
    }
}