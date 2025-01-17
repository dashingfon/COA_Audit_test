# Report


## Gas Optimizations


| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | Use ERC721A instead ERC721 | 1 |
| [GAS-2](#GAS-2) | Don't use `_msgSender()` if not supporting EIP-2771 | 47 |
| [GAS-3](#GAS-3) | `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings) | 13 |
| [GAS-4](#GAS-4) | Use assembly to check for `address(0)` | 30 |
| [GAS-5](#GAS-5) | Using bools for storage incurs overhead | 14 |
| [GAS-6](#GAS-6) | Cache array length outside of loop | 5 |
| [GAS-7](#GAS-7) | Use calldata instead of memory for function arguments that do not get mutated | 13 |
| [GAS-8](#GAS-8) | For Operations that will not overflow, you could use unchecked | 105 |
| [GAS-9](#GAS-9) | Use Custom Errors instead of Revert Strings to save Gas | 15 |
| [GAS-10](#GAS-10) | Avoid contract existence checks by using low level calls | 2 |
| [GAS-11](#GAS-11) | State variables only set in the constructor should be declared `immutable` | 5 |
| [GAS-12](#GAS-12) | Functions guaranteed to revert when called by normal users can be marked `payable` | 24 |
| [GAS-13](#GAS-13) | `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`) | 15 |
| [GAS-14](#GAS-14) | Using `private` rather than `public` for constants, saves gas | 4 |
| [GAS-15](#GAS-15) | Increments/decrements can be unchecked in for-loops | 5 |
| [GAS-16](#GAS-16) | Use != 0 instead of > 0 for unsigned integer comparison | 12 |
| [GAS-17](#GAS-17) | `internal` functions not called by the contract should be removed | 10 |
### <a name="GAS-1"></a>[GAS-1] Use ERC721A instead ERC721
ERC721A standard, ERC721A is an improvement standard for ERC721 tokens. It was proposed by the Azuki team and used for developing their NFT collection. Compared with ERC721, ERC721A is a more gas-efficient standard to mint a lot of of NFTs simultaneously. It allows developers to mint multiple NFTs at the same gas price. This has been a great improvement due to Ethereum's sky-rocketing gas fee.

    Reference: https://nextrope.com/erc721-vs-erc721a-2/

*Instances (1)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

6: import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

```

### <a name="GAS-2"></a>[GAS-2] Don't use `_msgSender()` if not supporting EIP-2771
Use `msg.sender` if the code does not implement [EIP-2771 trusted forwarder](https://eips.ethereum.org/EIPS/eip-2771) support

*Instances (47)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

42:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

54:         if (!hasRole(SIGNER_ROLE, _msgSender())) {

85:         if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {

185:         if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {

189:         if (!freeParticipant[_msgSender()]) {

195:         _safeMint(_msgSender(), quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

303:         if (_msgSender() != owner && !isApprovedForAll(owner, _msgSender())) {

331:         if (operator == _msgSender()) revert ApproveToCaller();

333:         _operatorApprovals[_msgSender()][operator] = approved;

334:         emit ApprovalForAll(_msgSender(), operator, approved);

513:         bool isApprovedOrOwner = (_msgSender() == prevOwnership.addr ||

514:             isApprovedForAll(prevOwnership.addr, _msgSender()) ||

515:             getApproved(tokenId) == _msgSender());

651:                 _msgSender(),

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

55:         if (!hasRole(SIGNER_ROLE, _msgSender())) {

86:         if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {

184:         if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {

188:         if (!freeParticipant[_msgSender()]) {

194:         _safeMint(_msgSender(), quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

55:         if (!hasRole(SIGNER_ROLE, _msgSender())) {

89:         if(quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())){

189:         if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {

193:         if (!freeParticipant[_msgSender()]) {

199:         _safeMint(_msgSender(), quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

263:         if (_msgSender() != owner && !isApprovedForAll(owner, _msgSender())) {

283:         if (operator == _msgSender()) revert ApproveToCaller();

285:         _operatorApprovals[_msgSender()][operator] = approved;

286:         emit ApprovalForAll(_msgSender(), operator, approved);

438:         bool isApprovedOrOwner = (_msgSender() == prevOwnership.addr ||

439:             isApprovedForAll(prevOwnership.addr, _msgSender()) ||

440:             getApproved(tokenId) == _msgSender());

562:         try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, _data) returns (bytes4 retval) {

```

```solidity
File: contracts/Migrator.sol

59:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

67:         if (!hasRole(SIGNER_ROLE, _msgSender())) {

80:         if (isSenderNftOwner != _msgSender()) {

84:             _msgSender(),

90:         ICollectible(_nft1).transferFrom(_msgSender(), address(this), _tokenId);

160:             _msgSender(),

169:             _msgSender()

188:             _msgSender(),

196:             _msgSender(),

205:             _msgSender(),

236:                 _msgSender(),

249:                 _msgSender(),

262:                 _msgSender(),

```

### <a name="GAS-3"></a>[GAS-3] `a = a + b` is more gas effective than `a += b` for state variables (excluding arrays and mappings)
This saves **16 gas per instance.**

*Instances (13)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

135:         nextBatchId += 1;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

461:             _addressData[to].balance += uint64(quantity);

462:             _addressData[to].numberMinted += uint64(quantity);

531:             _addressData[to].balance += 1;

590:             _addressData[prevOwnership.addr].numberBurned += 1;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

136:         nextBatchId += 1;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

141:         nextBatchId += 1; 

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

393:             _addressData[to].balance += uint64(quantity);

394:             _addressData[to].numberMinted += uint64(quantity);

456:             _addressData[to].balance += 1;

504:             _addressData[prevOwnership.addr].numberBurned += 1;

```

```solidity
File: contracts/Migrator.sol

202:         tokensMigrated[_token1] += _amount;

203:         tokensMigrated[_token2] += tokenBToRecieve;

```

### <a name="GAS-4"></a>[GAS-4] Use assembly to check for `address(0)`
*Saves 6 gas per instance*

*Instances (30)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

164:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

172:         if (owner == address(0)) revert MintedQueryForZeroAddress();

180:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

188:         if (owner == address(0)) revert AuxQueryForZeroAddress();

197:         if (owner == address(0)) revert AuxQueryForZeroAddress();

215:                     if (ownership.addr != address(0)) {

225:                         if (ownership.addr != address(0)) {

454:         if (to == address(0)) revert MintToZeroAddress();

519:         if (to == address(0)) revert TransferToZeroAddress();

539:             if (_ownerships[nextTokenId].addr == address(0)) {

600:             if (_ownerships[nextTokenId].addr == address(0)) {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

147:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

155:         if (owner == address(0)) revert MintedQueryForZeroAddress();

163:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

171:         if (owner == address(0)) revert AuxQueryForZeroAddress();

180:         if (owner == address(0)) revert AuxQueryForZeroAddress();

195:                     if (ownership.addr != address(0)) {

206:                         if (ownership.addr != address(0)) {

384:         if (to == address(0)) revert MintToZeroAddress();

444:         if (to == address(0)) revert TransferToZeroAddress();

464:             if (_ownerships[nextTokenId].addr == address(0)) {

514:             if (_ownerships[nextTokenId].addr == address(0)) {

```

```solidity
File: contracts/Migrator.sol

298:         if (_acre != address(0)) {

302:         if (_yard != address(0)) {

306:         if (_plot != address(0)) {

310:         if (_acreV2 != address(0)) {

314:         if (_yardV2 != address(0)) {

318:         if (_plotV2 != address(0)) {

334:         if (_tokenV1 != address(0)) {

338:         if (_tokenV2 != address(0)) {

```

### <a name="GAS-5"></a>[GAS-5] Using bools for storage incurs overhead
Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (14)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

34:     mapping(address => bool) public freeParticipantControllers;

35:     mapping(address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

103:     mapping(address => mapping(address => bool)) private _operatorApprovals;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

35:     mapping(address => bool) public freeParticipantControllers;

36:     mapping(address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

35:     mapping(address => bool) public freeParticipantControllers;

36:     mapping(address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

28:     mapping (address => bool) public freeParticipantControllers;

29:     mapping (address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

95:     mapping(address => mapping(address => bool)) private _operatorApprovals;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

27:     mapping (address => bool) public freeParticipantControllers;

28:     mapping (address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

28:     mapping (address => bool) public freeParticipantControllers;

29:     mapping (address => bool) public freeParticipant;

```

### <a name="GAS-6"></a>[GAS-6] Cache array length outside of loop
If not cached, the solidity compiler will always read the length of the array during each iteration. That is, if it is a storage array, this is an extra sload operation (100 additional extra gas for each iteration except for the first) and if it is a memory array, this is an extra mload operation (3 additional gas for each iteration except for the first).

*Instances (5)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

250:         for (uint i = 0; i < _ids.length; i++) {

559:         for (uint256 i; i < tokenIds.length; ) {

```

```solidity
File: contracts/Migrator.sol

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

```

### <a name="GAS-7"></a>[GAS-7] Use calldata instead of memory for function arguments that do not get mutated
When a function with a `memory` array is called externally, the `abi.decode()` step has to use a for-loop to copy each index of the `calldata` to the `memory` index. Each iteration of this for-loop costs at least 60 gas (i.e. `60 * <mem_array>.length`). Using `calldata` directly bypasses this loop. 

If the array is passed to an `internal` function which passes the array to another internal function where the array is modified and therefore `memory` is used in the `external` call, it's still more gas-efficient to use `calldata` when the `external` function uses modifiers, since the modifiers may prevent the internal functions from being called. Structs have the same overhead as an array of length one. 

 *Saves 60 gas per instance*

*Instances (13)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

63:     function setBaseURI(string memory newUri) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

105:     function ERC721A_Initialize(string memory name_, string memory symbol_)

245:     function multiOwnerOf(uint[] memory _ids , address _owner) external view  returns (bool result) {

367:         uint256[] memory tokenIds

390:         bytes memory _data

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

64:     function setBaseURI(string memory newUri) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

64:     function setBaseURI(string memory newUri) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

325:         bytes memory _data

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

```

```solidity
File: contracts/Migrator.sol

219:         uint[] memory _acre,

220:         uint[] memory _plot,

221:         uint[] memory _yard

```

### <a name="GAS-8"></a>[GAS-8] For Operations that will not overflow, you could use unchecked

*Instances (105)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

5: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

5: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

4: import "./ERC721A.sol";

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

97:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

109:             _currentBatch.price * quantity

135:         nextBatchId += 1;

194:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

6: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";

7: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721ReceiverUpgradeable.sol";

8: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721MetadataUpgradeable.sol";

9: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol";

10: import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

11: import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";

12: import "@openzeppelin/contracts-upgradeable/utils/StringsUpgradeable.sol";

13: import "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";

14: import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

129:             return _currentIndex - _burnCounter - _startTokenId();

140:             return _currentIndex - _startTokenId();

223:                         curr--;

250:         for (uint i = 0; i < _ids.length; i++) {

461:             _addressData[to].balance += uint64(quantity);

462:             _addressData[to].numberMinted += uint64(quantity);

468:             uint256 end = updatedIndex + quantity;

477:                             updatedIndex++,

488:                     emit Transfer(address(0), to, updatedIndex++);

530:             _addressData[from].balance -= 1;

531:             _addressData[to].balance += 1;

538:             uint256 nextTokenId = tokenId + 1;

562:                 i++;

589:             _addressData[prevOwnership.addr].balance -= 1;

590:             _addressData[prevOwnership.addr].numberBurned += 1;

599:             uint256 nextTokenId = tokenId + 1;

616:             _burnCounter++;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

4: import "./ERC721A.sol";

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

98:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

110:             _currentBatch.price * quantity

136:         nextBatchId += 1;

193:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

4: import "./ERC721A.sol";

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

101:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

114:             _currentBatch.price * quantity

141:         nextBatchId += 1; 

198:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

4: import "./ERC721A.sol";

5: import '@openzeppelin/contracts/access/Ownable.sol';

6: import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmR3JYjc8bjvjpuwJhWN38DSKZSLA9ydU67CoddWuo89J8';

53:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

67:             _currentBatch.price * quantity

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

6: import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

7: import '@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol';

8: import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol';

9: import '@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol';

10: import '@openzeppelin/contracts/utils/Address.sol';

11: import '@openzeppelin/contracts/utils/Context.sol';

12: import '@openzeppelin/contracts/utils/Strings.sol';

13: import '@openzeppelin/contracts/utils/introspection/ERC165.sol';

118:             return _currentIndex - _burnCounter - _startTokenId();

129:             return _currentIndex - _startTokenId();

204:                         curr--;

393:             _addressData[to].balance += uint64(quantity);

394:             _addressData[to].numberMinted += uint64(quantity);

400:             uint256 end = updatedIndex + quantity;

405:                     if (!_checkContractOnERC721Received(address(0), to, updatedIndex++, _data)) {

413:                     emit Transfer(address(0), to, updatedIndex++);

455:             _addressData[from].balance -= 1;

456:             _addressData[to].balance += 1;

463:             uint256 nextTokenId = tokenId + 1;

503:             _addressData[prevOwnership.addr].balance -= 1;

504:             _addressData[prevOwnership.addr].numberBurned += 1;

513:             uint256 nextTokenId = tokenId + 1;

529:             _burnCounter++;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

4: import "./ERC721A.sol";

5: import '@openzeppelin/contracts/access/Ownable.sol';

6: import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

33:         return 'https://sidekickfinance.mypinata.cloud/ipfs/QmSG7SsDgMkXRA8ySWxder9tQYRKgXvT1Dmh9sStqM1huG';

48:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

61:             _currentBatch.price * quantity

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

4: import "./ERC721A.sol";

5: import '@openzeppelin/contracts/access/Ownable.sol';

6: import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmVRVjmmK5bDJdpSXAyZ4iqQsR5q7w4tyDPTqhV21UiYTM';

53:         _currentBatch.quantity = (_currentBatch.quantity - quantity);

66:             _currentBatch.price * quantity

```

```solidity
File: contracts/Migrator.sol

4: import "./dependencies/access/AccessControlUpgradeable.sol";

5: import "./dependencies/proxy/utils/Initializable.sol";

6: import "./dependencies/utils/math/SafeMathUpgradeable.sol";

7: import "./dependencies/token/ERC20/IERC20Upgradeable.sol";

8: import "./interfaces/IERC721Receiver.sol";

9: import "./interfaces/ICollectible.sol";

112:         for (uint index = lastId; index < totalSupply; index++) {

114:                 quantityMinted = quantityMinted + 1;

128:                 counter++;

202:         tokensMigrated[_token1] += _amount;

203:         tokensMigrated[_token2] += tokenBToRecieve;

223:         uint migrateable = _acre.length + _plot.length + _yard.length;

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

```

### <a name="GAS-9"></a>[GAS-9] Use Custom Errors instead of Revert Strings to save Gas
Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

Additionally, custom errors can be used inside and outside of contracts (including interfaces and libraries).

Source: <https://blog.soliditylang.org/2021/04/21/custom-errors/>:

> Starting from [Solidity v0.8.4](https://github.com/ethereum/solidity/releases/tag/v0.8.4), there is a convenient and gas-efficient way to explain to users why an operation failed through the use of custom errors. Until now, you could already use strings to give more information about failures (e.g., `revert("Insufficient funds.");`), but they are rather expensive, especially when it comes to deploy cost, and it is difficult to use dynamic information in them.

Consider replacing **all revert strings** with custom errors in the solution, and particularly those that have multiple occurrences:

*Instances (15)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

42:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

43:         require(_currentBatch.active, "Current Batch is not active");

44:         require(quantity > 0, "Quantity must be greater than zero");

45:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

49:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

37:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

38:         require(_currentBatch.active, "Current Batch is not active");

39:         require(quantity > 0, "Quantity must be greater than zero");

40:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

44:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

42:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

43:         require(_currentBatch.active, "Current Batch is not active");

44:         require(quantity > 0, "Quantity must be greater than zero");

45:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

49:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

### <a name="GAS-10"></a>[GAS-10] Avoid contract existence checks by using low level calls
Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (2)*:
```solidity
File: contracts/Migrator.sol

168:         uint balance = IERC20Upgradeable(Requirements.tokenV1).balanceOf(

178:         balance = IERC20Upgradeable(Requirements.tokenV2).balanceOf(

```

### <a name="GAS-11"></a>[GAS-11] State variables only set in the constructor should be declared `immutable`
Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (5)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

13:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

98:         _name = name_;

99:         _symbol = symbol_;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

13:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

13:         _maxBuyAmount = 10;

```

### <a name="GAS-12"></a>[GAS-12] Functions guaranteed to revert when called by normal users can be marked `payable`
If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (24)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

53:     function _onlySigner() private view {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

54:     function _onlySigner() private view {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

54:     function _onlySigner() private view {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

92:     function setCurrentBatchActive(bool active) public onlyOwner {

96:     function setTxFee(uint256 amount) public onlyOwner {

100:     function setPaymentToken(address token) public onlyOwner {

104:     function setFeeCollector(address collector) public onlyOwner {

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

113:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

86:     function setCurrentBatchActive(bool active) public onlyOwner {

90:     function setTxFee(uint256 amount) public onlyOwner {

94:     function setPaymentToken(address token) public onlyOwner {

98:     function setFeeCollector(address collector) public onlyOwner {

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

107:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

91:     function setCurrentBatchActive(bool active) public onlyOwner {

95:     function setTxFee(uint256 amount) public onlyOwner {

99:     function setPaymentToken(address token) public onlyOwner {

103:     function setFeeCollector(address collector) public onlyOwner {

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

112:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/Migrator.sol

66:     function _onlySigner() private view {

```

### <a name="GAS-13"></a>[GAS-13] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)
Pre-increments and pre-decrements are cheaper.

For a `uint256 i` variable, the following is true with the Optimizer enabled at 10k:

**Increment:**

- `i += 1` is the most expensive form
- `i++` costs 6 gas less than `i += 1`
- `++i` costs 5 gas less than `i++` (11 gas less than `i += 1`)

**Decrement:**

- `i -= 1` is the most expensive form
- `i--` costs 11 gas less than `i -= 1`
- `--i` costs 5 gas less than `i--` (16 gas less than `i -= 1`)

Note that post-increments (or post-decrements) return the old value before incrementing or decrementing, hence the name *post-increment*:

```solidity
uint i = 1;  
uint j = 2;
require(j == i++, "This will be false as i is incremented after the comparison");
```
  
However, pre-increments (or pre-decrements) return the new value:
  
```solidity
uint i = 1;  
uint j = 2;
require(j == ++i, "This will be true as i is incremented before the comparison");
```

In the pre-increment case, the compiler has to create a temporary variable (when used) for returning `1` instead of `2`.

Consider using pre-increments and pre-decrements where they are relevant (meaning: not where post-increments/decrements logic are relevant).

*Saves 5 gas per instance*

*Instances (15)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

223:                         curr--;

250:         for (uint i = 0; i < _ids.length; i++) {

477:                             updatedIndex++,

488:                     emit Transfer(address(0), to, updatedIndex++);

562:                 i++;

616:             _burnCounter++;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

204:                         curr--;

405:                     if (!_checkContractOnERC721Received(address(0), to, updatedIndex++, _data)) {

413:                     emit Transfer(address(0), to, updatedIndex++);

529:             _burnCounter++;

```

```solidity
File: contracts/Migrator.sol

112:         for (uint index = lastId; index < totalSupply; index++) {

128:                 counter++;

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

```

### <a name="GAS-14"></a>[GAS-14] Using `private` rather than `public` for constants, saves gas
If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

37:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

38:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

38:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/Migrator.sol

31:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

### <a name="GAS-15"></a>[GAS-15] Increments/decrements can be unchecked in for-loops
In Solidity 0.8+, there's a default overflow check on unsigned integers. It's possible to uncheck this in for-loops and save some gas at each iteration, but at the cost of some code readability, as this uncheck cannot be made inline.

[ethereum/solidity#10695](https://github.com/ethereum/solidity/issues/10695)

The change would be:

```diff
- for (uint256 i; i < numIterations; i++) {
+ for (uint256 i; i < numIterations;) {
 // ...  
+   unchecked { ++i; }
}  
```

These save around **25 gas saved** per instance.

The same can be applied with decrements (which should use `break` when `i == 0`).

The risk of overflow is non-existent for `uint256`.

*Instances (5)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

250:         for (uint i = 0; i < _ids.length; i++) {

```

```solidity
File: contracts/Migrator.sol

112:         for (uint index = lastId; index < totalSupply; index++) {

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

```

### <a name="GAS-16"></a>[GAS-16] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (12)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

126:         if (_currentBatch.quantity > 0) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

127:         if (_currentBatch.quantity > 0) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

132:         if(_currentBatch.quantity > 0){

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

42:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

44:         require(quantity > 0, "Quantity must be greater than zero");

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

37:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

39:         require(quantity > 0, "Quantity must be greater than zero");

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

42:         require(_currentBatch.quantity > 0, "No more tokens left to mint");

44:         require(quantity > 0, "Quantity must be greater than zero");

```

```solidity
File: contracts/Migrator.sol

228:         if (_acre.length > 0) {

242:         if (_plot.length > 0) {

255:         if (_yard.length > 0) {

```

### <a name="GAS-17"></a>[GAS-17] `internal` functions not called by the contract should be removed
If the functions are required by an interface, the contract should inherit from that interface and use the `override` keyword

*Instances (10)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

136:     function _totalMinted() internal view returns (uint256) {

171:     function _numberMinted(address owner) internal view returns (uint256) {

179:     function _numberBurned(address owner) internal view returns (uint256) {

187:     function _getAux(address owner) internal view returns (uint64) {

196:     function _setAux(address owner, uint64 aux) internal {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

125:     function _totalMinted() internal view returns (uint256) {

154:     function _numberMinted(address owner) internal view returns (uint256) {

162:     function _numberBurned(address owner) internal view returns (uint256) {

170:     function _getAux(address owner) internal view returns (uint64) {

179:     function _setAux(address owner, uint64 aux) internal {

```


## Non Critical Issues


| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 18 |
| [NC-2](#NC-2) | `constant`s should be defined rather than using magic numbers | 6 |
| [NC-3](#NC-3) | Control structures do not follow the Solidity Style Guide | 40 |
| [NC-4](#NC-4) | Dangerous `while(true)` loop | 2 |
| [NC-5](#NC-5) | Consider disabling `renounceOwnership()` | 3 |
| [NC-6](#NC-6) | Event missing indexed field | 6 |
| [NC-7](#NC-7) | Events that mark critical parameter changes should contain both the old and the new value | 9 |
| [NC-8](#NC-8) | Function ordering does not follow the Solidity style guide | 9 |
| [NC-9](#NC-9) | Functions should not be longer than 50 lines | 95 |
| [NC-10](#NC-10) | Change uint to uint256 | 33 |
| [NC-11](#NC-11) | Lack of checks in setters | 41 |
| [NC-12](#NC-12) | `mapping` definitions do not follow the Solidity Style Guide | 6 |
| [NC-13](#NC-13) | Missing Event for critical parameters change | 43 |
| [NC-14](#NC-14) | NatSpec is completely non-existent on functions that should have them | 62 |
| [NC-15](#NC-15) | Incomplete NatSpec: `@param` is missing on actually documented functions | 8 |
| [NC-16](#NC-16) | Incomplete NatSpec: `@return` is missing on actually documented functions | 3 |
| [NC-17](#NC-17) | Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor | 15 |
| [NC-18](#NC-18) | Constant state variables defined more than once | 4 |
| [NC-19](#NC-19) | Consider using named mappings | 19 |
| [NC-20](#NC-20) | Take advantage of Custom Error's return value property | 62 |
| [NC-21](#NC-21) | Deprecated library used for Solidity `>= 0.8` : SafeMath | 2 |
| [NC-22](#NC-22) | Strings should use double quotes rather than single quotes | 10 |
| [NC-23](#NC-23) | Contract does not follow the Solidity style guide's suggested layout ordering | 9 |
| [NC-24](#NC-24) | Internal and private variables and functions names should begin with an underscore | 7 |
| [NC-25](#NC-25) | Event is missing `indexed` fields | 6 |
| [NC-26](#NC-26) | `public` functions not called by the contract should be declared `external` instead | 62 |
| [NC-27](#NC-27) | Variables need not be initialized to zero | 4 |
### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (18)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

44:         _paymentToken = paymentToken;

151:         _paymentToken = token;

156:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

45:         _paymentToken = paymentToken;

152:         _paymentToken = token;

157:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

45:         _paymentToken = paymentToken;

157:         _paymentToken = token;

162:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

10:         _paymentToken = paymentToken;

101:         _paymentToken = token;

105:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

10:         _paymentToken = paymentToken;

95:         _paymentToken = token;

99:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

10:         _paymentToken = paymentToken;

100:         _paymentToken = token;

104:         _feeCollector = collector;

```

### <a name="NC-2"></a>[NC-2] `constant`s should be defined rather than using magic numbers
Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (6)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

47:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

48:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

48:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

13:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

13:         _maxBuyAmount = 10;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

13:         _maxBuyAmount = 10;

```

### <a name="NC-3"></a>[NC-3] Control structures do not follow the Solidity Style Guide
See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (40)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

164:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

172:         if (owner == address(0)) revert MintedQueryForZeroAddress();

180:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

188:         if (owner == address(0)) revert AuxQueryForZeroAddress();

197:         if (owner == address(0)) revert AuxQueryForZeroAddress();

246:         if(_ids.length == 0){

251:             if(_owner != ownerOf(_ids[i])){

281:         if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

301:         if (to == owner) revert ApprovalToCurrentOwner();

319:         if (!_exists(tokenId)) revert ApprovalQueryForNonexistentToken();

331:         if (operator == _msgSender()) revert ApproveToCaller();

393:         if (

454:         if (to == address(0)) revert MintToZeroAddress();

455:         if (quantity == 0) revert MintZeroQuantity();

473:                     if (

485:                 if (_currentIndex != startTokenId) revert();

517:         if (!isApprovedOrOwner) revert TransferCallerNotOwnerNorApproved();

518:         if (prevOwnership.addr != from) revert TransferFromIncorrectOwner();

519:         if (to == address(0)) revert TransferToZeroAddress();

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

79:         if(_currentBatch.quantity <= 0){

82:         if(!_currentBatch.active){

85:         if(quantity <= 0){

89:         if(quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())){

95:             if(!_pay(msg.sender, quantity)){

132:         if(_currentBatch.quantity > 0){

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

147:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

155:         if (owner == address(0)) revert MintedQueryForZeroAddress();

163:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

171:         if (owner == address(0)) revert AuxQueryForZeroAddress();

180:         if (owner == address(0)) revert AuxQueryForZeroAddress();

241:         if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

261:         if (to == owner) revert ApprovalToCurrentOwner();

274:         if (!_exists(tokenId)) revert ApprovalQueryForNonexistentToken();

283:         if (operator == _msgSender()) revert ApproveToCaller();

384:         if (to == address(0)) revert MintToZeroAddress();

385:         if (quantity == 0) revert MintZeroQuantity();

410:                 if (_currentIndex != startTokenId) revert();

442:         if (!isApprovedOrOwner) revert TransferCallerNotOwnerNorApproved();

443:         if (prevOwnership.addr != from) revert TransferFromIncorrectOwner();

444:         if (to == address(0)) revert TransferToZeroAddress();

```

### <a name="NC-4"></a>[NC-4] Dangerous `while(true)` loop
Consider using for-loops to avoid all risks of an infinite-loop situation

*Instances (2)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

222:                     while (true) {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

203:                     while (true) {

```

### <a name="NC-5"></a>[NC-5] Consider disabling `renounceOwnership()`
If the plan for your project does not include eventually giving up all ownership control, consider overwriting OpenZeppelin's `Ownable`'s `renounceOwnership()` function in order to disable it.

*Instances (3)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

8: contract ATLACRE is ERC721A, Ownable {

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

8: contract ATLPLOT is ERC721A, Ownable {

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

8: contract ATLYARD is ERC721A, Ownable {

```

### <a name="NC-6"></a>[NC-6] Event missing indexed field
Index event fields make the field more quickly accessible [to off-chain tools](https://ethereum.stackexchange.com/questions/40396/can-somebody-please-explain-the-concept-of-event-indexing) that parse events. This is especially useful when it comes to filtering based on an address. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Where applicable, each `event` should use three `indexed` fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three applicable fields, all of the applicable fields should be indexed.

*Instances (6)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

39:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

40:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

40:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

31:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

30:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

31:     event NewBatchCreated(uint256 batchStartIndex);

```

### <a name="NC-7"></a>[NC-7] Events that mark critical parameter changes should contain both the old and the new value
This should especially be done if the new value is not required to be different from the old value

*Instances (9)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

120:     function setCurrentBatch(
             uint256 quantity,
             uint256 price,
             bool active
         ) public {
             _onlySigner();
             if (_currentBatch.quantity > 0) {
                 revert CurrentBactchNotFinished();
             }
             _currentBatch.quantity = quantity;
             _currentBatch.active = active;
             _currentBatch.price = price;
             _currentBatch.batch = nextBatchId;
             _currentBatch.startIndex = _currentIndex;
             allBatches[nextBatchId] = _currentBatch;
             nextBatchId += 1;
             emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

327:     function setApprovalForAll(address operator, bool approved)
             public
             override
         {
             if (operator == _msgSender()) revert ApproveToCaller();
     
             _operatorApprovals[_msgSender()][operator] = approved;
             emit ApprovalForAll(_msgSender(), operator, approved);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

121:     function setCurrentBatch(
             uint256 quantity,
             uint256 price,
             bool active
         ) public {
             _onlySigner();
             if (_currentBatch.quantity > 0) {
                 revert CurrentBactchNotFinished();
             }
             _currentBatch.quantity = quantity;
             _currentBatch.active = active;
             _currentBatch.price = price;
             _currentBatch.batch = nextBatchId;
             _currentBatch.startIndex = _currentIndex;
             allBatches[nextBatchId] = _currentBatch;
             nextBatchId += 1;
             emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

125:     function setCurrentBatch(
             uint256 quantity,
             uint256 price,
             bool active
         ) public  {
     
             _onlySigner();
             if(_currentBatch.quantity > 0){
                 revert CurrentBactchNotFinished();
             }
             _currentBatch.quantity = quantity;
             _currentBatch.active = active;
             _currentBatch.price = price;
             _currentBatch.batch = nextBatchId;
             _currentBatch.startIndex = _currentIndex;
             allBatches[nextBatchId] = _currentBatch;
             nextBatchId += 1; 
             emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

78:     function setCurrentBatch(
            uint256 quantity,
            uint256 price,
            bool active
        ) public onlyOwner {
            require(_currentBatch.quantity == 0, 'Current batch not finished.');
    
            _currentBatch.quantity = quantity;
            _currentBatch.active = active;
            _currentBatch.price = price;
    
            emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

282:     function setApprovalForAll(address operator, bool approved) public override {
             if (operator == _msgSender()) revert ApproveToCaller();
     
             _operatorApprovals[_msgSender()][operator] = approved;
             emit ApprovalForAll(_msgSender(), operator, approved);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

72:     function setCurrentBatch(
            uint256 quantity,
            uint256 price,
            bool active
        ) public onlyOwner {
            require(_currentBatch.quantity == 0, 'Current batch not finished.');
    
            _currentBatch.quantity = quantity;
            _currentBatch.active = active;
            _currentBatch.price = price;
    
            emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

77:     function setCurrentBatch(
            uint256 quantity,
            uint256 price,
            bool active
        ) public onlyOwner {
            require(_currentBatch.quantity == 0, 'Current batch not finished.');
    
            _currentBatch.quantity = quantity;
            _currentBatch.active = active;
            _currentBatch.price = price;
    
            emit NewBatchCreated(_currentIndex);

```

```solidity
File: contracts/Migrator.sol

328:     function setTokenInfo(
             address _tokenV1,
             address _tokenV2,
             uint _price
         ) external {
             _onlySigner();
             if (_tokenV1 != address(0)) {
                 Requirements.tokenV1 = _tokenV1;
             }
     
             if (_tokenV2 != address(0)) {
                 Requirements.tokenV2 = _tokenV2;
             }
     
             if (_price == 0) {
                 revert TransactionMessage("Price must be above zero");
             }
             Requirements.price = _price;
     
             emit MigrationTokenSet(_tokenV1, _tokenV2, _price, block.timestamp);

```

### <a name="NC-8"></a>[NC-8] Function ordering does not follow the Solidity style guide
According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*Instances (9)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

1: 
   Current order:
   public initialize
   private _onlySigner
   internal _baseURI
   public setBaseURI
   public supportsInterface
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   
   Suggested order:
   public initialize
   public setBaseURI
   public supportsInterface
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   internal _baseURI
   internal _pay
   internal _tax
   private _onlySigner

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

1: 
   Current order:
   public ERC721A_Initialize
   internal _startTokenId
   public totalSupply
   internal _totalMinted
   public supportsInterface
   public balanceOf
   internal _numberMinted
   internal _numberBurned
   internal _getAux
   internal _setAux
   internal ownershipOf
   public ownerOf
   external multiOwnerOf
   public name
   public symbol
   public tokenURI
   internal _baseURI
   public approve
   public getApproved
   public setApprovalForAll
   public isApprovedForAll
   public transferFrom
   public transferBulkFrom
   public safeTransferFrom
   public safeTransferFrom
   internal _exists
   internal _safeMint
   internal _safeMint
   internal _mint
   private _transfer
   private _bulkTransfer
   internal _burn
   private _approve
   private _checkContractOnERC721Received
   internal _beforeTokenTransfers
   internal _afterTokenTransfers
   
   Suggested order:
   external multiOwnerOf
   public ERC721A_Initialize
   public totalSupply
   public supportsInterface
   public balanceOf
   public ownerOf
   public name
   public symbol
   public tokenURI
   public approve
   public getApproved
   public setApprovalForAll
   public isApprovedForAll
   public transferFrom
   public transferBulkFrom
   public safeTransferFrom
   public safeTransferFrom
   internal _startTokenId
   internal _totalMinted
   internal _numberMinted
   internal _numberBurned
   internal _getAux
   internal _setAux
   internal ownershipOf
   internal _baseURI
   internal _exists
   internal _safeMint
   internal _safeMint
   internal _mint
   internal _burn
   internal _beforeTokenTransfers
   internal _afterTokenTransfers
   private _transfer
   private _bulkTransfer
   private _approve
   private _checkContractOnERC721Received

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

1: 
   Current order:
   public initialize
   private _onlySigner
   internal _baseURI
   public setBaseURI
   public supportsInterface
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   
   Suggested order:
   public initialize
   public setBaseURI
   public supportsInterface
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   internal _baseURI
   internal _pay
   internal _tax
   private _onlySigner

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

1: 
   Current order:
   public initialize
   private _onlySigner
   internal _baseURI
   public setBaseURI
   public supportsInterface
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   
   Suggested order:
   public initialize
   public setBaseURI
   public supportsInterface
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   public mintAsFreeMinter
   internal _baseURI
   internal _pay
   internal _tax
   private _onlySigner

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

1: 
   Current order:
   internal _baseURI
   public setBaseURI
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   
   Suggested order:
   public setBaseURI
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   internal _baseURI
   internal _pay
   internal _tax

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

1: 
   Current order:
   internal _startTokenId
   public totalSupply
   internal _totalMinted
   public supportsInterface
   public balanceOf
   internal _numberMinted
   internal _numberBurned
   internal _getAux
   internal _setAux
   internal ownershipOf
   public ownerOf
   public name
   public symbol
   public tokenURI
   internal _baseURI
   public approve
   public getApproved
   public setApprovalForAll
   public isApprovedForAll
   public transferFrom
   public safeTransferFrom
   public safeTransferFrom
   internal _exists
   internal _safeMint
   internal _safeMint
   internal _mint
   private _transfer
   internal _burn
   private _approve
   private _checkContractOnERC721Received
   internal _beforeTokenTransfers
   internal _afterTokenTransfers
   
   Suggested order:
   public totalSupply
   public supportsInterface
   public balanceOf
   public ownerOf
   public name
   public symbol
   public tokenURI
   public approve
   public getApproved
   public setApprovalForAll
   public isApprovedForAll
   public transferFrom
   public safeTransferFrom
   public safeTransferFrom
   internal _startTokenId
   internal _totalMinted
   internal _numberMinted
   internal _numberBurned
   internal _getAux
   internal _setAux
   internal ownershipOf
   internal _baseURI
   internal _exists
   internal _safeMint
   internal _safeMint
   internal _mint
   internal _burn
   internal _beforeTokenTransfers
   internal _afterTokenTransfers
   private _transfer
   private _approve
   private _checkContractOnERC721Received

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

1: 
   Current order:
   internal _baseURI
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   
   Suggested order:
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   internal _baseURI
   internal _pay
   internal _tax

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

1: 
   Current order:
   internal _baseURI
   public setBaseURI
   public mint
   internal _pay
   internal _tax
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   
   Suggested order:
   public setBaseURI
   public mint
   public setCurrentBatch
   public setCurrentBatchActive
   public setTxFee
   public setPaymentToken
   public setFeeCollector
   public setFreeParticipantController
   public setFreeParticipant
   internal _baseURI
   internal _pay
   internal _tax

```

```solidity
File: contracts/Migrator.sol

1: 
   Current order:
   external initialize
   private _onlySigner
   private _withdrawOldNFT
   internal _mintNewNFT
   external migrateERC20Token
   external migrateAllAsset
   external onERC721Received
   external setERC721Requirements
   external setTokenInfo
   
   Suggested order:
   external initialize
   external migrateERC20Token
   external migrateAllAsset
   external onERC721Received
   external setERC721Requirements
   external setTokenInfo
   internal _mintNewNFT
   private _onlySigner
   private _withdrawOldNFT

```

### <a name="NC-9"></a>[NC-9] Functions should not be longer than 50 lines
Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability 

*Instances (95)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

41:     function initialize(address paymentToken) public initializer {

59:     function _baseURI() internal view virtual override returns (string memory) {

63:     function setBaseURI(string memory newUri) public {

114:     function _tax(address payee) internal virtual returns (bool) {

139:     function setCurrentBatchActive(bool active) public {

154:     function setFeeCollector(address collector) public {

167:     function setFreeParticipant(address participant, bool free) public {

172:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

105:     function ERC721A_Initialize(string memory name_, string memory symbol_)

117:     function _startTokenId() internal view virtual returns (uint256) {

125:     function totalSupply() public view returns (uint256) {

136:     function _totalMinted() internal view returns (uint256) {

163:     function balanceOf(address owner) public view override returns (uint256) {

171:     function _numberMinted(address owner) internal view returns (uint256) {

179:     function _numberBurned(address owner) internal view returns (uint256) {

187:     function _getAux(address owner) internal view returns (uint64) {

196:     function _setAux(address owner, uint64 aux) internal {

238:     function ownerOf(uint256 tokenId) public view override returns (address) {

245:     function multiOwnerOf(uint[] memory _ids , address _owner) external view  returns (bool result) {

260:     function name() public view virtual override returns (string memory) {

267:     function symbol() public view virtual override returns (string memory) {

292:     function _baseURI() internal view virtual returns (string memory) {

299:     function approve(address to, uint256 tokenId) public override {

327:     function setApprovalForAll(address operator, bool approved)

340:     function isApprovedForAll(address owner, address operator)

408:     function _exists(uint256 tokenId) internal view returns (bool) {

415:     function _safeMint(address to, uint256 quantity) internal {

577:     function _burn(uint256 tokenId) internal virtual {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

42:     function initialize(address paymentToken) public initializer {

60:     function _baseURI() internal view virtual override returns (string memory) {

64:     function setBaseURI(string memory newUri) public {

115:     function _tax(address payee) internal virtual returns (bool) {

140:     function setCurrentBatchActive(bool active) public {

155:     function setFeeCollector(address collector) public {

168:     function setFreeParticipant(address participant, bool free) public {

173:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

42:     function initialize(address paymentToken) public initializer {

60:     function _baseURI() internal view virtual override returns (string memory) {

64:     function setBaseURI(string memory newUri) public {

119:     function _tax(address payee) internal virtual returns (bool) {

145:     function setCurrentBatchActive(bool active) public {

160:     function setFeeCollector(address collector) public {

173:     function setFreeParticipant(address participant, bool free) public {

178:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

33:     function _baseURI() internal view virtual override returns (string memory) { 

37:     function setBaseURI (string memory newUri) public onlyOwner {

72:     function _tax(address payee) internal virtual returns (bool) {

92:     function setCurrentBatchActive(bool active) public onlyOwner {

96:     function setTxFee(uint256 amount) public onlyOwner {

100:     function setPaymentToken(address token) public onlyOwner {

104:     function setFeeCollector(address collector) public onlyOwner {

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

113:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

106:     function _startTokenId() internal view virtual returns (uint256) {

114:     function totalSupply() public view returns (uint256) {

125:     function _totalMinted() internal view returns (uint256) {

136:     function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {

146:     function balanceOf(address owner) public view override returns (uint256) {

154:     function _numberMinted(address owner) internal view returns (uint256) {

162:     function _numberBurned(address owner) internal view returns (uint256) {

170:     function _getAux(address owner) internal view returns (uint64) {

179:     function _setAux(address owner, uint64 aux) internal {

188:     function ownershipOf(uint256 tokenId) internal view returns (TokenOwnership memory) {

219:     function ownerOf(uint256 tokenId) public view override returns (address) {

226:     function name() public view virtual override returns (string memory) {

233:     function symbol() public view virtual override returns (string memory) {

240:     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {

252:     function _baseURI() internal view virtual returns (string memory) {

259:     function approve(address to, uint256 tokenId) public override {

273:     function getApproved(uint256 tokenId) public view override returns (address) {

282:     function setApprovalForAll(address operator, bool approved) public override {

292:     function isApprovedForAll(address owner, address operator) public view virtual override returns (bool) {

340:     function _exists(uint256 tokenId) internal view returns (bool) {

345:     function _safeMint(address to, uint256 quantity) internal {

491:     function _burn(uint256 tokenId) internal virtual {

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

32:     function _baseURI() internal view virtual override returns (string memory) { 

66:     function _tax(address payee) internal virtual returns (bool) {

86:     function setCurrentBatchActive(bool active) public onlyOwner {

90:     function setTxFee(uint256 amount) public onlyOwner {

94:     function setPaymentToken(address token) public onlyOwner {

98:     function setFeeCollector(address collector) public onlyOwner {

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

107:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

33:     function _baseURI() internal view virtual override returns (string memory) { 

37:     function setBaseURI (string memory newUri) public onlyOwner {

71:     function _tax(address payee) internal virtual returns (bool) {

91:     function setCurrentBatchActive(bool active) public onlyOwner {

95:     function setTxFee(uint256 amount) public onlyOwner {

99:     function setPaymentToken(address token) public onlyOwner {

103:     function setFeeCollector(address collector) public onlyOwner {

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

112:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/Migrator.sol

58:     function initialize() external virtual initializer {

```

### <a name="NC-10"></a>[NC-10] Change uint to uint256
Throughout the code base, some variables are declared as `uint`. To favor explicitness, consider changing all instances of `uint` to `uint256`

*Instances (33)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

32:     uint public nextBatchId;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

250:         for (uint i = 0; i < _ids.length; i++) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

33:     uint public nextBatchId;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

33:     uint public nextBatchId;

```

```solidity
File: contracts/Migrator.sol

25:         uint price;

32:     uint public totalAcreMigrated;

33:     uint public totalPlotMigrated;

34:     uint public totalYardMigrated;

39:         uint amount1,

40:         uint amount2,

41:         uint date

47:         uint oldId,

48:         uint newId,

49:         uint date

54:         uint indexed price,

55:         uint date

102:         uint _quantity,

107:         uint totalSupply = nftObj.totalSupply();

108:         uint quantityMinted;

109:         uint lastId = lastAssetIdMinted[_nft2];

110:         uint newLastMintedID;

111:         uint counter;

112:         for (uint index = lastId; index < totalSupply; index++) {

159:         uint allowance = IERC20Upgradeable(_token1).allowance(

168:         uint balance = IERC20Upgradeable(Requirements.tokenV1).balanceOf(

176:         uint tokenBToRecieve = Requirements.price.mul(_amount);

223:         uint migrateable = _acre.length + _plot.length + _yard.length;

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

331:         uint _price

```

### <a name="NC-11"></a>[NC-11] Lack of checks in setters
Be it sanity checks (like checks against `0`-values) or initial setting checks: it's best for Setter functions to have them

*Instances (41)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

63:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

139:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

144:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

149:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

154:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

159:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

167:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

64:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

140:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

145:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

150:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

155:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

160:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

168:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

64:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

145:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

150:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

155:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

160:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

165:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

173:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {
            baseUri = newUri;

92:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

96:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

100:     function setPaymentToken(address token) public onlyOwner {
             _paymentToken = token;

104:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

113:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

86:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

90:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

94:     function setPaymentToken(address token) public onlyOwner {
            _paymentToken = token;

98:     function setFeeCollector(address collector) public onlyOwner {
            _feeCollector = collector;

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

107:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {
            baseUri = newUri;

91:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

95:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

99:     function setPaymentToken(address token) public onlyOwner {
            _paymentToken = token;

103:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

112:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

### <a name="NC-12"></a>[NC-12] `mapping` definitions do not follow the Solidity Style Guide
See the [mappings](https://docs.soliditylang.org/en/latest/style-guide.html#mappings) section of the Solidity Style Guide

*Instances (6)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

28:     mapping (address => bool) public freeParticipantControllers;

29:     mapping (address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

27:     mapping (address => bool) public freeParticipantControllers;

28:     mapping (address => bool) public freeParticipant;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

28:     mapping (address => bool) public freeParticipantControllers;

29:     mapping (address => bool) public freeParticipant;

```

### <a name="NC-13"></a>[NC-13] Missing Event for critical parameters change
Events help non-contract tools to track changes, and events prevent users from being surprised by changes.

*Instances (43)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

63:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

139:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

144:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

149:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

154:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

159:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

167:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

64:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

140:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

145:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

150:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

155:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

160:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

168:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

64:     function setBaseURI(string memory newUri) public {
            _onlySigner();
            baseUri = newUri;

145:     function setCurrentBatchActive(bool active) public {
             _onlySigner();
             _currentBatch.active = active;

150:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

155:     function setPaymentToken(address token) public {
             _onlySigner();
             _paymentToken = token;

160:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

165:     function setFreeParticipantController(
             address freeParticipantController,
             bool allow
         ) public {
             _onlySigner();
             freeParticipantControllers[freeParticipantController] = allow;

173:     function setFreeParticipant(address participant, bool free) public {
             _onlySigner();
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {
            baseUri = newUri;

92:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

96:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

100:     function setPaymentToken(address token) public onlyOwner {
             _paymentToken = token;

104:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

113:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

86:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

90:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

94:     function setPaymentToken(address token) public onlyOwner {
            _paymentToken = token;

98:     function setFeeCollector(address collector) public onlyOwner {
            _feeCollector = collector;

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

107:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {
            baseUri = newUri;

91:     function setCurrentBatchActive(bool active) public onlyOwner {
            _currentBatch.active = active;

95:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

99:     function setPaymentToken(address token) public onlyOwner {
            _paymentToken = token;

103:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
         {
             freeParticipantControllers[freeParticipantController] = allow;

112:     function setFreeParticipant(address participant, bool free) public onlyOwner
         {
             freeParticipant[participant] = free;

```

```solidity
File: contracts/Migrator.sol

218:     function migrateAllAsset(
             uint[] memory _acre,
             uint[] memory _plot,
             uint[] memory _yard
         ) external returns (bool success) {
             uint migrateable = _acre.length + _plot.length + _yard.length;
             if (migrateable == 0) {
                 revert TransactionMessage("Not enough nft to migrate");
             }
     
             if (_acre.length > 0) {
                 for (uint i = 0; i < _acre.length; i++) {
                     _withdrawOldNFT(Requirements.acre, _acre[i]);
                 }
                 // @audit if the tokens do not belong to the contract the nft will be stuck in the contract?
                 _mintNewNFT(
                     Requirements.acre,
                     Requirements.acreV2,
                     _msgSender(),
                     _acre.length,
                     _acre
                 );
             }
     
             if (_plot.length > 0) {
                 for (uint i = 0; i < _plot.length; i++) {
                     _withdrawOldNFT(Requirements.plot, _plot[i]);
                 }
                 _mintNewNFT(
                     Requirements.plot,
                     Requirements.plotV2,
                     _msgSender(),
                     _plot.length,
                     _plot
                 );
             }
     
             if (_yard.length > 0) {
                 for (uint i = 0; i < _yard.length; i++) {
                     _withdrawOldNFT(Requirements.yard, _yard[i]);
                 }
                 _mintNewNFT(
                     Requirements.yard,
                     Requirements.yardV2,
                     _msgSender(),
                     _yard.length,
                     _yard
                 );
             }
     
             success = true;

289:     function setERC721Requirements(
             address _acre,
             address _yard,
             address _plot,
             address _acreV2,
             address _yardV2,
             address _plotV2
         ) external returns (bool success) {
             _onlySigner();
             if (_acre != address(0)) {
                 Requirements.acre = _acre;
             }
     
             if (_yard != address(0)) {
                 Requirements.yard = _yard;
             }
     
             if (_plot != address(0)) {
                 Requirements.plot = _plot;
             }
     
             if (_acreV2 != address(0)) {
                 Requirements.acreV2 = _acreV2;
             }
     
             if (_yardV2 != address(0)) {
                 Requirements.yardV2 = _yardV2;
             }
     
             if (_plotV2 != address(0)) {
                 Requirements.plotV2 = _plotV2;
             }
     
             success = true;

```

### <a name="NC-14"></a>[NC-14] NatSpec is completely non-existent on functions that should have them
Public and external functions that aren't view or pure should have NatSpec comments

*Instances (62)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

10:     function mint(address _to, uint _amount) external {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

41:     function initialize(address paymentToken) public initializer {

63:     function setBaseURI(string memory newUri) public {

74:     function mint(uint256 quantity) public {

120:     function setCurrentBatch(

139:     function setCurrentBatchActive(bool active) public {

144:     function setTxFee(uint256 amount) public {

149:     function setPaymentToken(address token) public {

154:     function setFeeCollector(address collector) public {

159:     function setFreeParticipantController(

167:     function setFreeParticipant(address participant, bool free) public {

172:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

105:     function ERC721A_Initialize(string memory name_, string memory symbol_)

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

42:     function initialize(address paymentToken) public initializer {

64:     function setBaseURI(string memory newUri) public {

75:     function mint(uint256 quantity) public {

121:     function setCurrentBatch(

140:     function setCurrentBatchActive(bool active) public {

145:     function setTxFee(uint256 amount) public {

150:     function setPaymentToken(address token) public {

155:     function setFeeCollector(address collector) public {

160:     function setFreeParticipantController(

168:     function setFreeParticipant(address participant, bool free) public {

173:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

42:     function initialize(address paymentToken) public initializer {

64:     function setBaseURI(string memory newUri) public {

78:     function mint(uint256 quantity) public {

125:     function setCurrentBatch(

145:     function setCurrentBatchActive(bool active) public {

150:     function setTxFee(uint256 amount) public {

155:     function setPaymentToken(address token) public {

160:     function setFeeCollector(address collector) public {

165:     function setFreeParticipantController(

173:     function setFreeParticipant(address participant, bool free) public {

178:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

41:     function mint(uint256 quantity) public {

78:     function setCurrentBatch(

92:     function setCurrentBatchActive(bool active) public onlyOwner {

96:     function setTxFee(uint256 amount) public onlyOwner {

100:     function setPaymentToken(address token) public onlyOwner {

104:     function setFeeCollector(address collector) public onlyOwner {

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

113:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

36:     function mint(uint256 quantity) public {

72:     function setCurrentBatch(

86:     function setCurrentBatchActive(bool active) public onlyOwner {

90:     function setTxFee(uint256 amount) public onlyOwner {

94:     function setPaymentToken(address token) public onlyOwner {

98:     function setFeeCollector(address collector) public onlyOwner {

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

107:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

41:     function mint(uint256 quantity) public {

77:     function setCurrentBatch(

91:     function setCurrentBatchActive(bool active) public onlyOwner {

95:     function setTxFee(uint256 amount) public onlyOwner {

99:     function setPaymentToken(address token) public onlyOwner {

103:     function setFeeCollector(address collector) public onlyOwner {

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

112:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

### <a name="NC-15"></a>[NC-15] Incomplete NatSpec: `@param` is missing on actually documented functions
The following functions are missing `@param` NatSpec comments.

*Instances (8)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

296:     /**
          * @dev See {IERC721-approve}.
          */
         function approve(address to, uint256 tokenId) public override {

324:     /**
          * @dev See {IERC721-setApprovalForAll}.
          */
         function setApprovalForAll(address operator, bool approved)

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

256:     /**
          * @dev See {IERC721-approve}.
          */
         function approve(address to, uint256 tokenId) public override {

279:     /**
          * @dev See {IERC721-setApprovalForAll}.
          */
         function setApprovalForAll(address operator, bool approved) public override {

```

```solidity
File: contracts/Migrator.sol

135:     /**
          * @dev This supports migration of data for  ERC20 Token
          */
         function migrateERC20Token(
             uint256 _amount,
             address _token1,
             address _token2

215:     /**
          * @dev Batch Migration
          */
         function migrateAllAsset(
             uint[] memory _acre,
             uint[] memory _plot,
             uint[] memory _yard

286:     /**
          * @dev set the neccessary requirements
          */
         function setERC721Requirements(
             address _acre,
             address _yard,
             address _plot,
             address _acreV2,
             address _yardV2,
             address _plotV2

325:     /**
          * @dev set the neccessary erc20 requirements
          */
         function setTokenInfo(
             address _tokenV1,
             address _tokenV2,
             uint _price

```

### <a name="NC-16"></a>[NC-16] Incomplete NatSpec: `@return` is missing on actually documented functions
The following functions are missing `@return` NatSpec comments.

*Instances (3)*:
```solidity
File: contracts/Migrator.sol

135:     /**
          * @dev This supports migration of data for  ERC20 Token
          */
         function migrateERC20Token(
             uint256 _amount,
             address _token1,
             address _token2
         ) external returns (bool result) {

215:     /**
          * @dev Batch Migration
          */
         function migrateAllAsset(
             uint[] memory _acre,
             uint[] memory _plot,
             uint[] memory _yard
         ) external returns (bool success) {

286:     /**
          * @dev set the neccessary requirements
          */
         function setERC721Requirements(
             address _acre,
             address _yard,
             address _plot,
             address _acreV2,
             address _yardV2,
             address _plotV2
         ) external returns (bool success) {

```

### <a name="NC-17"></a>[NC-17] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor
If a function is supposed to be access-controlled, a `modifier` should be used instead of a `require/if` statement for more readability.

*Instances (15)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

89:         if (!freeParticipant[msg.sender]) {

91:             if (!_pay(msg.sender, quantity)) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

90:         if (!freeParticipant[msg.sender]) {

92:             if (!_pay(msg.sender, quantity)) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

93:         if (!freeParticipant[msg.sender]) {

95:             if(!_pay(msg.sender, quantity)){

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

45:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

47:         if (!freeParticipant[msg.sender]) {

49:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

40:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

42:         if (!freeParticipant[msg.sender]) {

44:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

45:         require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

47:         if (!freeParticipant[msg.sender]) {

49:             require(_pay(msg.sender, quantity), "Must pay minting fee");

```

### <a name="NC-18"></a>[NC-18] Constant state variables defined more than once
Rather than redefining state variable constant, consider using a library to store all constants as this will prevent data redundancy

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

37:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

38:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

38:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

```solidity
File: contracts/Migrator.sol

31:     bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

```

### <a name="NC-19"></a>[NC-19] Consider using named mappings
Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/questions/51629/how-to-name-the-arguments-in-mapping/145555#145555) to make it easier to understand the purpose of each mapping

*Instances (19)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

34:     mapping(address => bool) public freeParticipantControllers;

35:     mapping(address => bool) public freeParticipant;

36:     mapping(uint256 => Batch) public allBatches;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

94:     mapping(uint256 => TokenOwnership) internal _ownerships;

97:     mapping(address => AddressData) private _addressData;

100:     mapping(uint256 => address) private _tokenApprovals;

103:     mapping(address => mapping(address => bool)) private _operatorApprovals;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

35:     mapping(address => bool) public freeParticipantControllers;

36:     mapping(address => bool) public freeParticipant;

37:     mapping(uint256 => Batch) public allBatches;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

35:     mapping(address => bool) public freeParticipantControllers;

36:     mapping(address => bool) public freeParticipant;

37:     mapping(uint256 => Batch) public allBatches;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

86:     mapping(uint256 => TokenOwnership) internal _ownerships;

89:     mapping(address => AddressData) private _addressData;

92:     mapping(uint256 => address) private _tokenApprovals;

95:     mapping(address => mapping(address => bool)) private _operatorApprovals;

```

```solidity
File: contracts/Migrator.sol

29:     mapping(address => uint) public lastAssetIdMinted;

30:     mapping(address => uint) public tokensMigrated;

```

### <a name="NC-20"></a>[NC-20] Take advantage of Custom Error's return value property
An important feature of Custom Error is that values such as address, tokenID, msg.value can be written inside the () sign, this kind of approach provides a serious advantage in debugging and examining the revert details of dapps such as tenderly.

*Instances (62)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

55:             revert UnAuthorized();

76:             revert NoMoreTokensLeft();

79:             revert CurrentBatchNotActive();

82:             revert QuantityMustBeAboveZero();

86:             revert MaxBuyAmountLimitReached();

92:                 revert MustPayBeforeMinting();

127:             revert CurrentBactchNotFinished();

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

164:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

172:         if (owner == address(0)) revert MintedQueryForZeroAddress();

180:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

188:         if (owner == address(0)) revert AuxQueryForZeroAddress();

197:         if (owner == address(0)) revert AuxQueryForZeroAddress();

232:         revert OwnerQueryForNonexistentToken();

247:             revert InvalidLength();

281:         if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

301:         if (to == owner) revert ApprovalToCurrentOwner();

304:             revert ApprovalCallerNotOwnerNorApproved();

319:         if (!_exists(tokenId)) revert ApprovalQueryForNonexistentToken();

331:         if (operator == _msgSender()) revert ApproveToCaller();

397:             revert TransferToNonERC721ReceiverImplementer();

454:         if (to == address(0)) revert MintToZeroAddress();

455:         if (quantity == 0) revert MintZeroQuantity();

481:                         revert TransferToNonERC721ReceiverImplementer();

485:                 if (_currentIndex != startTokenId) revert();

517:         if (!isApprovedOrOwner) revert TransferCallerNotOwnerNorApproved();

518:         if (prevOwnership.addr != from) revert TransferFromIncorrectOwner();

519:         if (to == address(0)) revert TransferToZeroAddress();

662:                 revert TransferToNonERC721ReceiverImplementer();

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

56:             revert UnAuthorized();

77:             revert NoMoreTokensLeft();

80:             revert CurrentBatchNotActive();

83:             revert QuantityMustBeAboveZero();

87:             revert MaxBuyAmountLimitReached();

93:                 revert MustPayBeforeMinting();

128:             revert CurrentBactchNotFinished();

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

56:             revert UnAuthorized();

80:             revert NoMoreTokensLeft();

83:             revert CurrentBatchNotActive();

86:           revert QuantityMustBeAboveZero();

90:             revert MaxBuyAmountLimitReached();

96:                 revert MustPayBeforeMinting();

133:             revert CurrentBactchNotFinished();

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

147:         if (owner == address(0)) revert BalanceQueryForZeroAddress();

155:         if (owner == address(0)) revert MintedQueryForZeroAddress();

163:         if (owner == address(0)) revert BurnedQueryForZeroAddress();

171:         if (owner == address(0)) revert AuxQueryForZeroAddress();

180:         if (owner == address(0)) revert AuxQueryForZeroAddress();

213:         revert OwnerQueryForNonexistentToken();

241:         if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

261:         if (to == owner) revert ApprovalToCurrentOwner();

264:             revert ApprovalCallerNotOwnerNorApproved();

274:         if (!_exists(tokenId)) revert ApprovalQueryForNonexistentToken();

283:         if (operator == _msgSender()) revert ApproveToCaller();

329:             revert TransferToNonERC721ReceiverImplementer();

384:         if (to == address(0)) revert MintToZeroAddress();

385:         if (quantity == 0) revert MintZeroQuantity();

406:                         revert TransferToNonERC721ReceiverImplementer();

410:                 if (_currentIndex != startTokenId) revert();

442:         if (!isApprovedOrOwner) revert TransferCallerNotOwnerNorApproved();

443:         if (prevOwnership.addr != from) revert TransferFromIncorrectOwner();

444:         if (to == address(0)) revert TransferToZeroAddress();

566:                 revert TransferToNonERC721ReceiverImplementer();

```

### <a name="NC-21"></a>[NC-21] Deprecated library used for Solidity `>= 0.8` : SafeMath

*Instances (2)*:
```solidity
File: contracts/Migrator.sol

6: import "./dependencies/utils/math/SafeMathUpgradeable.sol";

15:     using SafeMathUpgradeable for uint;

```

### <a name="NC-22"></a>[NC-22] Strings should use double quotes rather than single quotes
See the Solidity Style Guide: https://docs.soliditylang.org/en/v0.8.20/style-guide.html#other-recommendations

*Instances (10)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmR3JYjc8bjvjpuwJhWN38DSKZSLA9ydU67CoddWuo89J8';

83:         require(_currentBatch.quantity == 0, 'Current batch not finished.');

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

244:         return bytes(baseURI).length != 0 ? string(baseURI) : '';

253:         return '';

315:         safeTransferFrom(from, to, tokenId, '');

346:         _safeMint(to, quantity, '');

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

33:         return 'https://sidekickfinance.mypinata.cloud/ipfs/QmSG7SsDgMkXRA8ySWxder9tQYRKgXvT1Dmh9sStqM1huG';

77:         require(_currentBatch.quantity == 0, 'Current batch not finished.');

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmVRVjmmK5bDJdpSXAyZ4iqQsR5q7w4tyDPTqhV21UiYTM';

82:         require(_currentBatch.quantity == 0, 'Current batch not finished.');

```

### <a name="NC-23"></a>[NC-23] Contract does not follow the Solidity style guide's suggested layout ordering
The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (9)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

1: 
   Current order:
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

1: 
   Current order:
   UsingForDirective.AddressUpgradeable
   UsingForDirective.StringsUpgradeable
   StructDefinition.TokenOwnership
   StructDefinition.AddressData
   VariableDeclaration._currentIndex
   VariableDeclaration._burnCounter
   VariableDeclaration._name
   VariableDeclaration._symbol
   VariableDeclaration._ownerships
   VariableDeclaration._addressData
   VariableDeclaration._tokenApprovals
   VariableDeclaration._operatorApprovals
   FunctionDefinition.ERC721A_Initialize
   FunctionDefinition._startTokenId
   FunctionDefinition.totalSupply
   FunctionDefinition._totalMinted
   FunctionDefinition.supportsInterface
   FunctionDefinition.balanceOf
   FunctionDefinition._numberMinted
   FunctionDefinition._numberBurned
   FunctionDefinition._getAux
   FunctionDefinition._setAux
   FunctionDefinition.ownershipOf
   FunctionDefinition.ownerOf
   FunctionDefinition.multiOwnerOf
   FunctionDefinition.name
   FunctionDefinition.symbol
   FunctionDefinition.tokenURI
   FunctionDefinition._baseURI
   FunctionDefinition.approve
   FunctionDefinition.getApproved
   FunctionDefinition.setApprovalForAll
   FunctionDefinition.isApprovedForAll
   FunctionDefinition.transferFrom
   FunctionDefinition.transferBulkFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition._exists
   FunctionDefinition._safeMint
   FunctionDefinition._safeMint
   FunctionDefinition._mint
   FunctionDefinition._transfer
   FunctionDefinition._bulkTransfer
   FunctionDefinition._burn
   FunctionDefinition._approve
   FunctionDefinition._checkContractOnERC721Received
   FunctionDefinition._beforeTokenTransfers
   FunctionDefinition._afterTokenTransfers
   
   Suggested order:
   UsingForDirective.AddressUpgradeable
   UsingForDirective.StringsUpgradeable
   VariableDeclaration._currentIndex
   VariableDeclaration._burnCounter
   VariableDeclaration._name
   VariableDeclaration._symbol
   VariableDeclaration._ownerships
   VariableDeclaration._addressData
   VariableDeclaration._tokenApprovals
   VariableDeclaration._operatorApprovals
   StructDefinition.TokenOwnership
   StructDefinition.AddressData
   FunctionDefinition.ERC721A_Initialize
   FunctionDefinition._startTokenId
   FunctionDefinition.totalSupply
   FunctionDefinition._totalMinted
   FunctionDefinition.supportsInterface
   FunctionDefinition.balanceOf
   FunctionDefinition._numberMinted
   FunctionDefinition._numberBurned
   FunctionDefinition._getAux
   FunctionDefinition._setAux
   FunctionDefinition.ownershipOf
   FunctionDefinition.ownerOf
   FunctionDefinition.multiOwnerOf
   FunctionDefinition.name
   FunctionDefinition.symbol
   FunctionDefinition.tokenURI
   FunctionDefinition._baseURI
   FunctionDefinition.approve
   FunctionDefinition.getApproved
   FunctionDefinition.setApprovalForAll
   FunctionDefinition.isApprovedForAll
   FunctionDefinition.transferFrom
   FunctionDefinition.transferBulkFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition._exists
   FunctionDefinition._safeMint
   FunctionDefinition._safeMint
   FunctionDefinition._mint
   FunctionDefinition._transfer
   FunctionDefinition._bulkTransfer
   FunctionDefinition._burn
   FunctionDefinition._approve
   FunctionDefinition._checkContractOnERC721Received
   FunctionDefinition._beforeTokenTransfers
   FunctionDefinition._afterTokenTransfers

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

1: 
   Current order:
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

1: 
   Current order:
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.nextBatchId
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   VariableDeclaration.allBatches
   VariableDeclaration.SIGNER_ROLE
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.supportsInterface
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   FunctionDefinition.mintAsFreeMinter

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

1: 
   Current order:
   FunctionDefinition.constructor
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   EventDefinition.NewBatchCreated
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.constructor
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

1: 
   Current order:
   UsingForDirective.Address
   UsingForDirective.Strings
   StructDefinition.TokenOwnership
   StructDefinition.AddressData
   VariableDeclaration._currentIndex
   VariableDeclaration._burnCounter
   VariableDeclaration._name
   VariableDeclaration._symbol
   VariableDeclaration._ownerships
   VariableDeclaration._addressData
   VariableDeclaration._tokenApprovals
   VariableDeclaration._operatorApprovals
   FunctionDefinition.constructor
   FunctionDefinition._startTokenId
   FunctionDefinition.totalSupply
   FunctionDefinition._totalMinted
   FunctionDefinition.supportsInterface
   FunctionDefinition.balanceOf
   FunctionDefinition._numberMinted
   FunctionDefinition._numberBurned
   FunctionDefinition._getAux
   FunctionDefinition._setAux
   FunctionDefinition.ownershipOf
   FunctionDefinition.ownerOf
   FunctionDefinition.name
   FunctionDefinition.symbol
   FunctionDefinition.tokenURI
   FunctionDefinition._baseURI
   FunctionDefinition.approve
   FunctionDefinition.getApproved
   FunctionDefinition.setApprovalForAll
   FunctionDefinition.isApprovedForAll
   FunctionDefinition.transferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition._exists
   FunctionDefinition._safeMint
   FunctionDefinition._safeMint
   FunctionDefinition._mint
   FunctionDefinition._transfer
   FunctionDefinition._burn
   FunctionDefinition._approve
   FunctionDefinition._checkContractOnERC721Received
   FunctionDefinition._beforeTokenTransfers
   FunctionDefinition._afterTokenTransfers
   
   Suggested order:
   UsingForDirective.Address
   UsingForDirective.Strings
   VariableDeclaration._currentIndex
   VariableDeclaration._burnCounter
   VariableDeclaration._name
   VariableDeclaration._symbol
   VariableDeclaration._ownerships
   VariableDeclaration._addressData
   VariableDeclaration._tokenApprovals
   VariableDeclaration._operatorApprovals
   StructDefinition.TokenOwnership
   StructDefinition.AddressData
   FunctionDefinition.constructor
   FunctionDefinition._startTokenId
   FunctionDefinition.totalSupply
   FunctionDefinition._totalMinted
   FunctionDefinition.supportsInterface
   FunctionDefinition.balanceOf
   FunctionDefinition._numberMinted
   FunctionDefinition._numberBurned
   FunctionDefinition._getAux
   FunctionDefinition._setAux
   FunctionDefinition.ownershipOf
   FunctionDefinition.ownerOf
   FunctionDefinition.name
   FunctionDefinition.symbol
   FunctionDefinition.tokenURI
   FunctionDefinition._baseURI
   FunctionDefinition.approve
   FunctionDefinition.getApproved
   FunctionDefinition.setApprovalForAll
   FunctionDefinition.isApprovedForAll
   FunctionDefinition.transferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition.safeTransferFrom
   FunctionDefinition._exists
   FunctionDefinition._safeMint
   FunctionDefinition._safeMint
   FunctionDefinition._mint
   FunctionDefinition._transfer
   FunctionDefinition._burn
   FunctionDefinition._approve
   FunctionDefinition._checkContractOnERC721Received
   FunctionDefinition._beforeTokenTransfers
   FunctionDefinition._afterTokenTransfers

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

1: 
   Current order:
   FunctionDefinition.constructor
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   EventDefinition.NewBatchCreated
   FunctionDefinition._baseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.constructor
   FunctionDefinition._baseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

1: 
   Current order:
   FunctionDefinition.constructor
   StructDefinition.Batch
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   EventDefinition.NewBatchCreated
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant
   
   Suggested order:
   VariableDeclaration._paymentToken
   VariableDeclaration._feeCollector
   VariableDeclaration._currentBatch
   VariableDeclaration._txFeeAmount
   VariableDeclaration._maxBuyAmount
   VariableDeclaration.baseUri
   VariableDeclaration.freeParticipantControllers
   VariableDeclaration.freeParticipant
   StructDefinition.Batch
   EventDefinition.NewBatchCreated
   FunctionDefinition.constructor
   FunctionDefinition._baseURI
   FunctionDefinition.setBaseURI
   FunctionDefinition.mint
   FunctionDefinition._pay
   FunctionDefinition._tax
   FunctionDefinition.setCurrentBatch
   FunctionDefinition.setCurrentBatchActive
   FunctionDefinition.setTxFee
   FunctionDefinition.setPaymentToken
   FunctionDefinition.setFeeCollector
   FunctionDefinition.setFreeParticipantController
   FunctionDefinition.setFreeParticipant

```

```solidity
File: contracts/Migrator.sol

1: 
   Current order:
   UsingForDirective.SafeMathUpgradeable
   StructDefinition.Requirement
   VariableDeclaration.Requirements
   VariableDeclaration.lastAssetIdMinted
   VariableDeclaration.tokensMigrated
   VariableDeclaration.SIGNER_ROLE
   VariableDeclaration.totalAcreMigrated
   VariableDeclaration.totalPlotMigrated
   VariableDeclaration.totalYardMigrated
   EventDefinition.TokenMigrationCompleted
   EventDefinition.NFTMigrationCompleted
   EventDefinition.MigrationTokenSet
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._withdrawOldNFT
   FunctionDefinition._mintNewNFT
   FunctionDefinition.migrateERC20Token
   FunctionDefinition.migrateAllAsset
   FunctionDefinition.onERC721Received
   FunctionDefinition.setERC721Requirements
   FunctionDefinition.setTokenInfo
   
   Suggested order:
   UsingForDirective.SafeMathUpgradeable
   VariableDeclaration.Requirements
   VariableDeclaration.lastAssetIdMinted
   VariableDeclaration.tokensMigrated
   VariableDeclaration.SIGNER_ROLE
   VariableDeclaration.totalAcreMigrated
   VariableDeclaration.totalPlotMigrated
   VariableDeclaration.totalYardMigrated
   StructDefinition.Requirement
   EventDefinition.TokenMigrationCompleted
   EventDefinition.NFTMigrationCompleted
   EventDefinition.MigrationTokenSet
   FunctionDefinition.initialize
   FunctionDefinition._onlySigner
   FunctionDefinition._withdrawOldNFT
   FunctionDefinition._mintNewNFT
   FunctionDefinition.migrateERC20Token
   FunctionDefinition.migrateAllAsset
   FunctionDefinition.onERC721Received
   FunctionDefinition.setERC721Requirements
   FunctionDefinition.setTokenInfo

```

### <a name="NC-24"></a>[NC-24] Internal and private variables and functions names should begin with an underscore
According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (7)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

33:     string private baseUri;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

205:     function ownershipOf(uint256 tokenId)

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

34:     string private baseUri;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

34:     string private baseUri;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmR3JYjc8bjvjpuwJhWN38DSKZSLA9ydU67CoddWuo89J8';

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

188:     function ownershipOf(uint256 tokenId) internal view returns (TokenOwnership memory) {

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

27:     string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmVRVjmmK5bDJdpSXAyZ4iqQsR5q7w4tyDPTqhV21UiYTM';

```

### <a name="NC-25"></a>[NC-25] Event is missing `indexed` fields
Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (6)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

39:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

40:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

40:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

31:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

30:     event NewBatchCreated(uint256 batchStartIndex);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

31:     event NewBatchCreated(uint256 batchStartIndex);

```

### <a name="NC-26"></a>[NC-26] `public` functions not called by the contract should be declared `external` instead

*Instances (62)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

41:     function initialize(address paymentToken) public initializer {

63:     function setBaseURI(string memory newUri) public {

74:     function mint(uint256 quantity) public {

120:     function setCurrentBatch(

139:     function setCurrentBatchActive(bool active) public {

144:     function setTxFee(uint256 amount) public {

149:     function setPaymentToken(address token) public {

154:     function setFeeCollector(address collector) public {

159:     function setFreeParticipantController(

167:     function setFreeParticipant(address participant, bool free) public {

172:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

105:     function ERC721A_Initialize(string memory name_, string memory symbol_)

125:     function totalSupply() public view returns (uint256) {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

42:     function initialize(address paymentToken) public initializer {

64:     function setBaseURI(string memory newUri) public {

75:     function mint(uint256 quantity) public {

121:     function setCurrentBatch(

140:     function setCurrentBatchActive(bool active) public {

145:     function setTxFee(uint256 amount) public {

150:     function setPaymentToken(address token) public {

155:     function setFeeCollector(address collector) public {

160:     function setFreeParticipantController(

168:     function setFreeParticipant(address participant, bool free) public {

173:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

42:     function initialize(address paymentToken) public initializer {

64:     function setBaseURI(string memory newUri) public {

78:     function mint(uint256 quantity) public {

125:     function setCurrentBatch(

145:     function setCurrentBatchActive(bool active) public {

150:     function setTxFee(uint256 amount) public {

155:     function setPaymentToken(address token) public {

160:     function setFeeCollector(address collector) public {

165:     function setFreeParticipantController(

173:     function setFreeParticipant(address participant, bool free) public {

178:     function mintAsFreeMinter(uint256 quantity) public {

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

41:     function mint(uint256 quantity) public {

78:     function setCurrentBatch(

92:     function setCurrentBatchActive(bool active) public onlyOwner {

96:     function setTxFee(uint256 amount) public onlyOwner {

100:     function setPaymentToken(address token) public onlyOwner {

104:     function setFeeCollector(address collector) public onlyOwner {

108:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

113:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

114:     function totalSupply() public view returns (uint256) {

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

36:     function mint(uint256 quantity) public {

72:     function setCurrentBatch(

86:     function setCurrentBatchActive(bool active) public onlyOwner {

90:     function setTxFee(uint256 amount) public onlyOwner {

94:     function setPaymentToken(address token) public onlyOwner {

98:     function setFeeCollector(address collector) public onlyOwner {

102:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

107:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

37:     function setBaseURI (string memory newUri) public onlyOwner {

41:     function mint(uint256 quantity) public {

77:     function setCurrentBatch(

91:     function setCurrentBatchActive(bool active) public onlyOwner {

95:     function setTxFee(uint256 amount) public onlyOwner {

99:     function setPaymentToken(address token) public onlyOwner {

103:     function setFeeCollector(address collector) public onlyOwner {

107:     function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner

112:     function setFreeParticipant(address participant, bool free) public onlyOwner

```

### <a name="NC-27"></a>[NC-27] Variables need not be initialized to zero
The default value for variables is zero, so initializing them to zero is superfluous.

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

250:         for (uint i = 0; i < _ids.length; i++) {

```

```solidity
File: contracts/Migrator.sol

229:             for (uint i = 0; i < _acre.length; i++) {

243:             for (uint i = 0; i < _plot.length; i++) {

256:             for (uint i = 0; i < _yard.length; i++) {

```


## Low Issues


| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Use a 2-step ownership transfer pattern | 3 |
| [L-2](#L-2) | Some tokens may revert when zero value transfers are made | 14 |
| [L-3](#L-3) | Missing checks for `address(0)` when assigning values to address state variables | 18 |
| [L-4](#L-4) | Do not use deprecated library functions | 4 |
| [L-5](#L-5) | Deprecated _setupRole() function | 4 |
| [L-6](#L-6) | Initializers could be front-run | 4 |
| [L-7](#L-7) | Prevent accidentally burning tokens | 7 |
| [L-8](#L-8) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 11 |
| [L-9](#L-9) | Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership` | 3 |
| [L-10](#L-10) | File allows a version of solidity that is susceptible to an assembly optimizer bug | 11 |
| [L-11](#L-11) | Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting | 4 |
| [L-12](#L-12) | Unsafe ERC20 operation(s) | 16 |
| [L-13](#L-13) | Upgradeable contract is missing a `__gap[50]` storage variable to allow for new storage variables in later versions | 48 |
| [L-14](#L-14) | Upgradeable contract not initialized | 56 |
### <a name="L-1"></a>[L-1] Use a 2-step ownership transfer pattern
Recommend considering implementing a two step process where the owner or admin nominates an account and the nominated account needs to call an `acceptOwnership()` function for the transfer of ownership to fully succeed. This ensures the nominated EOA account is a valid and active account. Lack of two-step procedure for critical operations leaves them error-prone. Consider adding two step procedure on the critical functions.

*Instances (3)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

8: contract ATLACRE is ERC721A, Ownable {

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

8: contract ATLPLOT is ERC721A, Ownable {

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

8: contract ATLYARD is ERC721A, Ownable {

```

### <a name="L-2"></a>[L-2] Some tokens may revert when zero value transfers are made
Example: https://github.com/d-xo/weird-erc20#revert-on-zero-value-transfers.

In spite of the fact that EIP-20 [states](https://github.com/ethereum/EIPs/blob/46b9b698815abbfa628cd1097311deee77dd45c5/EIPS/eip-20.md?plain=1#L116) that zero-valued transfers must be accepted, some tokens, such as LEND will revert if this is attempted, which may cause transactions that involve other tokens (such as batch operations) to fully revert. Consider skipping the transfer if the amount is zero, which will also save gas.

*Instances (14)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

106:         token.transferFrom(

116:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

107:         token.transferFrom(

117:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

111:         token.transferFrom(

121:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

64:         token.transferFrom(

74:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

58:         token.transferFrom(

68:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

63:         token.transferFrom(

73:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/Migrator.sol

187:         bool success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```

### <a name="L-3"></a>[L-3] Missing checks for `address(0)` when assigning values to address state variables

*Instances (18)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

44:         _paymentToken = paymentToken;

151:         _paymentToken = token;

156:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

45:         _paymentToken = paymentToken;

152:         _paymentToken = token;

157:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

45:         _paymentToken = paymentToken;

157:         _paymentToken = token;

162:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

10:         _paymentToken = paymentToken;

101:         _paymentToken = token;

105:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

10:         _paymentToken = paymentToken;

95:         _paymentToken = token;

99:         _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

10:         _paymentToken = paymentToken;

100:         _paymentToken = token;

104:         _feeCollector = collector;

```

### <a name="L-4"></a>[L-4] Do not use deprecated library functions

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

42:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/Migrator.sol

59:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

### <a name="L-5"></a>[L-5] Deprecated _setupRole() function

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

42:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

43:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

```solidity
File: contracts/Migrator.sol

59:         _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());

```

### <a name="L-6"></a>[L-6] Initializers could be front-run
Initializers could be front-run, allowing an attacker to either set their own values, take ownership of the contract, and in the best case forcing a re-deployment

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

41:     function initialize(address paymentToken) public initializer {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

42:     function initialize(address paymentToken) public initializer {

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

42:     function initialize(address paymentToken) public initializer {

```

```solidity
File: contracts/Migrator.sol

58:     function initialize() external virtual initializer {

```

### <a name="L-7"></a>[L-7] Prevent accidentally burning tokens
Minting and burning tokens to address(0) prevention

*Instances (7)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

12:         _mint(_to, _amount);

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

12:         _mint(_to, _amount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

434:         _mint(to, quantity, _data, true);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

364:         _mint(to, quantity, _data, true);

```

```solidity
File: contracts/Migrator.sol

233:             _mintNewNFT(

246:             _mintNewNFT(

259:             _mintNewNFT(

```

### <a name="L-8"></a>[L-8] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`
The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (11)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

3: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

3: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

4: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

4: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/Migrator.sol

2: pragma solidity ^0.8.4;

```

### <a name="L-9"></a>[L-9] Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership`
Use [Ownable2Step.transferOwnership](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol) which is safer. Use it as it is more secure due to 2-stage ownership transfer.

**Recommended Mitigation Steps**

Use <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol">Ownable2Step.sol</a>
  
  ```solidity
      function acceptOwnership() external {
          address sender = _msgSender();
          require(pendingOwner() == sender, "Ownable2Step: caller is not the new owner");
          _transferOwnership(sender);
      }
```

*Instances (3)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

5: import '@openzeppelin/contracts/access/Ownable.sol';

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

5: import '@openzeppelin/contracts/access/Ownable.sol';

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

5: import '@openzeppelin/contracts/access/Ownable.sol';

```

### <a name="L-10"></a>[L-10] File allows a version of solidity that is susceptible to an assembly optimizer bug
In solidity versions 0.8.13 and 0.8.14, there is an [optimizer bug](https://github.com/ethereum/solidity-blog/blob/499ab8abc19391be7b7b34f88953a067029a5b45/_posts/2022-06-15-inline-assembly-memory-side-effects-bug.md) where, if the use of a variable is in a separate `assembly` block from the block in which it was stored, the `mstore` operation is optimized out, leading to uninitialized memory. The code currently does not have such a pattern of execution, but it does use `mstore`s in `assembly` blocks, so it is a risk for future changes. The affected solidity versions should be avoided if at all possible.

*Instances (11)*:
```solidity
File: contracts/COA-Contracts/Busd.sol

3: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/Prlz.sol

3: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

4: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

4: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

2: pragma solidity ^0.8.4;

```

```solidity
File: contracts/Migrator.sol

2: pragma solidity ^0.8.4;

```

### <a name="L-11"></a>[L-11] Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting
Downcasting from `uint256`/`int256` in Solidity does not revert on overflow. This can result in undesired exploitation or bugs, since developers usually assume that overflows raise errors. [OpenZeppelin's SafeCast library](https://docs.openzeppelin.com/contracts/3.x/api/utils#SafeCast) restores this intuition by reverting the transaction when such an operation overflows. Using this library eliminates an entire class of bugs, so it's recommended to use it always. Some exceptions are acceptable like with the classic `uint256(uint160(address(variable)))`

*Instances (4)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

461:             _addressData[to].balance += uint64(quantity);

462:             _addressData[to].numberMinted += uint64(quantity);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

393:             _addressData[to].balance += uint64(quantity);

394:             _addressData[to].numberMinted += uint64(quantity);

```

### <a name="L-12"></a>[L-12] Unsafe ERC20 operation(s)

*Instances (16)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

106:         token.transferFrom(

116:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

107:         token.transferFrom(

117:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

111:         token.transferFrom(

121:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

64:         token.transferFrom(

74:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

58:         token.transferFrom(

68:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

63:         token.transferFrom(

73:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/Migrator.sol

90:         ICollectible(_nft1).transferFrom(_msgSender(), address(this), _tokenId);

115:                 nftObj.transferFrom(address(this), _user, index);

187:         bool success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```

### <a name="L-13"></a>[L-13] Upgradeable contract is missing a `__gap[50]` storage variable to allow for new storage variables in later versions
See [this](https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps) link for a description of this storage variable. While some contracts may not currently be sub-classed, adding the variable now protects against forgetting to add it in the future.

*Instances (48)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

18: contract ACRE is ERC721A, AccessControlUpgradeable {

70:     ) public view override(ERC721A, AccessControlUpgradeable) returns (bool) {

105:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

115:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

6: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";

7: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721ReceiverUpgradeable.sol";

8: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721MetadataUpgradeable.sol";

9: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol";

10: import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

11: import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";

12: import "@openzeppelin/contracts-upgradeable/utils/StringsUpgradeable.sol";

13: import "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";

14: import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

47:     ContextUpgradeable,

48:     ERC165Upgradeable,

49:     IERC721Upgradeable,

50:     IERC721MetadataUpgradeable

52:     using AddressUpgradeable for address;

53:     using StringsUpgradeable for uint256;

151:         override(ERC165Upgradeable, IERC165Upgradeable)

155:             interfaceId == type(IERC721Upgradeable).interfaceId ||

156:             interfaceId == type(IERC721MetadataUpgradeable).interfaceId ||

650:             IERC721ReceiverUpgradeable(to).onERC721Received(

659:                 IERC721ReceiverUpgradeable(to).onERC721Received.selector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

19: contract PLOT is ERC721A, AccessControlUpgradeable {

71:     ) public view override(ERC721A, AccessControlUpgradeable) returns (bool) {

106:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

116:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

19: contract YARD is ERC721A, AccessControlUpgradeable {

72:         override(ERC721A, AccessControlUpgradeable)

110:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

120:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/Migrator.sol

4: import "./dependencies/access/AccessControlUpgradeable.sol";

6: import "./dependencies/utils/math/SafeMathUpgradeable.sol";

7: import "./dependencies/token/ERC20/IERC20Upgradeable.sol";

14: contract Migrator is Initializable, AccessControlUpgradeable, IERC721Receiver {

15:     using SafeMathUpgradeable for uint;

159:         uint allowance = IERC20Upgradeable(_token1).allowance(

168:         uint balance = IERC20Upgradeable(Requirements.tokenV1).balanceOf(

178:         balance = IERC20Upgradeable(Requirements.tokenV2).balanceOf(

187:         bool success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```

### <a name="L-14"></a>[L-14] Upgradeable contract not initialized
Upgradeable contracts are initialized via an initializer function rather than by a constructor. Leaving such a contract uninitialized may lead to it being taken over by a malicious user

*Instances (56)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

18: contract ACRE is ERC721A, AccessControlUpgradeable {

41:     function initialize(address paymentToken) public initializer {

43:         ERC721A.ERC721A_Initialize("EVT Acre", "aEVT");

70:     ) public view override(ERC721A, AccessControlUpgradeable) returns (bool) {

105:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

115:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

6: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721Upgradeable.sol";

7: import "@openzeppelin/contracts-upgradeable/token/ERC721/IERC721ReceiverUpgradeable.sol";

8: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721MetadataUpgradeable.sol";

9: import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol";

10: import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

11: import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";

12: import "@openzeppelin/contracts-upgradeable/utils/StringsUpgradeable.sol";

13: import "@openzeppelin/contracts-upgradeable/utils/introspection/ERC165Upgradeable.sol";

14: import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

47:     ContextUpgradeable,

48:     ERC165Upgradeable,

49:     IERC721Upgradeable,

50:     IERC721MetadataUpgradeable

52:     using AddressUpgradeable for address;

53:     using StringsUpgradeable for uint256;

105:     function ERC721A_Initialize(string memory name_, string memory symbol_)

151:         override(ERC165Upgradeable, IERC165Upgradeable)

155:             interfaceId == type(IERC721Upgradeable).interfaceId ||

156:             interfaceId == type(IERC721MetadataUpgradeable).interfaceId ||

650:             IERC721ReceiverUpgradeable(to).onERC721Received(

659:                 IERC721ReceiverUpgradeable(to).onERC721Received.selector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

19: contract PLOT is ERC721A, AccessControlUpgradeable {

42:     function initialize(address paymentToken) public initializer {

44:         ERC721A.ERC721A_Initialize("EVT Plot", "pEVT");

71:     ) public view override(ERC721A, AccessControlUpgradeable) returns (bool) {

106:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

116:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

5: import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

6: import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

19: contract YARD is ERC721A, AccessControlUpgradeable {

42:     function initialize(address paymentToken) public initializer {

44:         ERC721A.ERC721A_Initialize("EVT Yard", "yEVT");

72:         override(ERC721A, AccessControlUpgradeable)

110:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

120:         IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);

```

```solidity
File: contracts/Migrator.sol

4: import "./dependencies/access/AccessControlUpgradeable.sol";

6: import "./dependencies/utils/math/SafeMathUpgradeable.sol";

7: import "./dependencies/token/ERC20/IERC20Upgradeable.sol";

14: contract Migrator is Initializable, AccessControlUpgradeable, IERC721Receiver {

15:     using SafeMathUpgradeable for uint;

58:     function initialize() external virtual initializer {

159:         uint allowance = IERC20Upgradeable(_token1).allowance(

168:         uint balance = IERC20Upgradeable(Requirements.tokenV1).balanceOf(

178:         balance = IERC20Upgradeable(Requirements.tokenV2).balanceOf(

187:         bool success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```


## Medium Issues


| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 20 |
| [M-2](#M-2) | Using `transferFrom` on ERC721 tokens | 1 |
| [M-3](#M-3) | Fees can be set to be greater than 100%. | 12 |
| [M-4](#M-4) | Direct `supportsInterface()` calls may cause caller to revert | 5 |
| [M-5](#M-5) | Return values of `transfer()`/`transferFrom()` not checked | 13 |
| [M-6](#M-6) | Unsafe use of `transfer()`/`transferFrom()` with `IERC20` | 14 |
### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact:
Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (20)*:
```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

8: contract ATLACRE is ERC721A, Ownable {

37:     function setBaseURI (string memory newUri) public onlyOwner {

82:     ) public onlyOwner {

92:     function setCurrentBatchActive(bool active) public onlyOwner {

96:     function setTxFee(uint256 amount) public onlyOwner {

100:     function setPaymentToken(address token) public onlyOwner {

104:     function setFeeCollector(address collector) public onlyOwner {

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

8: contract ATLPLOT is ERC721A, Ownable {

76:     ) public onlyOwner {

86:     function setCurrentBatchActive(bool active) public onlyOwner {

90:     function setTxFee(uint256 amount) public onlyOwner {

94:     function setPaymentToken(address token) public onlyOwner {

98:     function setFeeCollector(address collector) public onlyOwner {

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

8: contract ATLYARD is ERC721A, Ownable {

37:     function setBaseURI (string memory newUri) public onlyOwner {

81:     ) public onlyOwner {

91:     function setCurrentBatchActive(bool active) public onlyOwner {

95:     function setTxFee(uint256 amount) public onlyOwner {

99:     function setPaymentToken(address token) public onlyOwner {

103:     function setFeeCollector(address collector) public onlyOwner {

```

### <a name="M-2"></a>[M-2] Using `transferFrom` on ERC721 tokens
The `transferFrom` function is used instead of `safeTransferFrom` and [it's discouraged by OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/109778c17c7020618ea4e035efb9f0f9b82d43ca/contracts/token/ERC721/IERC721.sol#L84). If the arbitrary address is a contract and is not aware of the incoming ERC721 token, the sent token could be locked.

*Instances (1)*:
```solidity
File: contracts/Migrator.sol

90:         ICollectible(_nft1).transferFrom(_msgSender(), address(this), _tokenId);

```

### <a name="M-3"></a>[M-3] Fees can be set to be greater than 100%.
There should be an upper limit to reasonable fees.
A malicious owner can keep the fee rate at zero, but if a large value transfer enters the mempool, the owner can jack the rate up to the maximum and sandwich attack a user.

*Instances (12)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

144:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

154:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

145:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

155:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

150:     function setTxFee(uint256 amount) public {
             _onlySigner();
             _txFeeAmount = amount;

160:     function setFeeCollector(address collector) public {
             _onlySigner();
             _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

96:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

104:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

90:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

98:     function setFeeCollector(address collector) public onlyOwner {
            _feeCollector = collector;

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

95:     function setTxFee(uint256 amount) public onlyOwner {
            _txFeeAmount = amount;

103:     function setFeeCollector(address collector) public onlyOwner {
             _feeCollector = collector;

```

### <a name="M-4"></a>[M-4] Direct `supportsInterface()` calls may cause caller to revert
Calling `supportsInterface()` on a contract that doesn't implement the ERC-165 standard will result in the call reverting. Even if the caller does support the function, the contract may be malicious and consume all of the transaction's available gas. Call it via a low-level [staticcall()](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/f959d7e4e6ee0b022b41e5b644c79369869d8411/contracts/utils/introspection/ERC165Checker.sol#L119), with a fixed amount of gas, and check the return code, or use OpenZeppelin's [`ERC165Checker.supportsInterface()`](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/f959d7e4e6ee0b022b41e5b644c79369869d8411/contracts/utils/introspection/ERC165Checker.sol#L36-L39).

*Instances (5)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

71:         return ERC721A.supportsInterface(interfaceId);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/ERC721A.sol

157:             super.supportsInterface(interfaceId);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

72:         return ERC721A.supportsInterface(interfaceId);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

75:         return ERC721A.supportsInterface(interfaceId);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ERC721A.sol

140:             super.supportsInterface(interfaceId);

```

### <a name="M-5"></a>[M-5] Return values of `transfer()`/`transferFrom()` not checked
Not all `IERC20` implementations `revert()` when there's a failure in `transfer()`/`transferFrom()`. The function signature has a `boolean` return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually making a payment

*Instances (13)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

106:         token.transferFrom(

116:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

107:         token.transferFrom(

117:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

111:         token.transferFrom(

121:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

64:         token.transferFrom(

74:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

58:         token.transferFrom(

68:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

63:         token.transferFrom(

73:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/Migrator.sol

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```

### <a name="M-6"></a>[M-6] Unsafe use of `transfer()`/`transferFrom()` with `IERC20`
Some tokens do not implement the ERC20 standard properly but are still accepted by most code that accepts ERC20 tokens.  For example Tether (USDT)'s `transfer()` and `transferFrom()` functions on L1 do not return booleans as the specification requires, and instead have no return value. When these sorts of tokens are cast to `IERC20`, their [function signatures](https://medium.com/coinmonks/missing-return-value-bug-at-least-130-tokens-affected-d67bf08521ca) do not match and therefore the calls made, revert (see [this](https://gist.github.com/IllIllI000/2b00a32e8f0559e8f386ea4f1800abc5) link for a test case). Use OpenZeppelin's `SafeERC20`'s `safeTransfer()`/`safeTransferFrom()` instead

*Instances (14)*:
```solidity
File: contracts/COA-Contracts/land-nfts-v2/ACRE.sol

106:         token.transferFrom(

116:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/PLOT.sol

107:         token.transferFrom(

117:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts-v2/YARD.sol

111:         token.transferFrom(

121:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/ACRE.sol

64:         token.transferFrom(

74:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/PLOT.sol

58:         token.transferFrom(

68:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/COA-Contracts/land-nfts/YARD.sol

63:         token.transferFrom(

73:         token.transferFrom(payee, _feeCollector, _txFeeAmount);

```

```solidity
File: contracts/Migrator.sol

187:         bool success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(

195:         success = IERC20Upgradeable(Requirements.tokenV2).transfer(

```

