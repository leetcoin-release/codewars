/*
Solution
*/
public partial class Kata
{
    public static string AliasGen(string fName, string lName)
    {
        if (string.IsNullOrEmpty(fName) || string.IsNullOrEmpty(lName))
            return "Your name must start with a letter from A - Z.";
        char f = char.ToUpper(fName[0]);
        char l = char.ToUpper(lName[0]);
        if (!char.IsLetter(f) || !char.IsLetter(l))
            return "Your name must start with a letter from A - Z.";
        return $"{FirstName[f.ToString()]} {Surname[l.ToString()]}";
    }
}





/**
Sample Tests
**/
using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;

[TestFixture]
public class Test
{
    [Test]
    public void BasicTest()
    {
        Dictionary<string[], string> bisics = new Dictionary<string[], string>()
        {
            {new []{"Mike", "Millington"},  "Malware Mike"},
            {new []{"Fahima", "Tash"},"Function T-Rex"},
            {new []{"Daisy", "Petrovic"},"Data Payload"},
            {new []{"Barny", "White"},"Beta Worm"},
            {new []{"Hank", "Kutz"},"Half-life Killer"},
            {new []{"123abc", "Pinkman"},"Your name must start with a letter from A - Z."}
        };
        foreach (KeyValuePair<string[], string> keyValuePair in bisics)
        {
            Assert.That(Kata.AliasGen(keyValuePair.Key[0], keyValuePair.Key[1]), Is.EqualTo(keyValuePair.Value).IgnoreCase);
        }
    }
}