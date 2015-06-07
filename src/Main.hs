module Main where
import System.Environment
import Control.Wire
import FRP.Netwire
import Network.Simple.TCP
import Data.ByteString
import qualified Data.ByteString.Char8 as CH
import Data.Maybe
import Prelude hiding ((.))

ping = CH.pack "PING"

listener :: Socket -> Wire s () IO a ByteString
listener x = mkGen_ $ \_ -> do 
   r <- recv x 1000
   let r' = fromMaybe (CH.pack "") r 
   return $ Right r'

responder :: Socket -> Wire s () IO a ()
responder s = mkGen_ $ \_ -> do
    send s (CH.pack "PONG")
    return $ Right ()

main :: IO ()
main = do
  server:[] <- getArgs 
  print "" 
