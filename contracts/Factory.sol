// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Exchange.sol";

interface IFactory {
    function getExchange(address _tokenAddress) external returns (address);
}
contract Factory {
    mapping(address => address) public tokenToExchanges;

    function createExchange(address _tokenAddress) public returns (address) {
        require(_tokenAddress != address(0), "Invalid token address");

        require(
            tokenToExchanges[_tokenAddress] == address(0),
            "Exchange already exists"
        );

        Exchange exchange = new Exchange(_tokenAddress);
        tokenToExchanges[_tokenAddress] = address(exchange);

        return address(exchange);
    }

    function getExchange(address _tokenAddress) public view returns (address) {
        return tokenToExchanges[_tokenAddress];
    }
}
