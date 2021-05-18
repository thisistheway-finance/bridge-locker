//SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "./AbstractLocker.sol";

import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

interface IERC20MintBurnUpgradeable is IERC20Upgradeable {
    function burnFrom(address account, uint256 amount) external;
    function mint(address account, uint256 amount) external returns (bool);
}

contract MintingLocker is AbstractLocker {

    function _receiveTokens(
        address _fromAddress,
        uint256 _amount
    ) internal override {
        // burn tokens
        IERC20MintBurnUpgradeable(token).burnFrom(_fromAddress, _amount);
    }

    function _sendTokens(
        address _toAddress,
        uint256 _amount
    ) internal override {
        // mint tokens
        IERC20MintBurnUpgradeable(token).mint(_toAddress, _amount);
    }

}