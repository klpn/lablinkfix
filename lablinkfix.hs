{-# LANGUAGE ViewPatterns #-}
module Main where

import Data.List
import qualified Data.Map as Map
import Text.Pandoc.JSON
import Kataids

main :: IO ()
main = toJSONFilter lablinkfix

lablinkfix :: Inline -> Inline
lablinkfix (Link attr inline (url, title)) = (Link attr inline ((targetfix url), title)) 
lablinkfix x = x

targetfix :: [Char] -> [Char]
targetfix (stripPrefix oldborgepref -> Just borgeid) = newborgepref ++ borgeid
targetfix (stripPrefix oldkatarecpref -> Just oldkataid) = newkata oldkataid
targetfix (stripPrefix oldkatavolpref -> Just oldkataid) = newkata oldkataid
targetfix (stripPrefix oldkatasearchpref -> Just katasearch) = newkatasearch
targetfix x = x

newkata :: [Char] -> [Char]
newkata oldkataid = case Map.lookup oldkataid kataids of
                               Just newkataid -> newkatapref ++ newkataid 
                               Nothing -> newkatasearch 

oldborgepref = "http://borge.arbark.se?"
newborgepref = "http://borge.arbark.se?refkod="
oldkatarecpref = "http://kata.arbark.se/wsRecInfo.asp?idno="
oldkatavolpref = "http://kata.arbark.se/wsVolumes.asp?idno="
oldkatasearchpref = "http://kata.arbark.se/wsHitList.Asp?"
newkatapref = "http://webbsok.mikromarc.se/Mikromarc3/web/detail.aspx?Unit=6475&db=arbark-swe&Id="
newkatasearch = "http://webbsok.mikromarc.se/Mikromarc3/web/search.aspx?ST=Form&Unit=6475&db=arbark-swe"
