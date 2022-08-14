// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Counter {
    uint public count = 0;

    function incrementCount() public {
        count++ ;
    }

    function decrementCount() public {
        if (count <= 0) {
            revert("Increment value before decrementing. Value is at 0.");
        } else count -= 1;
    }
}
