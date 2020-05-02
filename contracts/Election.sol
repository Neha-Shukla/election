pragma solidity >=0.4.21 <0.7.0;
contract Election{
    //model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    //store candidate
    //fetch candidate
    mapping(uint => Candidate) public candidates;
    // store Candidates count
    uint public candidatesCount;
    constructor() public{
        addCandidate("Candidate1");
        addCandidate("Candidate2");
    }
    function addCandidate(string memory _name ) private{
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }
}