// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;
import "./ERC998ERC721BottomUp.sol";

contract TestContract {
    address public owner;
    bytes32 public constant ERC998_MAGIC_VALUE = bytes32(uint256(3446934965));

    constructor() public {
        owner = msg.sender;
    }

    bytes32 public value = ERC998_MAGIC_VALUE << 224;

    function get() external view returns (bytes32) {
        return value | bytes32(uint256(uint160(owner)));
    }

    function getA() external view returns (bytes4) {
        // return
        //     bytes4(0x00fdd58e) ^
        //     bytes4(0x6352211e) ^
        //     bytes4(0x43a61a8e) ^
        //     bytes4(0x095ea7b3) ^
        //     bytes4(0x081812fc) ^
        //     bytes4(0xa22cb465) ^
        //     bytes4(0xe985e9c5) ^
        //     bytes4(0x23b872dd) ^
        //     bytes4(0x42842e0e) ^
        //     bytes4(0xb88d4fde);
        return ERC998ERC721BottomUp.ownerOf.selector;
    }
}
