/*
Solution
*/
using System;
using System.Linq;
public class Kata
{
  public static string ArrowFunc(int[] arr)
  {
    return string.Join("", arr.Select(i => Tools.FromCharCode(i)).ToArray());
  }
}





/*
Sample Tests
*/
using NUnit.Framework;
using System;

[TestFixture]
public class Test
{
  [Test]
  public static void FixedTests()
  {
    Assert.That(Kata.ArrowFunc(new int[]{84,101,115,116}), Is.EqualTo("Test"));
  }
}