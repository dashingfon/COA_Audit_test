# Slither Report

[Slither Raw Output](../slither_output.json)

### High Impact | High Confidence 

[ATLYARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L66-L73) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L71-L72)
### High Impact | High Confidence 

[PLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L109-L116) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L115-L116)
### High Impact | High Confidence 

[ACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L108-L115) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L114-L115)
### High Impact | High Confidence 

[ATLPLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L61-L68) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L66-L67)
### High Impact | High Confidence 

[ATLACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L67-L74) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L72-L73)
### High Impact | High Confidence 

[YARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L113-L120) uses arbitrary from in transferFrom: [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L119-L120)
### High Impact | Medium Confidence 

[ATLPLOT._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L49-L61) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L56-L60)
### High Impact | Medium Confidence 

[PLOT._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L98-L108) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L105-L107)
### High Impact | Medium Confidence 

[ATLPLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L61-L68) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L66-L67)
### High Impact | Medium Confidence 

[YARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L113-L120) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L119-L120)
### High Impact | Medium Confidence 

[PLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L109-L116) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L115-L116)
### High Impact | Medium Confidence 

[ATLYARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L66-L73) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L71-L72)
### High Impact | Medium Confidence 

[ATLACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L67-L74) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L72-L73)
### High Impact | Medium Confidence 

[ACRE._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L97-L108) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L104-L106)
### High Impact | Medium Confidence 

[YARD._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L101-L112) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L107-L111)
### High Impact | Medium Confidence 

[ATLACRE._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L53-L67) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L62-L66)
### High Impact | Medium Confidence 

[ATLYARD._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L53-L66) ignores return value by [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L61-L65)
### High Impact | Medium Confidence 

[ACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L108-L115) ignores return value by [token.transferFrom(payee,_feeCollector,_txFeeAmount)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L114-L115)
### Medium Impact | Medium Confidence 

