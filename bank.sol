pragma solidity >= 0.5.0 <=0.9.0;
 contract BankSystem{

     mapping(address=>uint) details;
     function addamount() payable public{
         if(details[msg.sender]==0){
             details[msg.sender]=msg.value;
         }

         else{
         details[msg.sender]=details[msg.sender]+msg.value;
         }


     }


     function checkamount() public view returns(uint){
         uint balance=details[msg.sender];
         return balance;

     }

     function totalamount() public view returns(uint){
         return address(this).balance;
     }

     function transferamount(address transferaddress,uint amount)   payable public   returns(string memory){
         uint balance;
         balance=details[msg.sender];
         address  payable tadress=payable(transferaddress);
         if(amount<balance||amount==balance){
             tadress.transfer(amount);
             details[msg.sender]=details[msg.sender]-amount;
             return("Amount Transfered to other account");

         }
         else if(amount>balance){
           revert("Not Enough   Balance");

         }
     }

     function selfdraw(uint amount) public payable   returns(string memory){
         address  payable tadress=payable(msg.sender);
         uint balance=details[msg.sender];

         if(amount<balance||amount==balance){
             tadress.transfer(amount);
             details[msg.sender]=details[msg.sender]-amount;
             return("Amount  retreived");

         }
         else if(amount>details[msg.sender]){
           revert("Not enough  balance");

         }
          




    }
    

        



     


  
 }
