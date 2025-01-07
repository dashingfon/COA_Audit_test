import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { deployLocalContractFixture } from "../fixtures";
import {  tokenToWei, weiToToken } from "../functions";



describe('DEPLOY CONTRACTS', () => {



  describe('SET REQUIRED PROPERTIES', () => {

    it('user should migrate his genesis token successfully and recieve version 2', async () => {
      const { user1, migrator, acreATL, plotATL, yardATL, acreATLV2, plotATLV2, yardATLV2, user1Address ,migratorAddress} = await loadFixture(deployLocalContractFixture);
      const user1Acre = [0, 1, 2, 3];
      const user1Plot = [0, 1, 2, 3];
      const user1Yard = [0, 1, 2, 3];
      await migrator.connect(user1).migrateAllAsset(user1Acre, user1Plot, user1Yard);
      expect(await acreATLV2.balanceOf(user1Address)).equal(4);
      expect(await plotATLV2.balanceOf(user1Address)).equal(4);
      expect(await yardATLV2.balanceOf(user1Address)).equal(4);
      //confirm user migrated the nft
      for (let x = 0; x < user1Acre.length; x++) {
        const id = user1Acre[x];
        expect(await acreATLV2.ownerOf(id)).equal(user1Address);
        expect(await plotATLV2.ownerOf(id)).equal(user1Address);
        expect(await yardATLV2.ownerOf(id)).equal(user1Address);
      }
      for (let x = 0; x < user1Acre.length; x++) {
        const id = user1Acre[x];
        expect(await acreATL.ownerOf(id)).equal(migratorAddress);
        expect(await plotATL.ownerOf(id)).equal(migratorAddress);
        expect(await yardATL.ownerOf(id)).equal(migratorAddress);
      }
    });

    it('user should migrate token', async () => {
      const { user1, prlz, migrator, usdt, user1Address,migratorAddress } = await loadFixture(deployLocalContractFixture);
      const user1BusdBalance = parseFloat(weiToToken(await usdt.balanceOf(user1Address)));
      const migratorPrlzBalance = parseFloat(weiToToken(await prlz.balanceOf(migratorAddress)));
      await migrator.connect(user1).migrateERC20Token(tokenToWei(`${user1BusdBalance}`),await usdt.getAddress(),await prlz.getAddress());
      expect(await usdt.balanceOf(user1Address)).equal(0);
      expect(await usdt.balanceOf(migratorAddress)).equal(tokenToWei(`${user1BusdBalance}`));
      expect(await prlz.balanceOf(user1Address)).equal(tokenToWei(`${user1BusdBalance}`));
      expect(await prlz.balanceOf(migratorAddress)).equal(tokenToWei(`${migratorPrlzBalance - user1BusdBalance}`));
    });
  });
});