Reentrancy in [PLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L71-L98):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L90-L91)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L105-L107)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L93-L97)
	[PLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L29-L30) can be used in cross function reentrancies:
	- [PLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L29-L30)
	- [PLOT._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L98-L108)
	- [PLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L71-L98)
	- [PLOT.mintAsFreeMinter(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L165-L189)
	- [PLOT.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L116-L134)
	- [PLOT.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L134-L137)
### Medium Impact | Medium Confidence 

Reentrancy in [ERC721A._mint(address,uint256,bytes,bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L427-L481):
	External calls:
	- [! _checkContractOnERC721Received(address(0),to,updatedIndex ++,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L462-L467)
		- [retval = IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L635-L648)
	State variables written after the call(s):
	- [_currentIndex = updatedIndex](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L478-L479)
	[ERC721A._currentIndex](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L76-L80) can be used in cross function reentrancies:
	- [ERC721A.ERC721A_Initialize(string,string)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L102-L107)
	- [ERC721A._exists(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L395-L402)
	- [ERC721A._transfer(address,address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L488-L539)
	- [ERC721A.ownershipOf(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L199-L225)
	- [ERC721A.totalSupply()](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L122-L127)
### Medium Impact | Medium Confidence 

Reentrancy in [YARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L73-L101):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L93-L94)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L107-L111)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L96-L100)
	[YARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L29-L30) can be used in cross function reentrancies:
	- [YARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L29-L30)
	- [YARD._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L101-L112)
	- [YARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L73-L101)
	- [YARD.mintAsFreeMinter(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L170-L194)
	- [YARD.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L120-L139)
	- [YARD.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L139-L142)
### Medium Impact | Medium Confidence 

Reentrancy in [ERC721A._mint(address,uint256,bytes,bool)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L361-L408):
	External calls:
	- [! _checkContractOnERC721Received(address(0),to,updatedIndex ++,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L394-L397)
		- [retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L549-L559)
	State variables written after the call(s):
	- [_currentIndex = updatedIndex](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L406)
	[ERC721A._currentIndex](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L69-L72) can be used in cross function reentrancies:
	- [ERC721A._exists(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L328-L336)
	- [ERC721A._transfer(address,address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L414-L465)
	- [ERC721A.constructor(string,string)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L94-L97)
	- [ERC721A.ownershipOf(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L185-L206)
	- [ERC721A.totalSupply()](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L112-L116)
### Medium Impact | Medium Confidence 

Reentrancy in [ATLACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L38-L53):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L48-L49)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L62-L66)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L50-L53)
	[ATLACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L23-L24) can be used in cross function reentrancies:
	- [ATLACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L23-L24)
	- [ATLACRE._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L53-L67)
	- [ATLACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L38-L53)
	- [ATLACRE.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L74-L87)
	- [ATLACRE.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L87-L92)
### Medium Impact | Medium Confidence 

Reentrancy in [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])](v1-migrator/contracts/Migrator.sol#L206-L257):
	External calls:
	- [_withdrawOldNFT(Requirements.acre,_acre[i])](v1-migrator/contracts/Migrator.sol#L223-L225)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.plot,_plot[i_scope_0])](v1-migrator/contracts/Migrator.sol#L235-L236)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.yard,_yard[i_scope_1])](v1-migrator/contracts/Migrator.sol#L248-L249)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.yard,Requirements.yardV2,_msgSender(),_yard.length,_yard)](v1-migrator/contracts/Migrator.sol#L250-L257)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	State variables written after the call(s):
	- [_mintNewNFT(Requirements.yard,Requirements.yardV2,_msgSender(),_yard.length,_yard)](v1-migrator/contracts/Migrator.sol#L250-L257)
		- [lastAssetIdMinted[_nft2] = newLastMintedID](v1-migrator/contracts/Migrator.sol#L125-L126)
	[Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29) can be used in cross function reentrancies:
	- [Migrator._mintNewNFT(address,address,address,uint256,uint256[])](v1-migrator/contracts/Migrator.sol#L92-L128)
	- [Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29)
### Medium Impact | Medium Confidence 

Reentrancy in [ACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L70-L97):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L89-L90)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L104-L106)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L92-L96)
	[ACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L28-L29) can be used in cross function reentrancies:
	- [ACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L28-L29)
	- [ACRE._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L97-L108)
	- [ACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L70-L97)
	- [ACRE.mintAsFreeMinter(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L164-L190)
	- [ACRE.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L115-L133)
	- [ACRE.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L133-L136)
### Medium Impact | Medium Confidence 

Reentrancy in [ATLYARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L38-L53):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L48-L49)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L61-L65)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L50-L53)
	[ATLYARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L23-L24) can be used in cross function reentrancies:
	- [ATLYARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L23-L24)
	- [ATLYARD._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L53-L66)
	- [ATLYARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L38-L53)
	- [ATLYARD.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L73-L86)
	- [ATLYARD.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L86-L91)
### Medium Impact | Medium Confidence 

Reentrancy in [ATLPLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L33-L48):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L43-L44)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L56-L60)
	State variables written after the call(s):
	- [_currentBatch.quantity = (_currentBatch.quantity - quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L46-L48)
	[ATLPLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L23-L24) can be used in cross function reentrancies:
	- [ATLPLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L23-L24)
	- [ATLPLOT._pay(address,uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L49-L61)
	- [ATLPLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L33-L48)
	- [ATLPLOT.setCurrentBatch(uint256,uint256,bool)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L68-L81)
	- [ATLPLOT.setCurrentBatchActive(bool)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L81-L86)
### Medium Impact | Medium Confidence 

Reentrancy in [Migrator._mintNewNFT(address,address,address,uint256,uint256[])](v1-migrator/contracts/Migrator.sol#L92-L128):
	External calls:
	- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
	- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
	- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	State variables written after the call(s):
	- [lastAssetIdMinted[_nft2] = newLastMintedID](v1-migrator/contracts/Migrator.sol#L125-L126)
	[Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29) can be used in cross function reentrancies:
	- [Migrator._mintNewNFT(address,address,address,uint256,uint256[])](v1-migrator/contracts/Migrator.sol#L92-L128)
	- [Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29)
### Medium Impact | Medium Confidence 

Reentrancy in [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])](v1-migrator/contracts/Migrator.sol#L206-L257):
	External calls:
	- [_withdrawOldNFT(Requirements.acre,_acre[i])](v1-migrator/contracts/Migrator.sol#L223-L225)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.plot,_plot[i_scope_0])](v1-migrator/contracts/Migrator.sol#L235-L236)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	State variables written after the call(s):
	- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
		- [lastAssetIdMinted[_nft2] = newLastMintedID](v1-migrator/contracts/Migrator.sol#L125-L126)
	[Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29) can be used in cross function reentrancies:
	- [Migrator._mintNewNFT(address,address,address,uint256,uint256[])](v1-migrator/contracts/Migrator.sol#L92-L128)
	- [Migrator.lastAssetIdMinted](v1-migrator/contracts/Migrator.sol#L28-L29)
### Medium Impact | Medium Confidence 

[Migrator._mintNewNFT(address,address,address,uint256,uint256[]).newLastMintedID](v1-migrator/contracts/Migrator.sol#L107) is a local variable never initialized
### Medium Impact | Medium Confidence 

[Migrator._mintNewNFT(address,address,address,uint256,uint256[]).counter](v1-migrator/contracts/Migrator.sol#L108) is a local variable never initialized
### Medium Impact | Medium Confidence 

[Migrator._mintNewNFT(address,address,address,uint256,uint256[]).quantityMinted](v1-migrator/contracts/Migrator.sol#L105-L106) is a local variable never initialized
### Low Impact | Medium Confidence 

[ATLYARD.setTxFee(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L91-L94) should emit an event for: 
	- [_txFeeAmount = amount](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L92-L93) 
### Low Impact | Medium Confidence 

[ATLACRE.setTxFee(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L92-L95) should emit an event for: 
	- [_txFeeAmount = amount](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L93-L94) 
### Low Impact | Medium Confidence 

[ATLPLOT.setTxFee(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L86-L90) should emit an event for: 
	- [_txFeeAmount = amount](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L87-L88) 
### Low Impact | Medium Confidence 

[ATLYARD.constructor(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L9) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L9-L10)
### Low Impact | Medium Confidence 

[YARD.initialize(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L40-L42) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L44)
### Low Impact | Medium Confidence 

[ACRE.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L142-L144) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L145)
### Low Impact | Medium Confidence 

[ACRE.initialize(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L39-L41) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L43)
### Low Impact | Medium Confidence 

[ATLYARD.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L99) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L100-L102)
### Low Impact | Medium Confidence 

[PLOT.initialize(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L40-L42) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L44)
### Low Impact | Medium Confidence 

[ACRE.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L147-L149) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L150-L151)
### Low Impact | Medium Confidence 

[ATLACRE.constructor(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L9) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L9-L10)
### Low Impact | Medium Confidence 

[ATLACRE.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L96) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L97-L98)
### Low Impact | Medium Confidence 

[ATLYARD.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L95) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L96-L97)
### Low Impact | Medium Confidence 

[YARD.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L152-L155) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L155-L156)
### Low Impact | Medium Confidence 

[ATLACRE.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L100) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L101-L102)
### Low Impact | Medium Confidence 

[PLOT.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L148-L150) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L150-L152)
### Low Impact | Medium Confidence 

[ATLPLOT.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L90) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L91-L93)
### Low Impact | Medium Confidence 

[ATLPLOT.constructor(address).paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L9) lacks a zero-check on :
		- [_paymentToken = paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L9-L10)
### Low Impact | Medium Confidence 

[PLOT.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L143-L145) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L146)
### Low Impact | Medium Confidence 

[YARD.setPaymentToken(address).token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L147-L150) lacks a zero-check on :
		- [_paymentToken = token](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L150-L151)
### Low Impact | Medium Confidence 

[ATLPLOT.setFeeCollector(address).collector](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L94) lacks a zero-check on :
		- [_feeCollector = collector](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L95-L98)
### Low Impact | Medium Confidence 

[Migrator._withdrawOldNFT(address,uint256)](v1-migrator/contracts/Migrator.sol#L69-L90) has external calls inside a loop: [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
### Low Impact | Medium Confidence 

[Migrator._withdrawOldNFT(address,uint256)](v1-migrator/contracts/Migrator.sol#L69-L90) has external calls inside a loop: [isApproved = ICollectible(_nft1).isApprovedForAll(_msgSender(),address(this))](v1-migrator/contracts/Migrator.sol#L80-L83)
### Low Impact | Medium Confidence 

[Migrator._withdrawOldNFT(address,uint256)](v1-migrator/contracts/Migrator.sol#L69-L90) has external calls inside a loop: [isSenderNftOwner = ICollectible(_nft1).ownerOf(_tokenId)](v1-migrator/contracts/Migrator.sol#L76-L78)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator.migrateERC20Token(uint256,address,address)](v1-migrator/contracts/Migrator.sol#L131-L205):
	External calls:
	- [success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(_msgSender(),address(this),_amount)](v1-migrator/contracts/Migrator.sol#L182-L186)
	- [success = IERC20Upgradeable(Requirements.tokenV2).transfer(_msgSender(),_amount)](v1-migrator/contracts/Migrator.sol#L188-L193)
	State variables written after the call(s):
	- [tokensMigrated[_token1] += _amount](v1-migrator/contracts/Migrator.sol#L195)
	- [tokensMigrated[_token2] += tokenBToRecieve](v1-migrator/contracts/Migrator.sol#L196-L198)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])](v1-migrator/contracts/Migrator.sol#L206-L257):
	External calls:
	- [_withdrawOldNFT(Requirements.acre,_acre[i])](v1-migrator/contracts/Migrator.sol#L223-L225)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.plot,_plot[i_scope_0])](v1-migrator/contracts/Migrator.sol#L235-L236)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.yard,_yard[i_scope_1])](v1-migrator/contracts/Migrator.sol#L248-L249)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.yard,Requirements.yardV2,_msgSender(),_yard.length,_yard)](v1-migrator/contracts/Migrator.sol#L250-L257)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	Event emitted after the call(s):
	- [NFTMigrationCompleted(_user,_nft1,_nft2,_nfts[counter],index,block.timestamp)](v1-migrator/contracts/Migrator.sol#L115-L120)
		- [_mintNewNFT(Requirements.yard,Requirements.yardV2,_msgSender(),_yard.length,_yard)](v1-migrator/contracts/Migrator.sol#L250-L257)
### Low Impact | Medium Confidence 

Reentrancy in [PLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L71-L98):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L90-L91)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L105-L107)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L97-L98)
		- [retval = IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L635-L648)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L459-L461)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L97-L98)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L475-L477)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L97-L98)
### Low Impact | Medium Confidence 

Reentrancy in [ATLACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L38-L53):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L48-L49)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L62-L66)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L53)
		- [retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L549-L559)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L393-L394)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L53)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L405)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L53)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])](v1-migrator/contracts/Migrator.sol#L206-L257):
	External calls:
	- [_withdrawOldNFT(Requirements.acre,_acre[i])](v1-migrator/contracts/Migrator.sol#L223-L225)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	Event emitted after the call(s):
	- [NFTMigrationCompleted(_user,_nft1,_nft2,_nfts[counter],index,block.timestamp)](v1-migrator/contracts/Migrator.sol#L115-L120)
		- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator.migrateERC20Token(uint256,address,address)](v1-migrator/contracts/Migrator.sol#L131-L205):
	External calls:
	- [success = IERC20Upgradeable(Requirements.tokenV1).transferFrom(_msgSender(),address(this),_amount)](v1-migrator/contracts/Migrator.sol#L182-L186)
	- [success = IERC20Upgradeable(Requirements.tokenV2).transfer(_msgSender(),_amount)](v1-migrator/contracts/Migrator.sol#L188-L193)
	Event emitted after the call(s):
	- [TokenMigrationCompleted(_msgSender(),Requirements.tokenV1,Requirements.tokenV2,_amount,tokenBToRecieve,block.timestamp)](v1-migrator/contracts/Migrator.sol#L199-L204)
### Low Impact | Medium Confidence 

Reentrancy in [ERC721A._mint(address,uint256,bytes,bool)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L427-L481):
	External calls:
	- [! _checkContractOnERC721Received(address(0),to,updatedIndex ++,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L462-L467)
		- [retval = IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L635-L648)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L459-L461)
### Low Impact | Medium Confidence 

Reentrancy in [YARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L73-L101):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L93-L94)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L107-L111)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L100-L101)
		- [retval = IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L635-L648)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L459-L461)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L100-L101)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L475-L477)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L100-L101)
