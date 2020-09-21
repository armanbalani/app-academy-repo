require 'rspec'
require 'tdd-project'

describe "#my-uniq" do
    subject { [1, 2, 1, 3, 3]}

    it "returns an array with duplicates removed and in the order they first appear" do
        expect(subject.my_uniq).to eq([1, 2, 3])
    end
    
end

describe "#two_sum" do
    subject { [-1, 0, 2, -2, 1] }
end