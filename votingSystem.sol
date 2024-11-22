// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Election{
    struct Candidate{
        string nameOfCandidate;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    mapping (string => uint256) nameToVoteCount;

    //function to add a candidate to the list of candidates
    function addCandidate(string memory _name) public {
        require(nameToVoteCount[_name] == 0, "This candidate already exists");
        candidates.push(Candidate(_name, 0));
        nameToVoteCount[_name] = candidates.length;
    }

    //function to increase voteCount of a candidate 
    function Vote(string memory name1) public {
        uint256 index = nameToVoteCount[name1];
        require(index >0, "This Candidate already exists");
        candidates[index-1].voteCount +=1;
    }

    //function to get the totalVotes of a certain candidate
    function getTotalVotes(string memory name2) public view 
    returns(uint256){
        require(nameToVoteCount[name2] > 0, "This candidate does not exist");
        uint256 index1 = nameToVoteCount[name2] -1;
        return (candidates[index1].voteCount);
    }
        
}