### Low Impact | Medium Confidence 

Reentrancy in [ACRE.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L70-L97):
	External calls:
	- [! _pay(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L89-L90)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L104-L106)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L96-L97)
		- [retval = IERC721ReceiverUpgradeable(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L635-L648)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L459-L461)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L96-L97)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L475-L477)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L96-L97)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])](v1-migrator/contracts/Migrator.sol#L206-L257):
	External calls:
	- [_withdrawOldNFT(Requirements.acre,_acre[i])](v1-migrator/contracts/Migrator.sol#L223-L225)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.acre,Requirements.acreV2,_msgSender(),_acre.length,_acre)](v1-migrator/contracts/Migrator.sol#L229-L232)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	- [_withdrawOldNFT(Requirements.plot,_plot[i_scope_0])](v1-migrator/contracts/Migrator.sol#L235-L236)
		- [ICollectible(_nft1).transferFrom(_msgSender(),address(this),_tokenId)](v1-migrator/contracts/Migrator.sol#L88-L89)
	- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
		- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
		- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
		- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	Event emitted after the call(s):
	- [NFTMigrationCompleted(_user,_nft1,_nft2,_nfts[counter],index,block.timestamp)](v1-migrator/contracts/Migrator.sol#L115-L120)
		- [_mintNewNFT(Requirements.plot,Requirements.plotV2,_msgSender(),_plot.length,_plot)](v1-migrator/contracts/Migrator.sol#L237-L244)
### Low Impact | Medium Confidence 

Reentrancy in [ATLPLOT.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L33-L48):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L43-L44)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L56-L60)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L48)
		- [retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L549-L559)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L393-L394)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L48)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L405)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L48)
