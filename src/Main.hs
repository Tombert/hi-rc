module Main where
import System.Environment
import Control.Wire
import FRP.Netwire

main :: IO ()
main = do
  server:[] <- getArgs 
  print "" 
