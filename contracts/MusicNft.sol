//SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicNft is ERC721URIStorage {

    using Counters for Counters.Counter;

    Counters.Counter private _tokensIds;
    address public owner;

    constructor() ERC721("SpotifyMusic", "SYM") {
        owner = msg.sender;
        createToken("https://ipfs.moralis.io:2053/ipfs/QmT6Z3dN2wGkZmcEqLnVyD5Q3ZGueu53U7RQthpvM9BSF4/metadata/0.json");
        createToken("https://ipfs.moralis.io:2053/ipfs/QmT6Z3dN2wGkZmcEqLnVyD5Q3ZGueu53U7RQthpvM9BSF4/metadata/1.json");
    }

    function createToken(string memory tokenURI) public returns (uint) {
        require(msg.sender == owner, "Only Owner is allowed to createToken");
        _tokensIds.increment();
        uint256 newItemId = _tokensIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
