/*
* Solution
*/
public class Kata
{
    public static int[] Divisors(int n)
    {
        var divisorsList = new System.Collections.Generic.List<int>();
        for (int i = 2; i <= n / 2; i++)
        {
            if (n % i == 0)
            {
                divisorsList.Add(i);
            }
        }
        if (divisorsList.Count == 0)
        {
            return null; 
        }
        return divisorsList.ToArray();
    }
}





/*
* Sample Tests
*/
namespace Solution 
{
  using NUnit.Framework;
  using System;

  [TestFixture]
  public class SolutionTest
  {
    [Test]
    public void SampleTest()
    {
      Assert.That(Kata.Divisors(15), Is.EqualTo(new int[] {3, 5}), "n = 15");
      Assert.That(Kata.Divisors(16), Is.EqualTo(new int[] {2, 4, 8}), "n = 16");
      Assert.That(Kata.Divisors(253), Is.EqualTo(new int[] {11, 23}), "n = 253");
      Assert.That(Kata.Divisors(24), Is.EqualTo(new int[] {2, 3, 4, 6, 8, 12}), "n = 24");
      Assert.That(Kata.Divisors(7), Is.Null, "n = 7");
    }
  }
}