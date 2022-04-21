// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 

contract WeikaiMeta is ERC721Enumerable, Ownable {

    bool public _isSaleActive = true;

    uint256 public MAX_SUPPLY = 10;
    uint256 public mintPrice = 0.01 ether;
    uint256 public maxBalance = 10;
    uint256 public maxMint = 10;
    
    string public baseURI;
    string public baseExtension = ".json";

    mapping(uint256 => string) private _tokenURIs;


    constructor(string memory initBaseURI)
        ERC721("WeikaiMeta", "testNFT")
    {
        setBaseURI(initBaseURI);
    }

    function mintWeikaiNFT(uint256 tokenQuantity) public payable {
        require(
            totalSupply() + tokenQuantity <= MAX_SUPPLY,
            "Sale Finished" );
        require(
            _isSaleActive, 
            "Sale must be active to mint by Weikai");
        require(
            balanceOf(msg.sender) + tokenQuantity <= maxBalance,
            "Sale would exceed max balance"
        );
        require(
            tokenQuantity * mintPrice <= msg.value,
            "Not enough ether sent");
        require(
            tokenQuantity <= maxMint, 
            "Can only mint 2 tokens at a time");
        
        for (uint256 i = 0; i < tokenQuantity; i++) {
            uint256 mintIndex = totalSupply() + 1 ;
            if ( mintIndex < MAX_SUPPLY) {
                _safeMint(msg.sender, mintIndex);
            }
        }
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );


        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }
        // If there is a baseURI but no tokenURI, concatenate the tokenID to the baseURI.
        return
            string(abi.encodePacked(base, Strings.toString(tokenId), baseExtension));
    }

    function flipSaleActive() public onlyOwner {
        _isSaleActive = !_isSaleActive;
    }

    function setBaseURI (string memory _newBaseURI ) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }
}