require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("chocolate", 12, chef) }


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("chocolate")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients.empty?).to eq(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("flan", "17", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("banana")
      expect(dessert.ingredients).to include("banana")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("banana")
      dessert.add_ingredient("strawberry")
      dessert.add_ingredient("love")
      dessert.add_ingredient("vanilla")
      dessert.add_ingredient("sugar")
      original_order = dessert.ingredients.map { |ingredient| ingredient }
      dessert.mix!
      expect(dessert.ingredients).to_not eq(original_order)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1) 
      expect(dessert.quantity).to eq(11)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(13) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
