# Olympus Settlement

This repository contains solidity contracts to enable **limit orders** for Olympus.

## Overview

Contracts in this repo help you submit a limit order with a lower price than what it is now. Later, when the price gets lower enough to meet the requirement of your order, it gets settled.


## Contracts
Limit orders on Olympus work in a completely decentralized manner, without the need of any centralized authority. The system consists of two contracts: OrderBook and Settlement.

### OrderBook

`OrderBook` keeps limit orders that users have submitted. Anyone can call `createOrder()` to create a limit order with the amount to sell and the minimum price. He/she needs to approve the amount to sell for the `Settlement` contract.

To reduce users' gas fee, OrderBook isn't deployed on the mainnet. The one on **kovan** testnet is used for production.

### Settlement

`Settlement` is in charge of swapping tokens for Bonds. Anyone can call `fillOrder()` to fill the order submitted. We'll call this caller a 'relayer'. Relayers need to call it with proper parameters to meet the minimum price requirement set in the order. If the call is successful, fee will be transferred to the relayer.

The maker of an order can cancel it with `cancelOrder()` on `Settlement`.

It is possible to fill only a certain amount of tokens, not all. In most cases, submitted orders will reside on the `OrderBook` and their amount will be filled by different callers in different blocks.

## Incentives
### Relayer
`Settlement` is a wrapper contract around `UniswapV2Router02`. Every function in this contract has a duplicated version in the `Settlement` with an extra parameter `args`. If `args` is not empty, it is used for filling orders; see `Settlement.fillOrders()` for details.

So, users for Olympus can choose to be a relayer or not. If he/she decided to do so, calling any swap functions in `Settlement` will benefit them. Otherwise, he/she can just call functions in `UniswapV2Router02` without receiving any fee.

## Sushiswap's Audits
* [Quatstamp Audit Report](https://gist.github.com/RideSolo/0ab28f3be1d981114d5727cafd6c7afc)
* [Peckshield Audit Report](audits/PeckShield-Audit-BentoBox-v1.0.pdf)

## License
WTFPL
