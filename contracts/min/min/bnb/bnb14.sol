contract Bnb {
  struct TotalOutTuple {
    uint n;
    bool _valid;
  }
  struct TotalMintTuple {
    uint n;
    bool _valid;
  }
  struct AllMintTuple {
    uint n;
    bool _valid;
  }
  struct AllowanceTuple {
    uint n;
    bool _valid;
  }
  struct TotalInTuple {
    uint n;
    bool _valid;
  }
  struct TotalBurnTuple {
    uint n;
    bool _valid;
  }
  struct OwnerTuple {
    address p;
    bool _valid;
  }
  struct FreezeOfTuple {
    uint n;
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
  struct AllBurnTuple {
    uint n;
    bool _valid;
  }
  mapping(address=>TotalInTuple) totalIn;
  mapping(address=>TotalOutTuple) totalOut;
  mapping(address=>TotalBurnTuple) totalBurn;
  OwnerTuple owner;
  mapping(address=>TotalMintTuple) totalMint;
  AllMintTuple allMint;
  TotalBalancesTuple totalBalances;
  AllBurnTuple allBurn;
  mapping(address=>mapping(address=>AllowanceTuple)) allowance;
  mapping(address=>FreezeOfTuple) freezeOf;
  FreezeSumTuple freezeSum;
  event Burn(address p,uint amount);
  event Mint(address p,uint amount);
  event WithdrawEther(address p,uint amount);
  event IncreaseAllowance(address p,address s,uint n);
  event Unfreeze(address p,uint n);
  event Freeze(address p,uint n);
  event Transfer(address from,address to,uint amount);
  constructor(uint initialSupply) public {
    updateOwnerOnInsertConstructor_r33();
    updateTotalBalancesOnInsertConstructor_r23(initialSupply);
    updateAllMintOnInsertConstructor_r8(initialSupply);
    updateTotalInOnInsertConstructor_r28(initialSupply);
    updateTotalMintOnInsertConstructor_r30(initialSupply);
    updateTotalSupplyOnInsertConstructor_r5(initialSupply);
    updateBalanceOfOnInsertConstructor_r4(initialSupply);
  }
  function freeze(uint n) public    {
      bool r22 = updateFreezeOnInsertRecv_freeze_r22(n);
      if(r22==false) {
        revert("Rule condition failed");
      }
  }
  function getTotalSupply() public view  returns (uint) {
      uint n = totalSupply();
      return n;
  }
  function withdrawEther(uint amount) public    {
      bool r21 = updateWithdrawEtherOnInsertRecv_withdrawEther_r21(amount);
      if(r21==false) {
        revert("Rule condition failed");
      }
  }
  function unfreeze(uint n) public    {
      bool r6 = updateUnfreezeOnInsertRecv_unfreeze_r6(n);
      if(r6==false) {
        revert("Rule condition failed");
      }
  }
  function getBalanceOf(address p) public view  returns (uint) {
      uint n = balanceOf(p);
      return n;
  }
  function transfer(address to,uint amount) public    {
      bool r7 = updateTransferOnInsertRecv_transfer_r7(to,amount);
      if(r7==false) {
        revert("Rule condition failed");
      }
  }
  function getAllowance(address p,address s) public view  returns (uint) {
      uint n = allowance[p][s].n;
      return n;
  }
  function approve(address s,uint n) public    {
      bool r27 = updateIncreaseAllowanceOnInsertRecv_approve_r27(s,n);
      if(r27==false) {
        revert("Rule condition failed");
      }
  }
  function burn(uint amount) public    {
      bool r14 = updateBurnOnInsertRecv_burn_r14(amount);
      if(r14==false) {
        revert("Rule condition failed");
      }
  }
  function transferFrom(address from,address to,uint amount) public    {
      bool r32 = updateTransferFromOnInsertRecv_transferFrom_r32(from,to,amount);
      if(r32==false) {
        revert("Rule condition failed");
      }
  }
  function totalSupply() private view  returns (uint) {
      uint b = allBurn.n;
      uint m = allMint.n;
      uint n = m-b;
      return n;
  }
  function updateIncreaseAllowanceOnInsertRecv_approve_r27(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance[o][s].n;
      uint d = n-m;
      updateAllowanceTotalOnInsertIncreaseAllowance_r31(o,s,d);
      emit IncreaseAllowance(o,s,d);
      return true;
      return false;
  }
  function updateFreezeOfOnIncrementTotalFreeze_r11(address p,int f) private    {
      int delta0 = int(f);
      updateBalanceOfOnIncrementFreezeOf_r13(p,delta0);
      int _delta = int(f);
      uint newValue = updateuintByint(freezeOf[p].n,_delta);
      freezeOf[p].n = newValue;
  }
  function updateBalanceOfOnIncrementTotalBurn_r13(address p,int m) private    {
      // Empty()
  }
  function updateAllowanceTotalOnInsertIncreaseAllowance_r31(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementAllowanceTotal_r24(o,s,delta0);
  }
  function updateTotalOutOnInsertTransfer_r18(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalOut_r13(p,delta0);
      totalOut[p].n += n;
  }
  function updateAllMintOnInsertConstructor_r8(uint n) private    {
      allMint = AllMintTuple(n,true);
  }
  function updateTotalSupplyOnIncrementAllBurn_r17(int b) private    {
      // Empty()
  }
  function updateTotalFreezeOnInsertFreeze_r0(address p,uint n) private    {
      int delta0 = int(n);
      updateFreezeOfOnIncrementTotalFreeze_r11(p,delta0);
  }
  function updateSendOnInsertWithdrawEther_r3(address p,uint n) private    {
      payable(p).send(n);
  }
  function updateTotalInOnInsertTransfer_r29(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalIn_r13(p,delta0);
      totalIn[p].n += n;
  }
  function updateTotalInOnInsertConstructor_r28(uint n) private    {
      address s = msg.sender;
      totalIn[s] = TotalInTuple(n,true);
  }
  function updateTotalBalancesOnInsertConstructor_r23(uint n) private    {
      totalBalances = TotalBalancesTuple(n,true);
  }
  function updateWithdrawEtherOnInsertRecv_withdrawEther_r21(uint n) private   returns (bool) {
      address p = owner.p;
      if(p==msg.sender) {
        updateSendOnInsertWithdrawEther_r3(p,n);
        emit WithdrawEther(p,n);
        return true;
      }
      return false;
  }
  function updateTransferFromOnInsertRecv_transferFrom_r32(address o,address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint k = allowance[o][s].n;
      uint q = balanceOf(r);
      uint m = balanceOf(o);
      if(m>=n && k>=n && r!=address(0) && n+q>=q) {
        updateSpentTotalOnInsertTransferFrom_r20(o,s,n);
        updateTransferOnInsertTransferFrom_r1(o,r,n);
        return true;
      }
      return false;
  }
  function updateAllBurnOnInsertBurn_r26(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllBurn_r17(delta0);
      allBurn.n += n;
  }
  function updateSpentTotalOnInsertTransferFrom_r20(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementSpentTotal_r24(o,s,delta0);
  }
  function updateTransferOnInsertTransferFrom_r1(address o,address r,uint n) private    {
      updateTotalOutOnInsertTransfer_r18(o,n);
      updateTotalInOnInsertTransfer_r29(r,n);
      emit Transfer(o,r,n);
  }
  function updateAllowanceOnIncrementAllowanceTotal_r24(address o,address s,int m) private    {
      int _delta = int(m);
      uint newValue = updateuintByint(allowance[o][s].n,_delta);
      allowance[o][s].n = newValue;
  }
  function updateFreezeOnInsertRecv_freeze_r22(uint n) private   returns (bool) {
      address p = msg.sender;
      uint m = balanceOf(p);
      if(n<=m && n>0) {
        updateTotalFreezeOnInsertFreeze_r0(p,n);
        emit Freeze(p,n);
        return true;
      }
      return false;
  }
  function updateTotalMintOnInsertConstructor_r30(uint n) private    {
      address s = msg.sender;
      totalMint[s] = TotalMintTuple(n,true);
  }
  function updateTotalSupplyOnInsertConstructor_r5(uint n) private    {
      // Empty()
  }
  function updateTransferOnInsertRecv_transfer_r7(address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(n<=m && n>0 && r!=address(0) && n+m>=m) {
        updateTotalOutOnInsertTransfer_r18(s,n);
        updateTotalInOnInsertTransfer_r29(r,n);
        emit Transfer(s,r,n);
        return true;
      }
      return false;
  }
  function updateuintByint(uint x,int delta) private   returns (uint) {
      int convertedX = int(x);
      int value = convertedX+delta;
      uint convertedValue = uint(value);
      return convertedValue;
  }
  function updateBalanceOfOnIncrementTotalOut_r13(address p,int o) private    {
      // Empty()
  }
  function updateBurnOnInsertRecv_burn_r14(uint n) private   returns (bool) {
      address p = msg.sender;
      uint m = balanceOf(p);
      if(p!=address(0) && n<=m) {
        updateTotalBurnOnInsertBurn_r15(p,n);
        updateAllBurnOnInsertBurn_r26(n);
        emit Burn(p,n);
        return true;
      }
      return false;
  }
  function updateTotalBurnOnInsertBurn_r15(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalBurn_r13(p,delta0);
      totalBurn[p].n += n;
  }
  function updateUnfreezeOnInsertRecv_unfreeze_r6(uint n) private   returns (bool) {
      address p = msg.sender;
      uint m = freezeOf[p].n;
      if(n<=m && n>0) {
        updateTotalUnfreezeOnInsertUnfreeze_r12(p,n);
        emit Unfreeze(p,n);
        return true;
      }
      return false;
  }
  function updateOwnerOnInsertConstructor_r33() private    {
      address s = msg.sender;
      owner = OwnerTuple(s,true);
  }
  function updateFreezeOfOnIncrementTotalUnfreeze_r11(address p,int u) private    {
      int delta0 = int(-u);
      updateBalanceOfOnIncrementFreezeOf_r13(p,delta0);
      int _delta = int(-u);
      uint newValue = updateuintByint(freezeOf[p].n,_delta);
      freezeOf[p].n = newValue;
  }
  function updateAllowanceOnIncrementSpentTotal_r24(address o,address s,int l) private    {
      int _delta = int(-l);
      uint newValue = updateuintByint(allowance[o][s].n,_delta);
      allowance[o][s].n = newValue;
  }
  function updateBalanceOfOnIncrementTotalIn_r13(address p,int i) private    {
      // Empty()
  }
  function updateTotalUnfreezeOnInsertUnfreeze_r12(address p,uint n) private    {
      int delta0 = int(n);
      updateFreezeOfOnIncrementTotalUnfreeze_r11(p,delta0);
  }
  function updateBalanceOfOnInsertConstructor_r4(uint n) private    {
      address s = msg.sender;
      // Empty()
  }
  function updateBalanceOfOnIncrementFreezeOf_r13(address p,int f) private    {
      // Empty()
  }
  function balanceOf(address p) private view  returns (uint) {
      uint i = totalIn[p].n;
      uint f = freezeOf[p].n;
      uint m = totalBurn[p].n;
      uint o = totalOut[p].n;
      uint n = totalMint[p].n;
      uint s = (((n+i)-m)-o)-f;
      return s;
  }
}