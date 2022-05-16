// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract register {
  uint[] _ids;
  string[] _names;
  uint[] _passwords;
  address admin;
  mapping(uint => bool ) users;

  constructor()  {
    admin=msg.sender;
  }

  modifier onlyOwner {
    require(admin==msg.sender);
    _;
  }

  function registerUser(uint id,string memory name,uint password) onlyOwner public {

    require(!users[id]);

    _ids.push(id);
    _names.push(name);
    _passwords.push(password);

  }

  function loginUser(uint id,uint password)  public view returns(bool){

    uint i;
    for(i=0;i<_ids.length;i++) {
      if(id==_ids[i] && password==_passwords[i]) {
        return true;
      }
    }
    return false;
  }

}
