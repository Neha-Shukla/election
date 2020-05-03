pragma solidity >=0.4.21 <0.7.0;

contract Election{
    //model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    //store voters
    mapping(address => bool) public voters;
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
    event votedEvent (
        uint indexed _candidateId
    );
    function vote(uint _candidateId) public{
        // require that they haven't voted before
        require(!voters[msg.sender], "already voted");

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "not a valid candidate");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        emit votedEvent(_candidateId);
    }
}