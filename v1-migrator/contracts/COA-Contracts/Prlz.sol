// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PRLZ is ERC20 {
    constructor() ERC20("Busd", "BUSD") {}

    function mint(address _to, uint _amount) external {
        // @audit no access control in the mint function allows anyone to mint token and potentially dos the minting
        _mint(_to, _amount);
    }
}
