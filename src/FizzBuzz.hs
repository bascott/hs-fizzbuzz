module FizzBuzz
    ( fizzbuzz
    ) where

import Control.Monad.IO.Class
import Control.Monad.Trans.List

fizzbuzz :: ListT IO ()
fizzbuzz = fizzbuzz' [1..]

fizzbuzz' :: [Int] -> ListT IO ()
fizzbuzz' xs
    = do x <- (ListT . pure) xs
         is3 <- if mod x 3 == 0
                   then liftIO $ putStr "fizz" >> pure True
                   else pure False
         is5 <- if mod x 5 == 0
                   then liftIO $ putStr "buzz" >> pure True
                   else pure False
         liftIO $ putStrLn $ if is3 || is5
                                then ""
                                else show x
