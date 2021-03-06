require_relative './spec_helper'

describe Player do

  #player1 = Player.new("X")
  #player2 = Player.new("O")
  let(:player1) {Player.new("X")}
  let(:player2) {Player.new("O")}


  describe "#new" do
    it "Applies the proper game piece" do
      expect(player1.piece).to eql("X")
      expect(player2.piece).to eql("O")
    end
  end

  describe "#increase_score" do
    it "increases score by 1" do
      temp = player1.score
      player1.increase_score
      expect(player1.score).to eql(temp + 1)
    end
  end

  describe "#reset_score" do
    it "score is zero" do
      player1.score = 1
      player1.reset_score
      expect(player1.score).to eql(0)
    end
  end

end
