---
title: If / Else - Control Structures
short_title: If / Else
date: 2017/10/23
category: solidity
ethfiddle: 'mpKOYpbX9f'
brief: '      if (value == 8) {
        return 80;  ...'
---


Branching with if and else in solidity is straight-forward.
<textarea class="invisible">
 pragma solidity ^0.4.18;
  contract IfElseExample {
    function set(uint _value) public {
      value = _value;
    }

    function changeNum() public constant returns (uint) {
      if (value == 8) {
        return 80;
      } else if(value == 7) {
        return 70;
      } else {
        //Use the ternary operator for brevity
        return  value == 6 ? 60 : value;
      }
    }

    uint value;
  }
</textarea>
There is also a ternary in Solidity, so you can use that to simplify statements.  See the example to the right with the '?' to the right "value == 6 ? 60 : value;" . You can do the entire if else on one line.
<br/>
<!--
Next example: Switch.
-->