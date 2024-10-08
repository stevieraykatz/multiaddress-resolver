// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {EnumerableSetLib} from "solady/utils/EnumerableSetLib.sol";
import {ResolverBase} from "ens-contracts/resolvers/ResolverBase.sol";

import {IMultiaddressResolver} from "./IMultiaddressResolver.sol";

abstract contract MultiaddressResolver is IMultiaddressResolver, ResolverBase {
    using EnumerableSetLib for EnumerableSetLib.AddressSet;

    uint256 private constant COIN_TYPE_ETH = 60;

    mapping(uint64 version => mapping(bytes32 node => mapping(uint256 cointype => EnumerableSetLib.AddressSet addressSet))) versionable_addressSets;

    function addAddrs(bytes32 node, address[] calldata addresses) external virtual authorised(node) {
        addAddrs(node, addresses, COIN_TYPE_ETH);
    }

    function addAddrs(bytes32 node, address[] calldata addresses, uint256 cointype) public virtual  authorised(node) {
        uint64 version = recordVersions[node];
        for(uint256 i; i < addresses.length; i++){
           versionable_addressSets[version][node][cointype].add(addresses[i]);
        }
        emit AddressesAdded(node, cointype, addresses);
    }

    function removeAddrs(bytes32 node, address[] calldata addresses) external virtual  authorised(node) {
        removeAddrs(node, addresses, COIN_TYPE_ETH);
    }

    function removeAddrs(bytes32 node, address[] calldata addresses, uint256 cointype) public virtual authorised(node) {
        uint64 version = recordVersions[node];
        for(uint256 i; i < addresses.length; i++){
           versionable_addressSets[version][node][cointype].remove(addresses[i]);
        }
        emit AddressesRemoved(node, cointype, addresses);
    }

    function addrs(bytes32 node, uint256 cointype) external virtual view returns (address[] memory) {
        return versionable_addressSets[recordVersions[node]][node][cointype].values();
    }

    function addrs(bytes32 node) external virtual view returns (address[] memory) {
        return versionable_addressSets[recordVersions[node]][node][COIN_TYPE_ETH].values();
    }

    function supportsInterface(
        bytes4 interfaceID
    ) public view virtual override returns (bool) {
        return
            interfaceID == type(IMultiaddressResolver).interfaceId ||
            super.supportsInterface(interfaceID);
    }
}