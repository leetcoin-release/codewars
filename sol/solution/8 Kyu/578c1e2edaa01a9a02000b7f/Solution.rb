=begin
Solution
=end
def alias_gen(first_name, surname)
  f = first_name[0].upcase
  s = surname[0].upcase
  unless f =~ /[A-Z]/ && s =~ /[A-Z]/
    return "Your name must start with a letter from A - Z."
  end
  "#{FIRST_NAME[f]} #{SURNAME[s]}"
end





=begin
Sample Tests
=end
def dotest(first_name, surname, expected)
  it "first_name = #{first_name.inspect}, surname = #{surname.inspect}" do
    expect(alias_gen(first_name, surname)).to eq expected
  end
end

describe "Fixed tests" do
  dotest("Mike", "Millington", "Malware Mike")
  dotest("Fahima", "Tash", "Function T-Rex")
  dotest("Daisy", "Petrovic", "Data Payload")
  dotest("Barny", "White", "Beta Worm")
  dotest("Hank", "Kutz", "Half-life Killer")
  dotest("johnny", "Tomato", "Java T-Rex")
  dotest("7393424", "Anumbha", "Your name must start with a letter from A - Z.")
  dotest("Anuddanumbha", "23200", "Your name must start with a letter from A - Z.")
end