// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "../ERC721Storage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract FADAcOmPetition is ERC721URIStorage{
    mapping(uint256 => string) private _notes;
    mapping(uint256 => string) private _institutions;
  
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
  
    constructor() ERC721("COMPFEST", "COMPFEST") {}

    function _setNote(uint256 tokenId, string memory _note) internal{
        require(_exists(tokenId), "ERC721URIStorage: note set of nonexistent token");
        _notes[tokenId] = _note;
    }
  
    function notes(uint256 tokenId) public view returns (string memory){
      require(_exists(tokenId), "ERC721URIStorage: note set of nonexistent token");
      return _notes[tokenId];
    }

    function _setInstitution(uint256 tokenId, string memory _institution) internal{
        require(_exists(tokenId), "ERC721URIStorage: note set of nonexistent token");
        _notes[tokenId] = _institution;
    }
  
    function institution(uint256 tokenId) public view returns (string memory){
      require(_exists(tokenId), "ERC721URIStorage: note set of nonexistent token");
      return _institutions[tokenId];
    }
  
    function mint(string memory URI, string memory note, string memory _institution, address recepient) external onlyOwner{
      _tokenIds.increment();

      uint256 newItemId = _tokenIds.current();
      _mint(recepient, newItemId);
      _setTokenURI(newItemId, URI);
      _setNote(newItemId, note);
      _setInstitution(newItemId, _institution);
    }
  
    function rug() external payable{
      address payable owner = payable(owner());
      owner.transfer(address(this).balance);
    }
  
}