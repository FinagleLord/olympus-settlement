# Olympus Specification Ω

## Limit Order Bonds

___

### Bond Limit Order

An order that is placed while market conditions aren't ideal, that only gets filled if its predefined conditions are met before it's deadline.

___

### Maker

Makers approve `Settlement` then place limit orders using the `Orderbook` contract which is deployed on testnet in order to save gas.

___

### Relayer

A user that fills orders on behalf of makers using the mainet `Settlement` contract. Relayers are incentivised with a fee that is charged to the orders maker upon order execution.

___
