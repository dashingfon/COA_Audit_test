// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC721A.sol";
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract ATLYARD is ERC721A, Ownable {
    constructor(address paymentToken) ERC721A("ATL Yard", "yATL") {
        _paymentToken = paymentToken;
        _feeCollector = msg.sender;
        _txFeeAmount = 0;
        _maxBuyAmount = 10;
    }

    struct Batch {
        uint256 quantity;
        uint256 price;
        bool active;
    }

    address public _paymentToken;
    address public _feeCollector;
    Batch public _currentBatch;
    uint256 _txFeeAmount;
    uint256 _maxBuyAmount;
    string private baseUri = 'https://sidekickfinance.mypinata.cloud/ipfs/QmVRVjmmK5bDJdpSXAyZ4iqQsR5q7w4tyDPTqhV21UiYTM';
    mapping (address => bool) public freeParticipantControllers;
    mapping (address => bool) public freeParticipant;

    event NewBatchCreated(uint256 batchStartIndex);

    function _baseURI() internal view virtual override returns (string memory) { 
        return baseUri;
    }

    function setBaseURI (string memory newUri) public onlyOwner {
        baseUri = newUri;
    }

    function mint(uint256 quantity) public {
        require(_currentBatch.quantity > 0, "No more tokens left to mint");
        require(_currentBatch.active, "Current Batch is not active");
        require(quantity > 0, "Quantity must be greater than zero");
        require(quantity <= _maxBuyAmount || msg.sender == owner(), "Max buy amount limit hit");

        if (!freeParticipant[msg.sender]) {
            //require msg.sender is passed into _pay
            require(_pay(msg.sender, quantity), "Must pay minting fee");
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
        IERC20 token = IERC20(_paymentToken);
        token.transferFrom(
            payee,
            _feeCollector,
            _currentBatch.price * quantity
        );
        return true;
    }

    function _tax(address payee) internal virtual returns (bool) {
        IERC20 token = IERC20(_paymentToken);
        token.transferFrom(payee, _feeCollector, _txFeeAmount);
        return true;
    }

    function setCurrentBatch(
        uint256 quantity,
        uint256 price,
        bool active
    ) public onlyOwner {
        require(_currentBatch.quantity == 0, 'Current batch not finished.');

        _currentBatch.quantity = quantity;
        _currentBatch.active = active;
        _currentBatch.price = price;

        emit NewBatchCreated(_currentIndex);
    }

    function setCurrentBatchActive(bool active) public onlyOwner {
        _currentBatch.active = active;
    }

    function setTxFee(uint256 amount) public onlyOwner {
        _txFeeAmount = amount;
    }

    function setPaymentToken(address token) public onlyOwner {
        _paymentToken = token;
    }

    function setFeeCollector(address collector) public onlyOwner {
        _feeCollector = collector;
    }
    
    function setFreeParticipantController(address freeParticipantController, bool allow) public onlyOwner
    {
        freeParticipantControllers[freeParticipantController] = allow;
    }

    function setFreeParticipant(address participant, bool free) public onlyOwner
    {
        freeParticipant[participant] = free;
    }

}