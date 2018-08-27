pragma solidity ^0.4.24;

contract Election {

  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping (uint => Candidate) public candidates;
  mapping (address => bool) public hasAddressVoted;

  uint public candidatesCount;

  constructor() public {
    addCandidate("Jair Bolsonaro");
    addCandidate("João Amoedo");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote(uint _candidateId) public {
    require(
      hasAddressVoted[msg.sender] == false,
      "Address already voted"
    );
    require(
      _candidateId > 0 && _candidateId <= candidatesCount,
      "Invalid candidate ID"
    );

    candidates[_candidateId].voteCount++;
    hasAddressVoted[msg.sender] = true;
  }

}
