# findings

## Safe math is not needed with solidity 0.8 and above- Low

## users token can get stuck in the contract if another user with a bigger index migrates before - medium

## attacker can replace user migrated tokens by sending tokens to the migration contract - high

## no access control in token function mint allows anyone to mint tokens{permanent dos} - high

## no use of safetransferfrom - medium

## if the first token owner is burnt, ownershipof will revert - low

## there is no check on the function _burn tokenId - low

## it is possible for _burnCOunter to exceed _currentIndex times - low

## the requirements price is not constrained - medium

## no check if the tokens are the same when setting token Info - low

## no zero address check on _feeCollector - medium

## _burn function is not used - informational

# tests

1. test migrateERC20Token token fail that does not return on transferfrom 
2. test migrateERC20Token token pass that does not return on transferfrom 
3. test migrateAllAsset token stuck
4. test migrateAllAsset pass
5. test setERC721Requirements pass
6. test setERC721Requirements fail
7. test setTokenInfo fail
8. test setTokenInfo pass
9. test BUSD pass and dos and fail
10. test ACRE mint pass
11. test ownershipOf fail
12. test burn function


# invariants

1. underflow in erc721a totalSupply
2. invariant in erc721a ownershipOf

# deliverables

1. audit report and 
2. slither tool report
3. unit test
4. Risk Assessment Report:
    Business logic risks and mitigation.{migrating method}
    Deployment risks and mitigation.{initializer}
5. Screen Recording: Upload the recording to a cloud storage service (e.g., Google Drive or Dropbox) and provide a shareable link.
Include an overview of the tools and methods used.
Clearly demonstrate the steps taken for auditing, testing, and analysis.


# contracts

## Migrator is Initializable, AccessControlUpgradeable, IERC721Receiver

```solidity
function initialize() external virtual initializer;

function migrateERC20Token(
        uint256 _amount,
        address _token1,
        address _token2
    ) external returns (bool result);

function migrateAllAsset(
        uint[] memory _acre,
        uint[] memory _plot,
        uint[] memory _yard
    ) external returns (bool success);

function setERC721Requirements(
        address _acre,
        address _yard,
        address _plot,
        address _acreV2,
        address _yardV2,
        address _plotV2
    ) external returns (bool success);

function setTokenInfo(
        address _tokenV1,
        address _tokenV2,
        uint _price
    ) external;
```

## BUSD is ERC20

```solidity
function mint(address _to, uint _amount) external;
```

## PRLZ is ERC20

```solidity
function mint(address _to, uint _amount) external
```

## ATLACRE is ERC721A, Ownable

```solidity
function setBaseURI (string memory newUri) public onlyOwner;

function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public onlyOwner;


function setCurrentBatchActive(bool active) public onlyOwner;

function setTxFee(uint256 amount) public onlyOwner;

function setPaymentToken(address token) public onlyOwner;

function setFeeCollector(address collector) public onlyOwner;
    
function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner;

function setFreeParticipant(address participant, bool free) public onlyOwner;
```

## ERC721A is Context, ERC165, IERC721, IERC721Metadata

```solidity
function approve(address to, uint256 tokenId) public override;

function setApprovalForAll(address operator, bool approved) public override;

function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override;

function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override;

function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override;
```

## ATLPLOT is ERC721A, Ownable

```solidity
function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public onlyOwner;

function setCurrentBatchActive(bool active) public onlyOwner;

function setTxFee(uint256 amount) public onlyOwner;

function setPaymentToken(address token) public onlyOwner;

function setFeeCollector(address collector) public onlyOwne;
    
function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner;

function setFreeParticipant(address participant, bool free) public onlyOwner;
```

## ATLYARD is ERC721A, Ownable

```solidity
function setBaseURI (string memory newUri) public onlyOwner;

function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public onlyOwner;

function setCurrentBatchActive(bool active) public onlyOwner;

function setTxFee(uint256 amount) public onlyOwner;

function setPaymentToken(address token) public onlyOwner;

function setFeeCollector(address collector) public onlyOwner;
    
function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner;

function setFreeParticipant(address participant, bool free) public onlyOwner;
```

<hr></hr>

## ACRE is ERC721A, AccessControlUpgradeable

```solidity
function initialize(address paymentToken) public initializer;

function setBaseURI(string memory newUri) public;

function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public;

function setCurrentBatchActive(bool active) public;

function setTxFee(uint256 amount) public;

function setPaymentToken(address token) public;

function setFeeCollector(address collector) public;

function setFreeParticipantController(
    address freeParticipantController,
    bool allow
) public;

function setFreeParticipant(address participant, bool free) public;

function mintAsFreeMinter(uint256 quantity) public;
```

## ERC721A is Initializable, ContextUpgradeable, ERC165Upgradeable, IERC721Upgradeable, IERC721MetadataUpgradeable

```solidity
function ERC721A_Initialize(string memory name_, string memory symbol_)
    public
    onlyInitializing;

function approve(address to, uint256 tokenId) public override;

function setApprovalForAll(address operator, bool approved)
        public
        override;

function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override;

function transferBulkFrom(
        address from,
        address to,
        uint256[] memory tokenIds
    ) public virtual;

function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override;

function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public virtual override;
```

## PLOT is ERC721A, AccessControlUpgradeable

```solidity
function initialize(address paymentToken) public initializer;

function setBaseURI(string memory newUri) public;

function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public;

function setCurrentBatchActive(bool active) public;

function setTxFee(uint256 amount) public;

function setPaymentToken(address token) public;

function setFeeCollector(address collector) public;

function setFreeParticipantController(
    address freeParticipantController,
    bool allow
) public;

function setFreeParticipant(address participant, bool free) public;

function mintAsFreeMinter(uint256 quantity) public
```

## YARD is ERC721A, AccessControlUpgradeable

```solidity
function initialize(address paymentToken) public initializer;

function setBaseURI(string memory newUri) public;

function mint(uint256 quantity) public;

function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public;

function setCurrentBatchActive(bool active) public;

function setTxFee(uint256 amount) public;

function setPaymentToken(address token) public;

function setFeeCollector(address collector) public;

function setFreeParticipantController(
    address freeParticipantController,
    bool allow
) public;

function setFreeParticipant(address participant, bool free) public;

function mintAsFreeMinter(uint256 quantity) public;
```
