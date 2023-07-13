// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Token {
    // Token metadata
    string public name;    // Name of the token
    string public symbol;  // Symbol of the token
    uint256 public totalSupply;  // Total supply of the token

    // Owner of the contract
    address public owner;

    // Mapping to store token balances of addresses
    mapping(address => uint256) public balances;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);  // Event emitted on token transfer
    event Burn(address indexed from, uint256 value);  // Event emitted when tokens are burned
    event Mint(address indexed to, uint256 value);  // Event emitted when new tokens are minted

    // Constructor
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        owner = msg.sender;
        balances[msg.sender] = _totalSupply;  // Assign total supply to contract owner's balance
    }

    // Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    // Transfer tokens from sender's address to the specified address
    function transfer(address _to, uint256 _value) public {
        require(_to != address(0), "Invalid address");
        require(_value <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _value;  // Deduct tokens from sender's balance
        balances[_to] += _value;  // Add tokens to the recipient's balance

        emit Transfer(msg.sender, _to, _value);  // Emit transfer event
    }

    // Burn tokens from the sender's address
    function burn(uint256 _value) public {
        require(_value <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= _value;  // Deduct tokens from sender's balance
        totalSupply -= _value;  // Deduct tokens from total supply

        emit Burn(msg.sender, _value);  // Emit burn event
        emit Transfer(msg.sender, address(0), _value);  // Emit transfer event to zero address (burned tokens)
    }

    // Mint new tokens and assign them to the specified address
    function mint(address _to, uint256 _value) public onlyOwner {
        require(_to != address(0), "Invalid address");

        balances[_to] += _value;  // Add tokens to the recipient's balance
        totalSupply += _value;  // Increase total supply

        emit Mint(_to, _value);  // Emit mint event
        emit Transfer(address(0), _to, _value);  // Emit transfer event from zero address (minted tokens)
    }
}
