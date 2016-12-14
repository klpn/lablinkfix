import Data.Aeson
import qualified Data.ByteString.Lazy as B
import qualified Data.Map as Map

jsonFile :: FilePath
jsonFile = "kataids.json"

hsFile :: FilePath
hsFile = "Kataids.hs"

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

kidspref = "module Kataids where\n\
           \import qualified Data.Map as Map\n\
           \kataids = Map."

main = do
    d <- (eitherDecode <$> getJSON) :: IO (Either String (Map.Map String String))
    case d of
       Left err -> putStrLn err
       Right kids -> writeFile hsFile $ kidspref ++ (show kids)
