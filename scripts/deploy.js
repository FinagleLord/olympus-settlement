// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  const OrderBook = await hre.ethers.getContractFactory("OrderBook");
  const orderBook = await OrderBook.deploy("Hello, Hardhat!");

  await orderBook.deployed();
  console.log("Order book deployed to:", orderBook.address);
  const Settlement = await hre.ethers.getContractFactory("Settlement");
  const settlement = await Settlement.deploy("Hello, Hardhat!");

  await settlement.deployed();

  console.log("Settlement deployed to:", settlement.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
