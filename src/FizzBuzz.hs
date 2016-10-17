module FizzBuzz
    ( fizzbuzz
    ) where

import Control.Monad.IO.Class
import Control.Monad.Trans.List

fizzbuzz :: ListT IO ()
fizzbuzz = fizzbuzz' [1..]

fizzbuzz' :: [Int] -> ListT IO ()
fizzbuzz' xs = (ListT . pure . fizzbuzz'') xs >>= liftIO . putStrLn

fizzbuzz'' :: [Int] -> [String]
fizzbuzz'' xs
    = do x <- xs
         let fizz = if mod x 3 == 0 then "fizz" else ""
         let buzz = if mod x 5 == 0 then "buzz" else ""
         pure $ (fizz ++ buzz) <++ show x 
  where
      infixr 5 <++
      [] <++ xs = xs
      xs <++ _  = xs
 