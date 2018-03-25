pragma solidity ^0.4.10;
import "./Contract1.sol";

contract Contract2{
address _add;
Affiliate[] public Affiliates;
struct Affiliate
{
  address public_address;
  uint balance;
}

function returnAdd(address _pubaddress) returns (address){
    _add = new Contract1(_pubaddress);
    return _add;
}

function addAffiliate(address _public_address) returns(bool success) {
  Affiliate memory newAffiliate;
  newAffiliate.public_address= _public_address;
  Contract1 contract1= new Contract1(_public_address);
  newAffiliate.balance= contract1.getBalance(_public_address);
  Affiliates.push(newAffiliate);
  return true;
}

function getAffiliate() constant returns (address[], uint[]) {

uint length = Affiliates.length;
address[] memory _publicAddress = new address[](length);
uint[] memory _balance = new uint[](length);

for (uint i = 0; i < Affiliates.length; i++) {
Affiliate memory currentAffiliate;
currentAffiliate = Affiliates[i];
_publicAddress[i] = currentAffiliate.public_address;
_balance[i] = currentAffiliate.balance;
}
return (_publicAddress, _balance);

}

}
