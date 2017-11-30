---
title: Arrays - Data Structures
short_title: Arrays
date: 2017/10/23
category: solidity
ethfiddle: '8rNRrbW2Wp'
brief: 'bytes32[5] exampleNames;'
---




In Solidity, an array is a numbered sequence of elements of a specific length. There are also dynamically sized arrays. What makes  Ethereum Virtual Machine (EVM) and Solidity different then most languages is it has three areas where it can store items.
<br/>
<br/>
The first is “storage”, where all the contract state variables reside. Every contract has its own storage and it is persistent between function calls and quite expensive to use.
<br/>
<br/>
The second is “memory”, this is used to hold temporary values. It is erased between (external) function calls and is cheaper to use.
<br/>
<br/>
The third one is the stack, which is used to hold small local variables. It is almost free to use, but can only hold a limited amount of values.

<br/>
<br/>
Next example: <a href="/voting/">Voting</a>

<textarea class="invisible">
//Array Examplle from https://soliditycookbook.com/arrays/
  pragma solidity ^0.4.18;
  contract ArrayExamples {
     bytes32[5] exampleNames; // static array
     bytes32[] examples; // dynamic array

    function test() public  {
      //Note the memory keyword explicity states its in memory only
      string[5] memory inlineArray = ["You", "can", "init", "like", "this"];
      uint[][5] memory multidem; // multidimensional array

      examples.push("Matt");
      exampleNames[0] = "Matt";
      return;
    }

  }
</textarea>
