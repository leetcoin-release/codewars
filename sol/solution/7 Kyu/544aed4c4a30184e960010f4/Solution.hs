{-
Solution
-}
module Divisors where
divisors :: (Show a, Integral a) => a -> Either String [a]
divisors n =
  let ds = [x | x <- [2 .. n - 1], n `mod` x == 0]
  in if null ds
     then Left (show n ++ " is prime")
     else Right ds





{-
Sample Tests
-}
module Codewars.Kata.AlternatingCaseSpec (spec, main) where
module DivisorsSpec where
import Divisors (divisors)
import Test.Hspec

spec :: Spec
spec = do
  describe "divisors" $ do
    it "should work for simple examples" $ do
      divisors 3   `shouldBe` Left "3 is prime"
      divisors 4   `shouldBe` Right [2]
      divisors 13  `shouldBe` Left "13 is prime"
      divisors 15  `shouldBe` Right [3,5]
      divisors 24  `shouldBe` Right [2,3,4,6,8,12]
      divisors 29  `shouldBe` Left "29 is prime"
      divisors 253 `shouldBe` Right [11,23]