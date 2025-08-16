{-
Solution
-}
module SimplePrimeStream where
isPrime :: Int -> Bool
isPrime n
  | n < 2     = False
  | n == 2    = True
  | even n    = False
  | otherwise = null [ x | x <- [3,5..limit], n `mod` x == 0 ]
  where
    limit = floor . sqrt $ fromIntegral n
primes :: [Int]
primes = filter isPrime [2..]
primeStream :: String
primeStream = concatMap show primes
solve :: Int -> Int -> String
solve a b = take b . drop a $ primeStream





{-
Sample Tests
-}
module SimplePrimeStreamSpec where
import SimplePrimeStream
import Test.Hspec

spec :: Spec
spec = do
  describe "Simple Prime Streaming" $ do
    it "Basic tests" $ do
      solve 2 2 `shouldBe` "57"
      solve 10 3 `shouldBe` "192"
      solve 20 9 `shouldBe` "414347535"
      solve 30 12 `shouldBe` "616771737983"
      solve 40 8 `shouldBe` "83899710"
      solve 50 6 `shouldBe` "031071"  