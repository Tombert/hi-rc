module Main where
import System.Environment
import Control.Wire
import FRP.Netwire
import Network.Simple.TCP
import Data.ByteString

listener :: Socket -> Wire s e IO a (Maybe ByteString)
listener x = mkGen $ \_ -> do 
   r <- recv x 1000
   return r

main :: IO ()
main = do
  server:[] <- getArgs 
  print "" 
