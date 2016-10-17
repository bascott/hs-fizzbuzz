module Main where

import Control.Monad.Trans.List
import FizzBuzz

main :: IO ()
main = runListT fizzbuzz >> pure ()
