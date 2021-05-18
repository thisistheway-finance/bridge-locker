// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20BurnableUpgradeable.sol";

contract BridgingToken is Initializable, ContextUpgradeable, OwnableUpgradeable, ERC20BurnableUpgradeable {

    function initialize(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public initializer {
        __BridgingToken_init(_name, _symbol, _decimals);
    }

    function __BridgingToken_init(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __ERC20_init_unchained(_name, _symbol);
        _setupDecimals(_decimals);
        __ERC20Burnable_init_unchained();
        __BridgingToken_init_unchained();
    }

    function __BridgingToken_init_unchained (
    ) internal initializer {
    }

    function mint(address account, uint256 amount) external onlyOwner returns (bool) {
        // Checks

        // Effects

        // Interactions
        _mint(account, amount);
        return true;
    }

    uint256[50] private __gap;
}