### Low Impact | Medium Confidence 

Reentrancy in [ERC721A._mint(address,uint256,bytes,bool)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L361-L408):
	External calls:
	- [! _checkContractOnERC721Received(address(0),to,updatedIndex ++,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L394-L397)
		- [retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L549-L559)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L393-L394)
### Low Impact | Medium Confidence 

Reentrancy in [ATLYARD.mint(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L38-L53):
	External calls:
	- [require(bool,string)(_pay(msg.sender,quantity),Must pay minting fee)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L48-L49)
		- [token.transferFrom(payee,_feeCollector,_currentBatch.price * quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L61-L65)
	- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L53)
		- [retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L549-L559)
	Event emitted after the call(s):
	- [Transfer(address(0),to,updatedIndex)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L393-L394)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L53)
	- [Transfer(address(0),to,updatedIndex ++)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L405)
		- [_safeMint(msg.sender,quantity)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L53)
### Low Impact | Medium Confidence 

Reentrancy in [Migrator._mintNewNFT(address,address,address,uint256,uint256[])](v1-migrator/contracts/Migrator.sol#L92-L128):
	External calls:
	- [nftObj.mintAsFreeMinter(_quantity)](v1-migrator/contracts/Migrator.sol#L103-L104)
	- [totalSupply = nftObj.totalSupply()](v1-migrator/contracts/Migrator.sol#L104-L105)
	- [nftObj.transferFrom(address(this),_user,index)](v1-migrator/contracts/Migrator.sol#L113-L114)
	Event emitted after the call(s):
	- [NFTMigrationCompleted(_user,_nft1,_nft2,_nfts[counter],index,block.timestamp)](v1-migrator/contracts/Migrator.sol#L115-L120)
### Informational Impact | High Confidence 

[ERC721A._checkContractOnERC721Received(address,address,uint256,bytes)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L627-L648) uses assembly
	- [INLINE ASM](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L644-L647)
### Informational Impact | High Confidence 

[ERC721A._checkContractOnERC721Received(address,address,uint256,bytes)](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L543-L559) uses assembly
	- [INLINE ASM](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L554-L558)
### Informational Impact | Medium Confidence 

[ERC721A._getAux(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L180-L186) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._burn(uint256)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L551-L602) is never used and should be removed
### Informational Impact | Medium Confidence 

[ATLYARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L66-L73) is never used and should be removed
### Informational Impact | Medium Confidence 

[ATLPLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L61-L68) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._numberBurned(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L172-L179) is never used and should be removed
### Informational Impact | Medium Confidence 

[YARD._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L113-L120) is never used and should be removed
### Informational Impact | Medium Confidence 

[ACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L108-L115) is never used and should be removed
### Informational Impact | Medium Confidence 

[ATLACRE._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L67-L74) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._totalMinted()](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L129-L138) is never used and should be removed
### Informational Impact | Medium Confidence 

[PLOT._tax(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L109-L116) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._numberMinted(address)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L164-L171) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._setAux(address,uint64)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L189-L194) is never used and should be removed
### Informational Impact | Medium Confidence 

[ERC721A._baseURI()](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L245-L248) is never used and should be removed
### Informational Impact | High Confidence 

solc-0.5.17 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.
### Informational Impact | High Confidence 

solc-0.6.12 is an outdated solc version. Use a more recent version (at least 0.8.0), if possible.
### Informational Impact | High Confidence 

Parameter [Migrator.setTokenInfo(address,address,uint256)._price](v1-migrator/contracts/Migrator.sol#L315) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLPLOT._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L19-L22) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [ERC721A.safeTransferFrom(address,address,uint256,bytes)._data](v1-migrator/contracts/COA-Contracts/land-nfts/ERC721A.sol#L311-L312) is not in mixedCase
### Informational Impact | High Confidence 

Variable [PLOT._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L25-L28) is not in mixedCase
### Informational Impact | High Confidence 

Variable [YARD._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L25-L28) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L28-L29) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._acre](v1-migrator/contracts/Migrator.sol#L279) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [ERC721A.multiOwnerOf(uint256[],address)._owner](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L237-L238) is not in mixedCase
### Informational Impact | High Confidence 

Variable [PLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L29-L30) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateERC20Token(uint256,address,address)._token2](v1-migrator/contracts/Migrator.sol#L136) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLYARD._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L19-L22) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateERC20Token(uint256,address,address)._token1](v1-migrator/contracts/Migrator.sol#L135-L136) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLACRE._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L22-L23) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])._acre](v1-migrator/contracts/Migrator.sol#L207-L208) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [BUSD.mint(address,uint256)._amount](v1-migrator/contracts/COA-Contracts/Busd.sol#L10) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._plotV2](v1-migrator/contracts/Migrator.sol#L282) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLYARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L23-L24) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setTokenInfo(address,address,uint256)._tokenV1](v1-migrator/contracts/Migrator.sol#L314) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLACRE._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L23-L24) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLPLOT._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L22-L23) is not in mixedCase
### Informational Impact | High Confidence 

Variable [YARD._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L28-L29) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ACRE._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L27-L28) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])._plot](v1-migrator/contracts/Migrator.sol#L209) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateERC20Token(uint256,address,address)._amount](v1-migrator/contracts/Migrator.sol#L132-L134) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._plot](v1-migrator/contracts/Migrator.sol#L280-L281) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLACRE._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L19-L22) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._acreV2](v1-migrator/contracts/Migrator.sol#L281-L282) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [PRLZ.mint(address,uint256)._to](v1-migrator/contracts/COA-Contracts/Prlz.sol#L10) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._yard](v1-migrator/contracts/Migrator.sol#L279) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setTokenInfo(address,address,uint256)._tokenV2](v1-migrator/contracts/Migrator.sol#L314-L315) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLYARD._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L22-L23) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.setERC721Requirements(address,address,address,address,address,address)._yardV2](v1-migrator/contracts/Migrator.sol#L282) is not in mixedCase
### Informational Impact | High Confidence 

Variable [YARD._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts-v2/YARD.sol#L29-L30) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [PRLZ.mint(address,uint256)._amount](v1-migrator/contracts/COA-Contracts/Prlz.sol#L10) is not in mixedCase
### Informational Impact | High Confidence 

Variable [PLOT._feeCollector](v1-migrator/contracts/COA-Contracts/land-nfts-v2/PLOT.sol#L28-L29) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ATLPLOT._currentBatch](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L23-L24) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [Migrator.migrateAllAsset(uint256[],uint256[],uint256[])._yard](v1-migrator/contracts/Migrator.sol#L210) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [BUSD.mint(address,uint256)._to](v1-migrator/contracts/COA-Contracts/Busd.sol#L10) is not in mixedCase
### Informational Impact | High Confidence 

Variable [Migrator.Requirements](v1-migrator/contracts/Migrator.sol#L25-L28) is not in mixedCase
### Informational Impact | High Confidence 

Variable [ACRE._paymentToken](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ACRE.sol#L24-L27) is not in mixedCase
### Informational Impact | High Confidence 

Function [ERC721A.ERC721A_Initialize(string,string)](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L102-L107) is not in mixedCase
### Informational Impact | High Confidence 

Parameter [ERC721A.multiOwnerOf(uint256[],address)._ids](v1-migrator/contracts/COA-Contracts/land-nfts-v2/ERC721A.sol#L236) is not in mixedCase
### Optimization Impact | High Confidence 

[Migrator.totalAcreMigrated](v1-migrator/contracts/Migrator.sol#L31-L32) should be constant 
### Optimization Impact | High Confidence 

[Migrator.totalYardMigrated](v1-migrator/contracts/Migrator.sol#L33-L34) should be constant 
### Optimization Impact | High Confidence 

[Migrator.totalPlotMigrated](v1-migrator/contracts/Migrator.sol#L32-L33) should be constant 
### Optimization Impact | High Confidence 

[ATLACRE._maxBuyAmount](v1-migrator/contracts/COA-Contracts/land-nfts/ACRE.sol#L25-L26) should be immutable 
### Optimization Impact | High Confidence 

[ATLYARD._maxBuyAmount](v1-migrator/contracts/COA-Contracts/land-nfts/YARD.sol#L25-L26) should be immutable 
### Optimization Impact | High Confidence 

[ATLPLOT._maxBuyAmount](v1-migrator/contracts/COA-Contracts/land-nfts/PLOT.sol#L25-L26) should be immutable 
