{-
Solution
-}
module Codewars.Kata.AlternatingCase where
import Data.Char (isLower, isUpper, toLower, toUpper)
toAlternatingCase :: String -> String
toAlternatingCase = map swapCase
  where
    swapCase c
      | isLower c = toUpper c
      | isUpper c = toLower c
      | otherwise = c





{-
Sample Tests
-}
module Codewars.Kata.AlternatingCaseSpec (spec, main) where
import Codewars.Kata.AlternatingCase (toAlternatingCase)
import Codewars.Kata.AlternatingCase.ASCII
import Test.Hspec
import Test.QuickCheck

main = hspec spec
spec = describe "toAlternatingCase" $ do
  it "works for the examples" $ do
    toAlternatingCase "hello world" `shouldBe` "HELLO WORLD"
    toAlternatingCase "HELLO WORLD" `shouldBe` "hello world"
    toAlternatingCase "hello WORLD" `shouldBe` "HELLO world"
    toAlternatingCase "HeLLo WoRLD" `shouldBe` "hEllO wOrld"
    toAlternatingCase "12345"       `shouldBe` "12345"
    toAlternatingCase "1a2b3c4d5e"  `shouldBe` "1A2B3C4D5E"
  
  it "returns the same string if called twice" $ property $ \(ASCII xs) ->
    toAlternatingCase (toAlternatingCase xs) `shouldBe` xs
  
  it "returns a string with the same length" $ property $ \(ASCII xs) ->
    let l = length xs
    in toAlternatingCase xs `shouldSatisfy` ((l ==) . length)