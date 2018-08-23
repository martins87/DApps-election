var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
  it("initializes two candidates", function() {
    return Election.deployed().then(function(instance) {
      return instance.candidatesCount();
    }).then(function(count) {
      assert.equal(count, 2);
    });
  });

  it("initializes the candidates with the correct values", function() {
    return Election.deployed().then(function(instance) {
      electionInstance = instance;
      return electionInstance.candidates(1);
    }).then(function(candidate) {
      assert.equal(candidate[0], 1, "corrects correct id");
      assert.equal(candidate[1], "Jair Bolsonaro", "contains correct name");
      assert.equal(candidate[2], 0, "contains correct votes number");
      return electionInstance.candidates(2);
    }).then(function(candidate) {
      assert.equal(candidate[0], 2, "contains correct id");
      assert.equal(candidate[1], "João Amoedo", "contains correct name");
      assert.equal(candidate[2], 0, "contains correct votes number");
    });
  }

  );
});
