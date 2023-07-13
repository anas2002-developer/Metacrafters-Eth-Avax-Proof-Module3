# Token

Token is a Solidity smart contract that represents a custom token on a local HardHat network. This contract allows the contract owner to mint tokens, and any user to transfer and burn tokens.

## Functionality

The Token contract provides the following functionality:

- Creation of a new token on a local HardHat network.
- Only the contract owner can mint tokens.
- Any user can transfer tokens.
- Any user can burn tokens.

## Getting Started

To use the Token contract, follow these steps:

1. Set up a local HardHat network. You can refer to the HardHat documentation for installation and configuration instructions.

2. Connect the local HardHat network to Remix IDE. Ensure that Remix is connected to the appropriate network by selecting the appropriate network in the Remix interface.

3. Compile the Token contract in Remix. Open the Token.sol file in Remix and click on the "Compile Token.sol" button to compile the contract.

4. Deploy the Token contract on the local HardHat network. In the "Deploy & Run Transactions" tab in Remix, select the local HardHat network as the deployment environment. Enter the desired values for the token's name, symbol, and total supply. Click the "Deploy" button to deploy the contract. Note the deployed contract address for future reference.

5. Interact with the contract using the Remix interface. As the contract owner, you can use the "mint" function to create new tokens for a specified address. Any user can use the "transfer" function to transfer tokens to another address, and they can also use the "burn" function to burn their own tokens.

## Contract Functions

### `transfer(address _to, uint256 _value)`

Transfers tokens from the caller's address to the specified address.

Parameters:
- `_to`: The address to which the tokens will be transferred.
- `_value`: The amount of tokens to transfer.

### `burn(uint256 _value)`

Burns the caller's own tokens, reducing both their balance and the total supply.

Parameters:
- `_value`: The amount of tokens to burn.

### `mint(address _to, uint256 _value)`

Mints new tokens and assigns them to the specified address. Only the contract owner can call this function.

Parameters:
- `_to`: The address to which the tokens will be minted.
- `_value`: The amount of tokens to mint.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
