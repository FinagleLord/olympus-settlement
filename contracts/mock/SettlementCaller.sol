// SPDX-License-Identifier: MIT

pragma solidity =0.8.0;
pragma experimental ABIEncoderV2;

import "../interfaces/ISettlement.sol";

contract SettlementCaller {
    ISettlement settlement;

    constructor(ISettlement _settlement) public {
        settlement = _settlement;
    }

    function fillOrder(ISettlement.FillOrderArgs calldata args) external returns (uint amountOut) {
        return settlement.fillOrder(args);
    }
}
