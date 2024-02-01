contract LtcSwapAsset {
  struct TotalInTuple {
    uint n;
    bool _valid;
  }
  struct TotalOutTuple {
    uint n;
    bool _valid;
  }
  struct TotalMintTuple {
    uint n;
    bool _valid;
  }
  struct TotalSupplyTuple {
    uint n;
    bool _valid;
  }
  struct AllowanceTotalTuple {
    uint m;
    bool _valid;
  }
  struct NewOwnerTuple {
    address p;
    bool _valid;
  }
  struct SpentTotalTuple {
    uint m;
    bool _valid;
  }
  struct OldOwnerTuple {
    address p;
    bool _valid;
  }
  struct TotalBurnTuple {
    uint n;
    bool _valid;
  }
  struct EffectiveTimeTuple {
    uint t;
    bool _valid;
  }
  struct TotalBalancesTuple {
    uint m;
    bool _valid;
  }
  mapping(address=>TotalInTuple) totalIn;
  mapping(address=>TotalOutTuple) totalOut;
  mapping(address=>TotalBurnTuple) totalBurn;
  mapping(address=>TotalMintTuple) totalMint;
  EffectiveTimeTuple effectiveTime;
  TotalSupplyTuple totalSupply;
  mapping(address=>mapping(address=>AllowanceTotalTuple)) allowanceTotal;
  TotalBalancesTuple totalBalances;
  NewOwnerTuple newOwner;
  mapping(address=>mapping(address=>SpentTotalTuple)) spentTotal;
  OldOwnerTuple oldOwner;
  event Burn(address p,uint amount);
  event Mint(address p,uint amount);
  event SwapOwner(address p,address q,uint t);
  event IncreaseAllowance(address p,address s,uint n);
  event Transfer(address from,address to,uint amount);
  constructor() public {
    updateTotalSupplyOnInsertConstructor_r13();
    updateNewOwnerOnInsertConstructor_r9();
    updateTotalBalancesOnInsertConstructor_r28();
    updateEffectiveTimeOnInsertConstructor_r1();
  }
  function approve(address s,uint n) public    {
      bool r26 = updateIncreaseAllowanceOnInsertRecv_approve_r26(s,n);
      if(r26==false) {
        revert("Rule condition failed");
      }
  }
  function swapOwner(address p,address q,uint d) public    {
      bool r22 = updateSwapOwnerOnInsertRecv_swapOwner_r22(p,q,d);
      if(r22==false) {
        revert("Rule condition failed");
      }
  }
  function getTotalSupply() public view  returns (uint) {
      uint n = totalSupply.n;
      return n;
  }
  function mint(address p,uint amount) public    {
      bool r21 = updateMintOnInsertRecv_mint_r21(p,amount);
      if(r21==false) {
        revert("Rule condition failed");
      }
  }
  function transfer(address to,uint amount) public    {
      bool r17 = updateTransferOnInsertRecv_transfer_r17(to,amount);
      if(r17==false) {
        revert("Rule condition failed");
      }
  }
  function transferFrom(address from,address to,uint amount) public    {
      bool r23 = updateTransferFromOnInsertRecv_transferFrom_r23(from,to,amount);
      if(r23==false) {
        revert("Rule condition failed");
      }
  }
  function burn(address p,uint amount) public    {
      bool r6 = updateBurnOnInsertRecv_burn_r6(p,amount);
      if(r6==false) {
        revert("Rule condition failed");
      }
  }
  function getBalanceOf(address p) public view  returns (uint) {
      uint n = balanceOf(p);
      return n;
  }
  function getAllowance(address p,address s) public view  returns (uint) {
      uint n = allowance(p,s);
      return n;
  }
  function updateNewOwnerOnInsertSwapOwner_r25(address q) private    {
      updateOwnerOnInsertNewOwner_r4(q);
      newOwner = NewOwnerTuple(q,true);
  }
  function updateTotalBalancesOnInsertConstructor_r28() private    {
      totalBalances = TotalBalancesTuple(0,true);
  }
  function updateTotalBurnOnInsertBurn_r14(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalBurn_r7(p,delta0);
      totalBurn[p].n += n;
  }
  function updateBalanceOfOnIncrementTotalBurn_r7(address p,int m) private    {
      // Empty()
  }
  function updateAllowanceTotalOnInsertIncreaseAllowance_r27(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementAllowanceTotal_r20(o,s,delta0);
      allowanceTotal[o][s].m += n;
  }
  function updateSwapOwnerOnInsertRecv_swapOwner_r22(address p,address q,uint d) private   returns (bool) {
      address s = msg.sender;
      uint t0 = block.timestamp;
      if(owner(s)) {
        uint t = t0+d;
        updateEffectiveTimeOnInsertSwapOwner_r2(t);
        updateOldOwnerOnInsertSwapOwner_r12(p);
        updateNewOwnerOnInsertSwapOwner_r25(q);
        emit SwapOwner(p,q,t);
        return true;
      }
      return false;
  }
  function updateOwnerOnInsertOldOwner_r8(address p) private    {
      uint t2 = effectiveTime.t;
      uint t = block.timestamp;
      if(t<t2) {
        // Empty()
      }
  }
  function updateEffectiveTimeOnInsertConstructor_r1() private    {
      uint t = block.timestamp;
      updateOwnerOnInsertEffectiveTime_r4(t);
      updateOwnerOnInsertEffectiveTime_r8(t);
      effectiveTime = EffectiveTimeTuple(t,true);
  }
  function updateIncreaseAllowanceOnInsertRecv_approve_r26(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance(o,s);
      uint d = n-m;
      updateAllowanceTotalOnInsertIncreaseAllowance_r27(o,s,d);
      emit IncreaseAllowance(o,s,d);
      return true;
      return false;
  }
  function updateSpentTotalOnInsertTransferFrom_r10(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementSpentTotal_r20(o,s,delta0);
      spentTotal[o][s].m += n;
  }
  function updateTransferOnInsertTransferFrom_r0(address o,address r,uint n) private    {
      updateTotalOutOnInsertTransfer_r18(o,n);
      updateTotalInOnInsertTransfer_r11(r,n);
      emit Transfer(o,r,n);
  }
  function updateBurnOnInsertRecv_burn_r6(address p,uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(p);
      if(p!=address(0) && n<=m && owner(s)) {
        updateTotalBurnOnInsertBurn_r14(p,n);
        updateAllBurnOnInsertBurn_r24(n);
        emit Burn(p,n);
        return true;
      }
      return false;
  }
  function updateTotalSupplyOnIncrementAllBurn_r16(int b) private    {
      int _delta = int(-b);
      uint newValue = updateuintByint(totalSupply.n,_delta);
      totalSupply.n = newValue;
  }
  function updateMintOnInsertRecv_mint_r21(address p,uint n) private   returns (bool) {
      address s = msg.sender;
      if(p!=address(0) && owner(s)) {
        updateAllMintOnInsertMint_r3(n);
        updateTotalMintOnInsertMint_r15(p,n);
        emit Mint(p,n);
        return true;
      }
      return false;
  }
  function updateAllBurnOnInsertBurn_r24(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllBurn_r16(delta0);
  }
  function updateTransferFromOnInsertRecv_transferFrom_r23(address o,address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint k = allowance(o,s);
      uint m = balanceOf(o);
      if(m>=n && k>=n) {
        updateTransferOnInsertTransferFrom_r0(o,r,n);
        updateSpentTotalOnInsertTransferFrom_r10(o,s,n);
        return true;
      }
      return false;
  }
  function updateOwnerOnInsertNewOwner_r4(address p) private    {
      uint t2 = effectiveTime.t;
      uint t = block.timestamp;
      if(t>=t2) {
        // Empty()
      }
  }
  function updateTransferOnInsertRecv_transfer_r17(address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(n<=m) {
        updateTotalInOnInsertTransfer_r11(r,n);
        updateTotalOutOnInsertTransfer_r18(s,n);
        emit Transfer(s,r,n);
        return true;
      }
      return false;
  }
  function balanceOf(address p) private view  returns (uint) {
      uint i = totalIn[p].n;
      uint o = totalOut[p].n;
      uint m = totalBurn[p].n;
      uint n = totalMint[p].n;
      uint s = ((n+i)-m)-o;
      return s;
  }
  function updateBalanceOfOnIncrementTotalIn_r7(address p,int i) private    {
      // Empty()
  }
  function allowance(address o,address s) private view  returns (uint) {
      uint l = spentTotal[o][s].m;
      uint m = allowanceTotal[o][s].m;
      uint n = m-l;
      return n;
  }
  function updateuintByint(uint x,int delta) private   returns (uint) {
      int convertedX = int(x);
      int value = convertedX+delta;
      uint convertedValue = uint(value);
      return convertedValue;
  }
  function updateBalanceOfOnIncrementTotalOut_r7(address p,int o) private    {
      // Empty()
  }
  function updateAllowanceOnIncrementAllowanceTotal_r20(address o,address s,int m) private    {
      // Empty()
  }
  function updateTotalSupplyOnIncrementAllMint_r16(int m) private    {
      int _delta = int(m);
      uint newValue = updateuintByint(totalSupply.n,_delta);
      totalSupply.n = newValue;
  }
  function updateBalanceOfOnIncrementTotalMint_r7(address p,int n) private    {
      // Empty()
  }
  function updateTotalSupplyOnInsertConstructor_r13() private    {
      totalSupply = TotalSupplyTuple(0,true);
  }
  function updateTotalInOnInsertTransfer_r11(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalIn_r7(p,delta0);
      totalIn[p].n += n;
  }
  function updateTotalMintOnInsertMint_r15(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalMint_r7(p,delta0);
      totalMint[p].n += n;
  }
  function updateOldOwnerOnInsertSwapOwner_r12(address p) private    {
      updateOwnerOnInsertOldOwner_r8(p);
      oldOwner = OldOwnerTuple(p,true);
  }
  function updateEffectiveTimeOnInsertSwapOwner_r2(uint t) private    {
      updateOwnerOnInsertEffectiveTime_r4(t);
      updateOwnerOnInsertEffectiveTime_r8(t);
      effectiveTime = EffectiveTimeTuple(t,true);
  }
  function updateAllMintOnInsertMint_r3(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllMint_r16(delta0);
  }
  function owner(address p) private view  returns (bool) {
      if(p==newOwner.p) {
        uint t2 = effectiveTime.t;
        uint t = block.timestamp;
        if(t>=t2) {
          return true;
        }
      }
      if(p==oldOwner.p) {
        uint t2 = effectiveTime.t;
        uint t = block.timestamp;
        if(t<t2) {
          return true;
        }
      }
      return false;
  }
  function updateTotalOutOnInsertTransfer_r18(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalOut_r7(p,delta0);
      totalOut[p].n += n;
  }
  function updateOwnerOnInsertEffectiveTime_r4(uint t2) private    {
      address p = newOwner.p;
      uint t = block.timestamp;
      if(t>=t2) {
        // Empty()
      }
  }
  function updateNewOwnerOnInsertConstructor_r9() private    {
      address s = msg.sender;
      updateOwnerOnInsertNewOwner_r4(s);
      newOwner = NewOwnerTuple(s,true);
  }
  function updateOwnerOnInsertEffectiveTime_r8(uint t2) private    {
      address p = oldOwner.p;
      uint t = block.timestamp;
      if(t<t2) {
        // Empty()
      }
  }
  function updateAllowanceOnIncrementSpentTotal_r20(address o,address s,int l) private    {
      // Empty()
  }
}