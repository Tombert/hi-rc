module Main where
import System.Environment

main :: IO ()
main = do
  server:[] <- getArgs 
  print "" 
