contract Bnb {
  // struct TotalFreezeTuple {
  //   uint n;
  //   bool _valid;
  // }
  struct TotalSupplyTuple {
    uint n;
    bool _valid;
  }
  // struct AllowanceTuple {
  //   uint n;
  //   bool _valid;
  // }
  // struct TotalUnfreezeTuple {
  //   uint n;
  //   bool _valid;
  // }
  struct OwnerTuple {
    address p;
    bool _valid;
  }
  struct FreezeSumTuple {
    uint m;
    bool _valid;
  }
  struct TotalBalancesTuple {
    uint m;
    bool _valid;
  }
  // struct BalanceOfTuple {
  //   uint n;
  //   bool _valid;
  // }
  // mapping(address=>TotalFreezeTuple) totalFreeze;
  mapping(address=>uint) totalFreeze;
  // mapping(address=>TotalUnfreezeTuple) totalUnfreeze;
  mapping(address=>uint) totalUnfreeze;
  OwnerTuple owner;
  FreezeSumTuple freezeSum;
  TotalSupplyTuple totalSupply;
  TotalBalancesTuple totalBalances;
  // mapping(address=>BalanceOfTuple) balanceOf;
  mapping(address=>uint) balanceOf;
  // mapping(address=>mapping(address=>AllowanceTuple)) allowance;
  mapping(address=>mapping(address=>uint)) allowance;
  event TransferFrom(address from,address to,address spender,uint amount);
  event Burn(address p,uint amount);
  event Mint(address p,uint amount);
  event WithdrawEther(address p,uint amount);
  event IncreaseAllowance(address p,address s,uint n);
  event Unfreeze(address p,uint n);
  event Freeze(address p,uint n);
  event Transfer(address from,address to,uint amount);
  constructor(uint initialSupply) public {
    updateAllMintOnInsertConstructor_r9(initialSupply);
    updateTotalSupplyOnInsertConstructor_r5(initialSupply);
    updateBalanceOfOnInsertConstructor_r4(initialSupply);
    updateTotalBalancesOnInsertConstructor_r25(initialSupply);
    updateTotalMintOnInsertConstructor_r32(initialSupply);
    updateOwnerOnInsertConstructor_r7();
    updateTotalInOnInsertConstructor_r30(initialSupply);
  }
  function approve(address s,uint n) public    {
      // bool r29 = updateIncreaseAllowanceOnInsertRecv_approve_r29(s,n);
      // if(r29==false) {
      //   revert("Rule condition failed");
      // }

      address o = msg.sender;
      uint m = allowance[o][s];
      uint d = n-m;
      // updateAllowanceTotalOnInsertIncreaseAllowance_r33(o,s,d);
      int delta0 = int(d);
      int _delta = int(delta0);
      uint newValue = updateuintByint(allowance[o][s],_delta);
      allowance[o][s] = newValue;

      emit IncreaseAllowance(o,s,d);

  }
  function transfer(address to,uint amount) public    {
      // bool r8 = updateTransferOnInsertRecv_transfer_r8(to,amount);
      // if(r8==false) {
      //   revert("Rule condition failed");
      // }
      address s = msg.sender;
      // uint m = balanceOf[s].n;
      uint m = balanceOf[s];
      if(amount<=m && amount>0 && to!=address(0) && amount+m>=m) {
        //updateTotalOutOnInsertTransfer_r20(s,n);
        int delta0 = int(amount);
        int _delta = int(-delta0);
        uint newValue = updateuintByint(balanceOf[s],_delta);
        balanceOf[s] = newValue;
        //updateTotalInOnInsertTransfer_r31(r,n);
        int delta0_1 = int(amount);
        int _delta_1 = int(delta0_1);
        uint newValue_1 = updateuintByint(balanceOf[to],_delta_1);
        balanceOf[to] = newValue_1;
        emit Transfer(s,to,amount);
      }
      else{
        revert("Rule condition failed");
      }
  }
  function freeze(uint n) public    {
      // bool r24 = updateFreezeOnInsertRecv_freeze_r24(n);
      // if(r24==false) {
      //   revert("Rule condition failed");
      // }

      address p = msg.sender;
      // uint m = balanceOf[p].n;
      uint m = balanceOf[p];
      if(n<=m && n>0) {
        int delta0 = int(n);
        int _delta = int(-delta0);
        uint newValue = updateuintByint(balanceOf[p],_delta);
        balanceOf[p] = newValue;
        totalFreeze[p] += n;
        emit Freeze(p,n);
      }
      else revert("Rule condition failed");
  }
  function getAllowance(address p,address s) public view  returns (uint) {
      // uint n = allowance[p][s].n;
      uint n = allowance[p][s];
      return n;
  }
  function getTotalSupply() public view  returns (uint) {
      uint n = totalSupply.n;
      return n;
  }
  function transferFrom(address from,address to,uint amount) public    {
      // bool r14 = updateTransferFromOnInsertRecv_transferFrom_r14(from,to,amount);
      // if(r14==false) {
      //   revert("Rule condition failed");
      // }

      // if (to == address(0x0)) revert();                                // Prevent transfer to 0x0 address. Use burn() instead
      // if (amount <= 0) revert(); 
      // if (balanceOf[from] < amount) revert();                 // Check if the sender has enough
      // if (balanceOf[to] + amount < balanceOf[to]) revert();  // Check for overflows
      // if (amount > allowance[from][msg.sender]) revert();     // Check allowance                      // Subtract from the sender
      // balanceOf[from] -= amount;                           // Subtract from the sender
      // balanceOf[to] += amount;                             // Add the same to the recipient
      // allowance[from][msg.sender] -= amount;
      // emit Transfer(from, to, amount);
      // //return true;

      address s = msg.sender;
      uint k = allowance[from][s];
      // uint m = balanceOf[o].n;
      uint m = balanceOf[from];
      uint p = balanceOf[to];
      if (m < amount) revert("Rule condition failed");
      if (to == address(0)) revert("Rule condition failed");
      if (amount +p < p) revert("Rule condition failed");
      if (k < amount) revert("Rule condition failed");
      // if(m>=amount && to!=address(0) && amount+p>=p && k>=amount) {
        //updateSpentTotalOnInsertTransferFrom_r22(o,s,n);
        // int delta0 = int(amount);
        // int _delta = int(-delta0);
        // uint newValue = updateuintByint(allowance[from][s],_delta);
        allowance[from][s] -= amount;
        //updateTransferOnInsertTransferFrom_r1(o,r,n);
        // int _delta_1 = int(delta0);
        // uint newValue_1 = updateuintByint(balanceOf[to],_delta_1);
        balanceOf[to] += amount;
        // uint newValue_2 = updateuintByint(balanceOf[from],_delta);
        balanceOf[from] -= amount;
        emit Transfer(from,to,amount);

        // emit TransferFrom(from,to,s,amount);
      // }
      //else revert("Rule condition failed");
  }

  function unfreeze(uint n) public    {
    if (freezeOf(msg.sender) < n) revert("Rule condition failed");
    if (n <= 0) revert("Rule condition failed");
    totalUnfreeze[msg.sender] += n;
    balanceOf[msg.sender] += n;
    emit Unfreeze(msg.sender,n);
      // address p = msg.sender;
      // uint m = freezeOf(p);
      // if(n<=m && n>0) {
      //   // // updateTotalUnfreezeOnInsertUnfreeze_r13(p,n);
      //   // int delta0 = int(n);
      //   // // updateFreezeOfOnIncrementTotalUnfreeze_r12(p,delta0);
      //   // int delta0_1 = int(-delta0);
      //   // // updateBalanceOfOnIncrementFreezeOf_r15(p,delta0);
      //   // int _delta = int(-delta0_1);
      //   int _delta = int(n);
      //   uint newValue = updateuintByint(balanceOf[p].n,_delta);
      //   balanceOf[p].n = newValue;
      //   totalUnfreeze[p].n += n;
      //   emit Unfreeze(p,n);

      // }
      // else revert("Rule condition failed");
  }

  function getBalanceOf(address p) public view  returns (uint) {
      // uint n = balanceOf[p].n;
      uint n = balanceOf[p];
      return n;
  }
  function withdrawEther(uint amount) public    {
      bool r23 = updateWithdrawEtherOnInsertRecv_withdrawEther_r23(amount);
      if(r23==false) {
        revert("Rule condition failed");
      }
  }
  function burn(uint amount) public    {
      bool r16 = updateBurnOnInsertRecv_burn_r16(amount);
      if(r16==false) {
        revert("Rule condition failed");
      }
  }

  // function updateTransferFromOnInsertRecv_transferFrom_r14(address o,address r,uint n) private   returns (bool) {
  //     address s = msg.sender;
  //     uint k = allowance[o][s].n;
  //     // uint m = balanceOf[o].n;
  //     uint m = balanceOf[o];
  //     if(m>=n && r!=address(0) && n+m>=m && n>0 && k>=n) {
  //       //updateSpentTotalOnInsertTransferFrom_r22(o,s,n);
  //       int delta0_11 = int(n);
  //       int _delta_11 = int(-delta0_11);
  //       uint newValue_11 = updateuintByint(allowance[o][s].n,_delta_11);
  //       allowance[o][s].n = newValue_11;
  //       //updateTransferOnInsertTransferFrom_r1(o,r,n);
  //       int delta0_1 = int(n);
  //       int _delta_1 = int(delta0_1);
  //       uint newValue_1 = updateuintByint(balanceOf[r],_delta_1);
  //       balanceOf[r] = newValue_1;
  //       int delta0 = int(n);
  //       int _delta = int(-delta0);
  //       uint newValue = updateuintByint(balanceOf[o],_delta);
  //       balanceOf[o] = newValue;
  //       emit Transfer(o,r,n);

  //       emit TransferFrom(o,r,s,n);
  //       return true;
  //     }
  //     return false;
  // }

  // function updateFreezeOfOnIncrementTotalFreeze_r12(address p,int f) private    {
  //     int delta0 = int(f);
  //     // updateBalanceOfOnIncrementFreezeOf_r15(p,delta0);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     balanceOf[p] = newValue;
  // }

  function updateBalanceOfOnIncrementTotalBurn_r15(address p,int m) private    {
      int _delta = int(-m);
      // uint newValue = updateuintByint(balanceOf[p].n,_delta);
      uint newValue = updateuintByint(balanceOf[p],_delta);
      // balanceOf[p].n = newValue;
      balanceOf[p] = newValue;
  }
  function freezeOf(address p) private view  returns (uint) {
      // uint u = totalUnfreeze[p].n;
      uint u = totalUnfreeze[p];
      uint f = totalFreeze[p];
      uint n = f-u;
      return n;
  }
  // function updateTransferOnInsertRecv_transfer_r8(address r,uint n) private   returns (bool) {
  //     address s = msg.sender;
  //     // uint m = balanceOf[s].n;
  //     uint m = balanceOf[s];
  //     if(n<=m && n>0 && r!=address(0) && n+m>=m) {
  //       //updateTotalOutOnInsertTransfer_r20(s,n);
  //       int delta0 = int(n);
  //       int _delta = int(-delta0);
  //       uint newValue = updateuintByint(balanceOf[s],_delta);
  //       balanceOf[s] = newValue;
  //       //updateTotalInOnInsertTransfer_r31(r,n);
  //       int delta0_1 = int(n);
  //       int _delta_1 = int(delta0_1);
  //       uint newValue_1 = updateuintByint(balanceOf[r],_delta_1);
  //       balanceOf[r] = newValue_1;
  //       emit Transfer(s,r,n);
  //       return true;
  //     }
  //     return false;
  // }

  // function updateTotalInOnInsertTransfer_r31(address p,uint n) private    {
  //     int delta0 = int(n);
  //     //updateBalanceOfOnIncrementTotalIn_r15(p,delta0);
  //     int _delta = int(delta0);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     balanceOf[p] = newValue;
  // }

  // function updateUnfreezeOnInsertRecv_unfreeze_r6(uint n) private   returns (bool) {
  //     address p = msg.sender;
  //     uint m = freezeOf(p);
  //     if(n<=m && n>0) {
  //       // updateTotalUnfreezeOnInsertUnfreeze_r13(p,n);
  //       int delta0 = int(n);
  //       // updateFreezeOfOnIncrementTotalUnfreeze_r12(p,delta0);
  //       int delta0_1 = int(-delta0);
  //       // updateBalanceOfOnIncrementFreezeOf_r15(p,delta0);
  //       int _delta = int(-delta0_1);
  //       uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //       balanceOf[p].n = newValue;
  //       totalUnfreeze[p].n += n;
  //       emit Unfreeze(p,n);
  //       return true;
  //     }
  //     return false;
  // }

  // function updateBalanceOfOnIncrementFreezeOf_r15(address p,int f) private    {
  //     int _delta = int(-f);
  //     uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //     balanceOf[p].n = newValue;
  // }
  function updateBalanceOfOnInsertConstructor_r4(uint n) private    {
      address s = msg.sender;
      // balanceOf[s] = BalanceOfTuple(n,true);
      balanceOf[s] = n;
  }

  // function updateAllowanceOnIncrementAllowanceTotal_r26(address o,address s,int m) private    {
  //     int _delta = int(m);
  //     uint newValue = updateuintByint(allowance[o][s],_delta);
  //     allowance[o][s] = newValue;
  // }

  function updateAllMintOnInsertConstructor_r9(uint n) private    {
      // Empty()
  }
  // function updateBalanceOfOnIncrementTotalIn_r15(address p,int i) private    {
  //     int _delta = int(i);
  //     // uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     // balanceOf[p].n = newValue;
  //     balanceOf[p] = newValue;
  // }
  function updateTotalMintOnInsertConstructor_r32(uint n) private    {
      address s = msg.sender;
      // Empty()
  }
  function updateOwnerOnInsertConstructor_r7() private    {
      address s = msg.sender;
      owner = OwnerTuple(s,true);
  }
  function updateAllBurnOnInsertBurn_r28(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllBurn_r19(delta0);
  }
  // function updateTotalOutOnInsertTransfer_r20(address p,uint n) private    {
  //     int delta0 = int(n);
  //     // updateBalanceOfOnIncrementTotalOut_r15(p,delta0);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     balanceOf[p] = newValue;
  // }

  // function updateTransferOnInsertTransferFrom_r1(address o,address r,uint n) private    {
  //     // updateTotalInOnInsertTransfer_r31(r,n);
  //     int delta0_1 = int(n);
  //     //updateBalanceOfOnIncrementTotalIn_r15(p,delta0);
  //     int _delta_1 = int(delta0_1);
  //     uint newValue_1 = updateuintByint(balanceOf[r],_delta_1);
  //     balanceOf[r] = newValue_1;
  //     //updateTotalOutOnInsertTransfer_r20(o,n);
  //     int delta0 = int(n);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(balanceOf[o],_delta);
  //     balanceOf[o] = newValue;
  //     emit Transfer(o,r,n);
  // }

  // function updateFreezeOnInsertRecv_freeze_r24(uint n) private   returns (bool) {
  //     address p = msg.sender;
  //     // uint m = balanceOf[p].n;
  //     uint m = balanceOf[p];
  //     if(n<=m && n>0) {
  //       //updateTotalFreezeOnInsertFreeze_r0(p,n);
  //       int delta0 = int(n);
  //       //updateFreezeOfOnIncrementTotalFreeze_r12(p,delta0);
  //       int _delta = int(-delta0);
  //       uint newValue = updateuintByint(balanceOf[p],_delta);
  //       balanceOf[p] = newValue;
  //       totalFreeze[p].n += n;
  //       emit Freeze(p,n);
  //       return true;
  //     }
  //     return false;
  // }

  // function updateBalanceOfOnIncrementTotalOut_r15(address p,int o) private    {
  //     int _delta = int(-o);
  //     // uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     // balanceOf[p].n = newValue;
  //     balanceOf[p] = newValue;
  // }
  // function updateFreezeOfOnIncrementTotalUnfreeze_r12(address p,int u) private    {
  //     int delta0 = int(-u);
  //     // updateBalanceOfOnIncrementFreezeOf_r15(p,delta0);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //     balanceOf[p].n = newValue;
  // }

  // function updateAllowanceOnIncrementSpentTotal_r26(address o,address s,int l) private    {
  //     int _delta = int(-l);
  //     uint newValue = updateuintByint(allowance[o][s].n,_delta);
  //     allowance[o][s].n = newValue;
  // }

  // function updateIncreaseAllowanceOnInsertRecv_approve_r29(address s,uint n) private   returns (bool) {
  //     address o = msg.sender;
  //     uint m = allowance[o][s];
  //     uint d = n-m;
  //     // updateAllowanceTotalOnInsertIncreaseAllowance_r33(o,s,d);
  //     int delta0 = int(d);
  //     int _delta = int(delta0);
  //     uint newValue = updateuintByint(allowance[o][s],_delta);
  //     allowance[o][s] = newValue;

  //     emit IncreaseAllowance(o,s,d);
  //     return true;
  //     return false;
  // }

  function updateuintByint(uint x,int delta) private   returns (uint) {
      int convertedX = int(x);
      int value = convertedX+delta;
      uint convertedValue = uint(value);
      return convertedValue;
  }

  // function updateTotalFreezeOnInsertFreeze_r0(address p,uint n) private    {
  //     int delta0 = int(n);
  //     //updateFreezeOfOnIncrementTotalFreeze_r12(p,delta0);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(balanceOf[p],_delta);
  //     balanceOf[p] = newValue;
  //     totalFreeze[p].n += n;
  // }

  // function updateTotalUnfreezeOnInsertUnfreeze_r13(address p,uint n) private    {
  //     int delta0 = int(n);
  //     // updateFreezeOfOnIncrementTotalUnfreeze_r12(p,delta0);
  //     int delta0_1 = int(-delta0);
  //     // updateBalanceOfOnIncrementFreezeOf_r15(p,delta0);
  //     int _delta = int(-delta0_1);
  //     uint newValue = updateuintByint(balanceOf[p].n,_delta);
  //     balanceOf[p].n = newValue;
  //     totalUnfreeze[p].n += n;
  // }

  // function updateSpentTotalOnInsertTransferFrom_r22(address o,address s,uint n) private    {
  //     int delta0 = int(n);
  //     //updateAllowanceOnIncrementSpentTotal_r26(o,s,delta0);
  //     int _delta = int(-delta0);
  //     uint newValue = updateuintByint(allowance[o][s].n,_delta);
  //     allowance[o][s].n = newValue;
  // }

  function updateBurnOnInsertRecv_burn_r16(uint n) private   returns (bool) {
      address p = msg.sender;
      // uint m = balanceOf[p].n;
      uint m = balanceOf[p];
      if(p!=address(0) && n<=m) {
        updateAllBurnOnInsertBurn_r28(n);
        updateTotalBurnOnInsertBurn_r17(p,n);
        emit Burn(p,n);
        return true;
      }
      return false;
  }
  function updateTotalInOnInsertConstructor_r30(uint n) private    {
      address s = msg.sender;
      // Empty()
  }
  function updateSendOnInsertWithdrawEther_r3(address p,uint n) private    {
      payable(p).send(n);
  }
  function updateTotalSupplyOnInsertConstructor_r5(uint n) private    {
      totalSupply = TotalSupplyTuple(n,true);
  }
  function updateTotalSupplyOnIncrementAllBurn_r19(int b) private    {
      int _delta = int(-b);
      uint newValue = updateuintByint(totalSupply.n,_delta);
      totalSupply.n = newValue;
  }
  function updateTotalBurnOnInsertBurn_r17(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalBurn_r15(p,delta0);
  }

  // function updateAllowanceTotalOnInsertIncreaseAllowance_r33(address o,address s,uint n) private    {
  //     int delta0 = int(n);
  //     //updateAllowanceOnIncrementAllowanceTotal_r26(o,s,delta0);
  //     int _delta = int(delta0);
  //     uint newValue = updateuintByint(allowance[o][s],_delta);
  //     allowance[o][s] = newValue;
  // }

  function updateWithdrawEtherOnInsertRecv_withdrawEther_r23(uint n) private   returns (bool) {
      address p = owner.p;
      if(p==msg.sender) {
        updateSendOnInsertWithdrawEther_r3(p,n);
        emit WithdrawEther(p,n);
        return true;
      }
      return false;
  }
  function updateTotalBalancesOnInsertConstructor_r25(uint n) private    {
      totalBalances = TotalBalancesTuple(n,true);
  }
}
