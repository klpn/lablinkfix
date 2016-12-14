{-# LANGUAGE ViewPatterns #-}
import Data.List
import qualified Data.Map as Map
import Text.Pandoc.JSON

main :: IO ()
main = toJSONFilter lablinkfix

lablinkfix :: Inline -> Inline
lablinkfix (Link attr inline (url, title)) = (Link attr inline ((targetfix url), title)) 
lablinkfix x = x

targetfix :: [Char] -> [Char]
targetfix (stripPrefix oldborgepref -> Just borgeid) = newborgepref ++ borgeid
targetfix (stripPrefix oldkatapref -> Just oldkataid) = newkatapref ++ newkataid
    where (Just newkataid) = Map.lookup oldkataid kataids
targetfix x = x

oldborgepref = "http://borge.arbark.se?"
newborgepref = "http://borge.arbark.se?refkod="
oldkatapref = "http://kata.arbark.se/wsRecInfo.asp?idno="
newkatapref = "http://webbsok.mikromarc.se/Mikromarc3/web/detail.aspx?Unit=6475&db=arbark-swe&Id="

-- Maps old ID for Kata posts to new ones.
-- Should be expanded (read from CSV or JSON?).
kataids = Map.fromList 
    [("98324", "68468")
    , ("101747", "71385")]