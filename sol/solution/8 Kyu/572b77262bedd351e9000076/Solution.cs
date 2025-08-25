/*
Solution
*/
using System;
using System.Linq;
public class Kata
{
  public static object[] TakeFirstElements(object[] array, int n = 1)
  {
    if (n == 0) return new object[] {};
    return array.Take(n).ToArray();
  }
}





/*
Sample Tests
*/
namespace Solution 
{
  using NUnit.Framework;    

  [TestFixture]
  public class KataTest
  {
    [Test]
    public void BasicTests()
    {
      var arr = new object[] { 'a', 'b', 'c', 'd', 'e' };
      Assert.That(Kata.TakeFirstElements(arr), Is.EqualTo(new object[] { 'a' }));
      Assert.That(Kata.TakeFirstElements(arr, 2), Is.EqualTo(new object[] { 'a', 'b' }));
    }
  }
}
