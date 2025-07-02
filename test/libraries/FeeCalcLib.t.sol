// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import { IEscrowDst } from "contracts/interfaces/IEscrowDst.sol";
import { BaseSetup } from "../utils/BaseSetup.sol";

contract FeeCalcLibTest is BaseSetup {
    function setUp() public virtual override {
        BaseSetup.setUp();
    }

    /* solhint-disable func-name-mixedcase */
    function test_getFeeAmounts() public view {
        (IEscrowDst.ImmutablesDst memory immutables,,) = _prepareDataDst();

        assertEq(FEES_AMOUNT, immutables.integratorFeeAmount + immutables.protocolFeeAmount);
        assertEq(PROTOCOL_FEE_AMOUNT, immutables.protocolFeeAmount);
    }
    /* solhint-enable func-name-mixedcase */
}
