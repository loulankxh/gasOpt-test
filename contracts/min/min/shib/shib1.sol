contract Shib {
  struct TotalInTuple {
    uint n;
    bool _valid;
  }
  struct TotalOutTuple {
    uint n;
    bool _valid;
  }
  struct OwnerTuple {
    address p;
    bool _valid;
  }
  struct DecreaseAllowanceTotalTuple {
    uint m;
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
  struct SpentTotalTuple {
    uint m;
    bool _valid;
  }
  struct TotalBurnTuple {
    uint n;
    bool _valid;
  }
  struct TotalBalancesTuple {
    uint m;
    bool _valid;
  }
  struct IncreaseAllowanceTotalTuple {
    uint m;
    bool _valid;
  }
  mapping(address=>TotalInTuple) totalIn;
  mapping(address=>TotalOutTuple) totalOut;
  mapping(address=>TotalBurnTuple) totalBurn;
  OwnerTuple owner;
  mapping(address=>mapping(address=>DecreaseAllowanceTotalTuple)) decreaseAllowanceTotal;
  mapping(address=>TotalMintTuple) totalMint;
  TotalSupplyTuple totalSupply;
  TotalBalancesTuple totalBalances;
  mapping(address=>mapping(address=>SpentTotalTuple)) spentTotal;
  mapping(address=>mapping(address=>IncreaseAllowanceTotalTuple)) increaseAllowanceTotal;
  event Burn(address p,uint amount);
  event Mint(address p,uint amount);
  event DecreaseAllowance(address p,address s,uint n);
  event IncreaseAllowance(address p,address s,uint n);
  event Transfer(address from,address to,uint amount);
  constructor(uint name,uint symbol,uint decimals,uint totalSupply,address feeReceiver,address tokenOwnerAddress) public {
    updateBalanceOfOnInsertConstructor_r0(totalSupply,tokenOwnerAddress);
    updateSendOnInsertConstructor_r2(feeReceiver);
    updateTotalBalancesOnInsertConstructor_r29(totalSupply);
    updateOwnerOnInsertConstructor_r14();
    updateTotalMintOnInsertConstructor_r24(totalSupply,tokenOwnerAddress);
    updateTotalSupplyOnInsertConstructor_r4(totalSupply);
  }
  function transferFrom(address from,address to,uint amount) public    {
      bool r27 = updateTransferFromOnInsertRecv_transferFrom_r27(from,to,amount);
      if(r27==false) {
        revert("Rule condition failed");
      }
  }
  function increaseAllowance(address s,uint n) public    {
      bool r10 = updateIncreaseAllowanceOnInsertRecv_increaseAllowance_r10(s,n);
      if(r10==false) {
        revert("Rule condition failed");
      }
  }
  function transfer(address to,uint amount) public    {
      bool r19 = updateTransferOnInsertRecv_transfer_r19(to,amount);
      if(r19==false) {
        revert("Rule condition failed");
      }
  }
  function getTotalSupply() public view  returns (uint) {
      uint n = totalSupply.n;
      return n;
  }
  function decreaseAllowance(address s,uint n) public    {
      bool r25 = updateDecreaseAllowanceOnInsertRecv_decreaseAllowance_r25(s,n);
      if(r25==false) {
        revert("Rule condition failed");
      }
  }
  function burn(uint amount) public    {
      bool r5 = updateBurnOnInsertRecv_burn_r5(amount);
      if(r5==false) {
        revert("Rule condition failed");
      }
  }
  function getAllowance(address p,address s) public view  returns (uint) {
      uint n = allowance(p,s);
      return n;
  }
  function getBalanceOf(address p) public view  returns (uint) {
      uint n = balanceOf(p);
      return n;
  }
  function approve(address s,uint n) public    {
      bool r12 = updateDecreaseAllowanceOnInsertRecv_approve_r12(s,n);
      bool r17 = updateIncreaseAllowanceOnInsertRecv_approve_r17(s,n);
      if(r12==false && r17==false) {
        revert("Rule condition failed");
      }
  }
  function updateIncreaseAllowanceOnInsertRecv_approve_r17(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance(o,s);
      if(n>=m) {
        uint d = n-m;
        updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r30(o,s,d);
        emit IncreaseAllowance(o,s,d);
        return true;
      }
      return false;
  }
  function updateBalanceOfOnInsertConstructor_r0(uint n,address p) private    {
      // Empty()
  }
  function updateTotalSupplyOnIncrementAllBurn_r16(int b) private    {
      int _delta = int(-b);
      uint newValue = updateuintByint(totalSupply.n,_delta);
      totalSupply.n = newValue;
  }
  function updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r30(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementIncreaseAllowanceTotal_r1(o,s,delta0);
      increaseAllowanceTotal[o][s].m += n;
  }
  function updateBalanceOfOnIncrementTotalOut_r23(address p,int o) private    {
      // Empty()
  }
  function balanceOf(address p) private view  returns (uint) {
      uint i = totalIn[p].n;
      uint o = totalOut[p].n;
      uint m = totalBurn[p].n;
      uint n = totalMint[p].n;
      uint s = ((n+i)-m)-o;
      return s;
  }
  function updateuintByint(uint x,int delta) private   returns (uint) {
      int convertedX = int(x);
      int value = convertedX+delta;
      uint convertedValue = uint(value);
      return convertedValue;
  }
  function updateTotalInOnInsertTransfer_r31(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalIn_r23(p,delta0);
      totalIn[p].n += n;
  }
  function allowance(address o,address s) private view  returns (uint) {
      uint l = spentTotal[o][s].m;
      uint d = decreaseAllowanceTotal[o][s].m;
      uint m = increaseAllowanceTotal[o][s].m;
      uint n = (m-l)-d;
      return n;
  }
  function updateTotalMintOnInsertConstructor_r24(uint n,address p) private    {
      totalMint[p] = TotalMintTuple(n,true);
  }
  function updateTransferFromOnInsertRecv_transferFrom_r27(address o,address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint k = allowance(o,s);
      uint m = balanceOf(o);
      if(m>=n && k>=n) {
        updateSpentTotalOnInsertTransferFrom_r8(o,s,n);
        updateTransferOnInsertTransferFrom_r11(o,r,n);
        return true;
      }
      return false;
  }
  function updateIncreaseAllowanceOnInsertRecv_increaseAllowance_r10(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      updateIncreaseAllowanceTotalOnInsertIncreaseAllowance_r30(o,s,n);
      emit IncreaseAllowance(o,s,n);
      return true;
      return false;
  }
  function updateAllowanceOnIncrementSpentTotal_r1(address o,address s,int l) private    {
      // Empty()
  }
  function updateAllBurnOnInsertBurn_r28(uint n) private    {
      int delta0 = int(n);
      updateTotalSupplyOnIncrementAllBurn_r16(delta0);
  }
  function updateDecreaseAllowanceOnInsertRecv_decreaseAllowance_r25(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r7(o,s,n);
      emit DecreaseAllowance(o,s,n);
      return true;
      return false;
  }
  function updateSendOnInsertConstructor_r2(address p) private    {
      uint n = msg.value;
      payable(p).send(n);
  }
  function updateTransferOnInsertRecv_transfer_r19(address r,uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(n<=m) {
        updateTotalInOnInsertTransfer_r31(r,n);
        updateTotalOutOnInsertTransfer_r21(s,n);
        emit Transfer(s,r,n);
        return true;
      }
      return false;
  }
  function updateTotalOutOnInsertTransfer_r21(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalOut_r23(p,delta0);
      totalOut[p].n += n;
  }
  function updateAllowanceOnIncrementDecreaseAllowanceTotal_r1(address o,address s,int d) private    {
      // Empty()
  }
  function updateSpentTotalOnInsertTransferFrom_r8(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementSpentTotal_r1(o,s,delta0);
      spentTotal[o][s].m += n;
  }
  function updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r7(address o,address s,uint n) private    {
      int delta0 = int(n);
      updateAllowanceOnIncrementDecreaseAllowanceTotal_r1(o,s,delta0);
      decreaseAllowanceTotal[o][s].m += n;
  }
  function updateDecreaseAllowanceOnInsertRecv_approve_r12(address s,uint n) private   returns (bool) {
      address o = msg.sender;
      uint m = allowance(o,s);
      if(n<m) {
        uint d = m-n;
        updateDecreaseAllowanceTotalOnInsertDecreaseAllowance_r7(o,s,d);
        emit DecreaseAllowance(o,s,d);
        return true;
      }
      return false;
  }
  function updateAllowanceOnIncrementIncreaseAllowanceTotal_r1(address o,address s,int m) private    {
      // Empty()
  }
  function updateTotalSupplyOnInsertConstructor_r4(uint n) private    {
      totalSupply = TotalSupplyTuple(n,true);
  }
  function updateBurnOnInsertRecv_burn_r5(uint n) private   returns (bool) {
      address s = msg.sender;
      uint m = balanceOf(s);
      if(s!=address(0) && n<=m) {
        updateAllBurnOnInsertBurn_r28(n);
        updateTotalBurnOnInsertBurn_r15(s,n);
        emit Burn(s,n);
        return true;
      }
      return false;
  }
  function updateTransferOnInsertTransferFrom_r11(address o,address r,uint n) private    {
      updateTotalInOnInsertTransfer_r31(r,n);
      updateTotalOutOnInsertTransfer_r21(o,n);
      emit Transfer(o,r,n);
  }
  function updateOwnerOnInsertConstructor_r14() private    {
      address s = msg.sender;
      owner = OwnerTuple(s,true);
  }
  function updateBalanceOfOnIncrementTotalBurn_r23(address p,int m) private    {
      // Empty()
  }
  function updateTotalBurnOnInsertBurn_r15(address p,uint n) private    {
      int delta0 = int(n);
      updateBalanceOfOnIncrementTotalBurn_r23(p,delta0);
      totalBurn[p].n += n;
  }
  function updateTotalBalancesOnInsertConstructor_r29(uint n) private    {
      totalBalances = TotalBalancesTuple(n,true);
  }
  function updateBalanceOfOnIncrementTotalIn_r23(address p,int i) private    {
      // Empty()
  }
}