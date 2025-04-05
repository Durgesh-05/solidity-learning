// SPDX-License-Identifier: MIT
// Before Righting any sc we always add solidity version 
// '^' represent we can work with this version or greater than it
pragma solidity ^0.8.18; 

// Contract term represent whatever we are going to write in a sc

contract SimpleStorage {
    // There are mulliple types of variables in solidity
    // some are boolean, uint, int , string, address, bytes, etc
    // Here we are using uint which is unsigned integer
    // after variable type we have to use access modifiers like public, private, internal, external. external is for functions 
    // every function which change the state of sc will require gas during transaction in this case getFavouriteNumber()
    // is not changing state so it will not require gas

    uint256 public favouriteNumber;

    // function syntax -> function fn_name (parameter) access_modifiers { code }
    // if function returns something -> function fn_name (parameter) access_modifiers returns (parameter_to_return ) { code }

    function getFavouriteNumber (uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
        // This requires gas
    }

    function retreiveFavouriteNumber () public  view  returns(uint256) {
        return  favouriteNumber;
        // This doesnt require gas
        // We write view keyword because we access this state variable inside the contract which is favouriteNumber
    }

    // We use struct to create own complex types
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public friendList;

    mapping (string => uint256) public nameTofavouriteNumber;
    // it goes with the name map => it acts like a object we search for key and it gives value 
    // default value of key in a map is 0

    function addFriend(uint256 _favouriteNumber, string memory _name) public {
        friendList.push(Person(_favouriteNumber,_name));
        nameTofavouriteNumber[_name] = _favouriteNumber;
    }

    // memory, calldata,storage, etc are some places where evm can read and write from;
    // memory and calldata are temporary, major types get automatically assigned to memory
    // but for struct, array and mapppings we have to add explicit memory keyword
    // diff in memory and calldata is memory variable can be modified but calldata variable cannot
    // whatever variable is declared outside of fn like favouriteNumber they automatically converted to storage
     
}

