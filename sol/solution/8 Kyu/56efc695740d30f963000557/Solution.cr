#
Solution
#
class String
  def to_alternating_case
    self.chars.map do |c|
      if c.ascii_lowercase?
        c.upcase
      elsif c.ascii_uppercase?
        c.downcase
      else
        c
      end
    end.join
  end
end





#
Sample Tests
#
describe "Basic tests"  do
  it "should work for fixed tests (provided in the description)" do
    "hello world".to_alternating_case().should eq "HELLO WORLD"
    "HELLO WORLD".to_alternating_case().should eq "hello world"
    "hello WORLD".to_alternating_case().should eq "HELLO world"
    "HeLLo WoRLD".to_alternating_case().should eq "hEllO wOrld"
    "12345".to_alternating_case().should eq "12345"
    "1a2b3c4d5e".to_alternating_case().should eq "1A2B3C4D5E"
    "String.prototype.toAlternatingCase".to_alternating_case().should eq "sTRING.PROTOTYPE.TOaLTERNATINGcASE"
    "Hello World".to_alternating_case().to_alternating_case().should eq "Hello World"
  end
  it "should work for the title of this Kata" do
  title = "altERnaTIng cAsE"
  title = title.to_alternating_case()
  title.should eq "ALTerNAtiNG CaSe"
  title = title.to_alternating_case()
  title.should eq "altERnaTIng cAsE"
  title = title.to_alternating_case()
  title.should eq "ALTerNAtiNG CaSe"
  title = title.to_alternating_case()
  title.should eq "altERnaTIng cAsE"
  title = "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
  title = title.to_alternating_case()
  title.should eq "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"
  title = title.to_alternating_case()
  title.should eq "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
  title = title.to_alternating_case()
  title.should eq "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"
  title = title.to_alternating_case()
  title.should eq "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
  end
end