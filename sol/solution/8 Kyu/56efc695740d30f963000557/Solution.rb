=begin
Solution
=end
class String
  def to_alternating_case
    self.chars.map do |ch|
      if ch =~ /[A-Z]/
        ch.downcase
      elsif ch =~ /[a-z]/
        ch.upcase
      else
        ch
      end
    end.join
  end
end





=begin
Sample Tests
=end
describe("Basic tests") do
  it("should work for fixed tests (provided in the description)") do
    expect("hello world".to_alternating_case()).to eq("HELLO WORLD")
    expect("HELLO WORLD".to_alternating_case()).to eq("hello world")
    expect("hello WORLD".to_alternating_case()).to eq("HELLO world")
    expect("HeLLo WoRLD".to_alternating_case()).to eq("hEllO wOrld")
    expect("12345".to_alternating_case()).to eq("12345")
    expect("1a2b3c4d5e".to_alternating_case()).to eq("1A2B3C4D5E")
    expect("String.prototype.toAlternatingCase".to_alternating_case()).to eq("sTRING.PROTOTYPE.TOaLTERNATINGcASE")
    expect("Hello World".to_alternating_case().to_alternating_case()).to eq("Hello World")
  end

  it("should work for the title of this Kata") do
    title = "altERnaTIng cAsE"
    title = title.to_alternating_case()
    expect(title).to eq("ALTerNAtiNG CaSe")
    title = title.to_alternating_case()
    expect(title).to eq("altERnaTIng cAsE")
    title = title.to_alternating_case()
    expect(title).to eq("ALTerNAtiNG CaSe")
    title = title.to_alternating_case()
    expect(title).to eq("altERnaTIng cAsE")
    # more tests
    title = "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
    title = title.to_alternating_case()
    expect(title).to eq("ALTerNAtiNG CaSe <=> altERnaTIng cAsE")
    title = title.to_alternating_case()
    expect(title).to eq("altERnaTIng cAsE <=> ALTerNAtiNG CaSe")
    title = title.to_alternating_case()
    expect(title).to eq("ALTerNAtiNG CaSe <=> altERnaTIng cAsE")
    title = title.to_alternating_case()
    expect(title).to eq("altERnaTIng cAsE <=> ALTerNAtiNG CaSe")
  end
end