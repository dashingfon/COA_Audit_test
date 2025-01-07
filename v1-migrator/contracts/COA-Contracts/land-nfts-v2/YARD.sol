// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721A.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

error UnAuthorized();
error InvalidParameter();
error NoMoreTokensLeft();
error CurrentBatchNotActive();
error QuantityMustBeAboveZero();
error MaxBuyAmountLimitReached();
error MustPayBeforeMinting();
error CurrentBactchNotFinished();


error TransactionFailed(string message);
contract YARD is ERC721A, AccessControlUpgradeable {
    struct Batch {
        uint256 quantity;
        uint256 price;
        bool active;
        uint256 batch;
        uint256 startIndex;
    }

    address public _paymentToken;
    address public _feeCollector;
    Batch public _currentBatch;
    uint256 _txFeeAmount;
    uint256 _maxBuyAmount;
    uint public nextBatchId;
    string private baseUri;
    mapping(address => bool) public freeParticipantControllers;
    mapping(address => bool) public freeParticipant;
    mapping(uint256 => Batch) public allBatches;
    bytes32 public constant SIGNER_ROLE = keccak256("SIGNER_ROLE");

    event NewBatchCreated(uint256 batchStartIndex);

    function initialize(address paymentToken) public initializer {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        ERC721A.ERC721A_Initialize("EVT Yard", "yEVT");
        _paymentToken = paymentToken;
        _feeCollector = msg.sender;
        _txFeeAmount = 0;
        _maxBuyAmount = 10;
    }

    /**
     * @dev validates signer
     */
    function _onlySigner() private view {
        if (!hasRole(SIGNER_ROLE, _msgSender())) {
            revert UnAuthorized();
        }
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseUri;
    }

    function setBaseURI(string memory newUri) public {
        _onlySigner();
        baseUri = newUri;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721A, AccessControlUpgradeable)
        returns (bool)
    {
        return ERC721A.supportsInterface(interfaceId);
    }

    function mint(uint256 quantity) public {
        if(_currentBatch.quantity <= 0){
            revert NoMoreTokensLeft();
        }
        if(!_currentBatch.active){
            revert CurrentBatchNotActive();
        }
        if(quantity <= 0){
          revert QuantityMustBeAboveZero();
        }

        if(quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())){
            revert MaxBuyAmountLimitReached();
        }

        if (!freeParticipant[msg.sender]) {
            //require msg.sender is passed into _pay
            if(!_pay(msg.sender, quantity)){
                revert MustPayBeforeMinting();
            }
        }

        // check enough left to mint
        _currentBatch.quantity = (_currentBatch.quantity - quantity);
        _safeMint(msg.sender, quantity);
    }

    function _pay(address payee, uint256 quantity)
        internal
        virtual
        returns (bool)
    {
        IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);
        token.transferFrom(
            payee,
            _feeCollector,
            _currentBatch.price * quantity
        );
        return true;
    }

    function _tax(address payee) internal virtual returns (bool) {
        IERC20Upgradeable token = IERC20Upgradeable(_paymentToken);
        token.transferFrom(payee, _feeCollector, _txFeeAmount);
        return true;
    }

    function setCurrentBatch(
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
    }

    function setCurrentBatchActive(bool active) public {
        _onlySigner();
        _currentBatch.active = active;
    }

    function setTxFee(uint256 amount) public {
        _onlySigner();
        _txFeeAmount = amount;
    }

    function setPaymentToken(address token) public {
        _onlySigner();
        _paymentToken = token;
    }

    function setFeeCollector(address collector) public {
        _onlySigner();
        _feeCollector = collector;
    }

    function setFreeParticipantController(
        address freeParticipantController,
        bool allow
    ) public {
        _onlySigner();
        freeParticipantControllers[freeParticipantController] = allow;
    }

    function setFreeParticipant(address participant, bool free) public {
        _onlySigner();
        freeParticipant[participant] = free;
    }

    function mintAsFreeMinter(uint256 quantity) public {
        if (_currentBatch.quantity <= 0) {
            revert TransactionFailed("NoMoreTokensLeft");
        }
        if (!_currentBatch.active) {
            revert TransactionFailed("CurrentBatchNotActive");
        }
        if (quantity <= 0) {
            revert TransactionFailed("QuantityMustBeAboveZero");
        }

        if (quantity >= _maxBuyAmount && !hasRole(SIGNER_ROLE, _msgSender())) {
            revert TransactionFailed("MaxBuyAmountLimitReached");
        }

        if (!freeParticipant[_msgSender()]) {
            revert TransactionFailed("MustBeAFreeMinter");
        }

        // check enough left to mint
        _currentBatch.quantity = (_currentBatch.quantity - quantity);
        _safeMint(_msgSender(), quantity);
    }
   
}
