=begin
Solution
=end
def circle_circumference(circle)
    2 * Math::PI * circle.radius
end





=begin
Sample Tests
=end
def dotest(circle, expected)
  it "Circle.new(Point.new(#{circle.center.x}, #{circle.center.y}), #{circle.radius})" do
    expect(circle_circumference(circle)).to be_within(1e-6).of(expected)
  end
end

describe 'Basic tests' do
  dotest(Circle.new(Point.new(10, 10), 30), 188.495559)
  dotest(Circle.new(Point.new(25, -70), 30), 188.495559)
  dotest(Circle.new(Point.new(-15, 5), 0), 0)
  dotest(Circle.new(Point.new(-15, 5), 12.5), 78.539816)
end