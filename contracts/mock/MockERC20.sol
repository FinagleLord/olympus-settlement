// SPDX-License-Identifier: MIT

pragma solidity =0.8.0;

import "@sushiswap/core/contracts/uniswapv2/libraries/SafeMath.sol";

contract MockERC20 {
    using SafeMathUniswap for uint;

    mapping(address => uint) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals,
        address initialHolder,
        uint initialSupply
    ) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _mint(initialHolder, initialSupply);
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }

    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }

    function _transfer(
        address sender,
        address recipient,
        uint amount
    ) internal {
        require(sender != address( 0 ), "ERC20: transfer from the zero address");
        require(recipient != address( 0 ), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint amount) internal {
        require(account != address( 0 ), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address( 0 ), account, amount);
    }

    function _approve(
        address owner,
        address spender,
        uint amount
    ) internal {
        require(owner != address( 0 ), "ERC20: approve from the zero address");
        require(spender != address( 0 ), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
