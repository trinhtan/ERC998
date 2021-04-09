/** @format */

const { ethers } = require('hardhat');
const { expect } = require('chai');
const { expectRevert, time, ether } = require('@openzeppelin/test-helpers');
const keccak256 = require('keccak256');

describe.only('TestContract', async () => {
  let deployer, marketAdmin, alice, bob;
  let testContract;

  beforeEach(async () => {
    [deployer, marketAdmin, alice, bob] = await ethers.getSigners();

    let TestContract = await ethers.getContractFactory('TestContract');
    testContract = await TestContract.connect(deployer).deploy();

    let ERC998ERC721BottomUp = await ethers.getContractFactory('ERC998ERC721BottomUp');
    console.log(keccak256('rootOwnerOf(uint256)'));
  });

  it('All deploy successfully', async () => {
    console.log('Deployer: ', deployer.address);
    console.log(await testContract.ERC998_MAGIC_VALUE());
    console.log(await testContract.value());
    console.log(await testContract.get());
    console.log(await testContract.getA());
  });
});
