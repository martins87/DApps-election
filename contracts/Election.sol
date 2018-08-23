pragma solidity ^0.4.24;

contract Election {

  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping (uint => Candidate) public candidates;

  uint public candidatesCount;

  constructor() public {
    addCandidate("Jair Bolsonaro");
    addCandidate("João Amoedo");
  }

  function addCandidate(string _name) private {
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

}
