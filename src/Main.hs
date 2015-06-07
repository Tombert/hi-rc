module Main where
import System.Environment
import Control.Wire
import FRP.Netwire
import Network.Simple.TCP
import Data.ByteString

listener :: Socket -> Wire s () IO a (Maybe ByteString)
listener x = mkGen_ $ \_ -> do 
   r <- recv x 1000
   return $ Right r

main :: IO ()
main = do
  server:[] <- getArgs 
  print "" 
