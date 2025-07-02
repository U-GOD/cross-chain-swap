// SPDX-License-Identifier: MIT

pragma solidity 0.8.23;

import { IEscrowDst } from "contracts/interfaces/IEscrowDst.sol";
import { IEscrowSrc } from "contracts/interfaces/IEscrowSrc.sol";
import { ImmutablesLib } from "contracts/libraries/ImmutablesLib.sol";

contract ImmutablesLibProxy {
    function hash(IEscrowSrc.Immutables calldata immutables) external pure returns(bytes32) {
        return ImmutablesLib.hash(immutables);
    }

    function hash(IEscrowDst.ImmutablesDst calldata immutables) external pure returns(bytes32) {
        return ImmutablesLib.hash(immutables);
    }

    function hashes(IEscrowSrc.Immutables calldata src, IEscrowDst.ImmutablesDst calldata dst)
        external
        pure
        returns (bytes32, bytes32)
    {
        return (ImmutablesLib.hash(src), ImmutablesLib.hash(_asImmutables(dst)));
    }

    function _asImmutables(IEscrowDst.ImmutablesDst calldata dst)
        internal
        pure
        returns (IEscrowSrc.Immutables calldata src)
    {
        assembly ("memory-safe") {
            src := dst
        }
    }
}