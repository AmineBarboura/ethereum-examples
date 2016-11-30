/*
   WolframAlpha example

   This contract sends a temperature measure request to WolframAlpha
*/


pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract WolframAlpha is usingOraclize {
    
    string public temperature;
    
    event newOraclizeQuery(string description);
    event newTemperatureMeasure(uint temperature);

    function WolframAlpha() {
        update();
    }
    
    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        newTemperatureMeasure(result);
        // do something with the temperature measure..
    }
    
    function update() payable {
        newOraclizeQuery("Oraclize query was sent, standying by for the answer..");
        oraclize_query("WolframAlpha", "temperature in London");
    }
    
} 
                                           