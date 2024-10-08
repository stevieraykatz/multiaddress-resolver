{/** @type {import('@/lib/mdxPageProps').MdxMetaProps} */}
export const meta = {
    description: 'Specifies multi-address resolution',
    contributors: [
        'katzman.base.eth',
    ],
    ensip: {
        status: 'draft',
        created: '2024-10-01',
    }
};

# ENSIP-XX: Multiaddress Resolution

## Abstract

This ENSIP specifies a new mechanism for associating multiple addresses with a single name. This should allow a user to collate their onchain identity within a single namespace.

## Motivation

Users leverage multiple wallets for many reaons but each wallet is just another facet of their onchain identity. With a Multiaddress resolver profile, users would have the option to associate any number of their active wallets with their identity.

This resolver extension also enables a critical step-change in how onchain primitives operate: Identity-based attestations, reputation, and builder activity are unlocked once signals are indexed against a namespace instead of a wallet address. 

## Specification

The field `addresses` is introduced which permits a set of addresses to be supported by a single ENS name.

A new accessor function for resolvers is specified:

```solidity
interface MultiaddressResolver {
    function addresses(bytes32 node) external view returns (address[] memory);
}
```

When called on a resolver, this function must return the EVM-compatible list of addresses stored for the specified namehash.

Two new events for resolvers are defined:

```solidity
event AddressesAdded(bytes32 indexed node, address[] addresses);

event AddressesRemoved(bytes32 indexed node, address[] addresses);
```

### Reverse Resolution

This specification is compatible with existing specifications for reverse resolution, specifically ENSIP-19. As of now, the set of addresses stored in the Addresses field are not to be confused with "primary" names. 


## Copyright

Copyright and related rights waived via [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

