pragma solidity ^0.4.11;

 contract Contract1 {
  mapping (address => uint) balances;
  mapping (address => uint) totalNoofJobs;
  address owner;
  uint public reward;
  uint[] public volumeThreshold;
  uint[] public volumeAffiliatePercentage;

  function Contract1(address _affiliateAddress) {
        owner=msg.sender;
        balances[owner]=150000;
        volumeThreshold = [1,5,100,1000];
        volumeAffiliatePercentage = [1, 2, 3,5];
        balances[_affiliateAddress]=0;
        totalNoofJobs[_affiliateAddress]=0;
    }

  function addJobs(address _affiliateAddress,uint _jobs) {
    totalNoofJobs[_affiliateAddress]+=_jobs;
  }

  function changeBudget(uint _newBudget){
    if(msg.sender==owner)
    balances[owner]=_newBudget;
  }

  function getBalance(address _affiliateAddress) constant returns(uint) {
    return balances[_affiliateAddress];
}

  function returnBalance(address _affiliateAddress) external returns(uint) {
    return balances[_affiliateAddress];
}

function getAffiliatePercentage(address _affiliateAddress) constant returns (uint) {
        for (uint i = 0; i < volumeThreshold.length; i++) {
            if (totalNoofJobs[_affiliateAddress] < volumeThreshold[i]) return volumeAffiliatePercentage[i];
        }

        return volumeAffiliatePercentage[volumeThreshold.length - 1];
    }

   function commissionAgreement(address _affiliateAddress,uint _reward) returns (bool) {
     uint payment = _reward* getAffiliatePercentage(_affiliateAddress) / 100;
      if(balances[owner]>payment){
        balances[_affiliateAddress] += payment;
        balances[owner] -=payment;
        return true;
      }
      else
       return false;
    }

function payPerProductAgreement(address _affiliateAddress,uint _rewardperSale) returns (bool) {
   if(balances[owner]>_rewardperSale){
     balances[_affiliateAddress] += _rewardperSale;
     balances[owner] -=_rewardperSale;
     return true;
   }
   else
    return false;
 }
}
