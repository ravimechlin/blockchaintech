pragma solidity >= 0.5.0 <=0.9.0;
pragma solidity 0.8.7; 

contract wallet { 

 

    address private _mowner; 

    constructor(){ 

        _mowner=msg.sender; 

    } 

    event amountwithdraw(address indexed _benificial,uint _amount); 

    event amountadded(address indexed _benificial,uint _amount); 

    mapping(address=>uint) allownce; 

    modifier onlyOwner{ 

        require(msg.sender==_mowner,"you are not the owner"); 

        _; 

 

    } 

    

 

 

 

    

 

    // function withdraw(uint amount,address payable acccount) public payable onlyOwner{ 

    //     owner.transfer(amount); 

 

    // } 

 

    function allow( address payable _who,uint _amount) onlyOwner public { 

        allownce[_who]=_amount; 

        _who.transfer(_amount); 

 

    } 

 

    function reduceamount(address _who,uint _amount) internal{ 

        allownce[_who]=allownce[_who]-_amount; 

 

 

    } 

 

 

    function withdrawmoney( address payable  add ,uint _amount) public{ 

        require(_amount<=address(this).balance,"not enough amount"); 

 

        if(msg.sender!=_mowner){ 

            reduceamount(add,_amount); 

 

        } 

        emit amountwithdraw(add,_amount); 

        add.transfer(_amount); 

 

 

    } 

 

    function fundtransfer(uint _amount,address payable _t)  onlyOwner public  { 

        _t.transfer(_amount); 

 

 

 

    } 

 