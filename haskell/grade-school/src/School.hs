module School (School, add, empty, grade, sorted) where

import Data.List as L
import Data.Map (Map)
import qualified Data.Map as M

type School = Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student school = M.insertWith ((L.sort .) . (++)) gradeNum [student] school

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade = M.findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = M.toAscList
