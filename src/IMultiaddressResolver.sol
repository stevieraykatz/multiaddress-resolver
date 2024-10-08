// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/// @title Multiaddress Resolver profile
///
/// @author katzman.base.eth (https://github.com/stevieraykatz)
interface IMultiaddressResolver {
    /// @notice Emitted when addresses are added to a node's resolver.
    ///
    /// @param node The associated namehash.
    /// @param cointype The network-as-cointype for the address array.
    /// @param addresses The list of addresses added for `node`.
    event AddressesAdded(bytes32 indexed node, uint256 cointype, address[] addresses);

    /// @notice Emitted when addresses are removed from a node's resolver.
    ///
    /// @param node The associated namehash.
    /// @param cointype The network-as-cointype for the address array.
    /// @param addresses The list of removed addresses for `node`.
    event AddressesRemoved(bytes32 indexed node, uint256 cointype, address[] addresses);

    /// @notice Fetch method for getting a `node`'s associated address list.
    ///
    /// @dev Returns the addresses associated with `cointype` == 60 (ETH).
    ///
    /// @param node The associated namehash.
    ///
    /// @return The list of addresses associated with `node`.
    function addrs(bytes32 node) external view returns (address[] memory);

    /// @notice Fetch method for getting a `node`'s associated address list for a specified network.
    ///
    /// @dev Returns the addresses associated with `cointype` == 60 (ETH).
    ///
    /// @param node The associated namehash.
    /// @param cointype The network-as-cointype for the records.
    ///
    /// @return The list of addresses associated with `node` for the specified cointype.
    function addrs(bytes32 node, uint256 cointype) external view returns (address[] memory);
}
