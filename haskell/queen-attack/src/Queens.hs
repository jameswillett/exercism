module Queens (boardString, canAttack) where
import Data.List as L

takeTail n = reverse . take n . reverse

emptyBoard = take 8 $ repeat $ take 8 $ repeat "_"

renderBoard = (++ "\n") . L.intercalate "\n" . map unwords

placeQueen :: Char -> (Int, Int) -> [[String]] -> [[String]]
placeQueen color (x, y) board = boardHead ++ [queensRow] ++ boardTail
  where boardHead = take (x) board
        boardTail = takeTail (7 - x) board
        queensRow = rowHead ++ [[color]] ++ rowTail
        rowHead = take (y) thisRow
        rowTail = takeTail (7 - y) thisRow
        thisRow = board!!(y)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black =
  case (white, black) of
    (Nothing, Nothing)        -> renderBoard emptyBoard
    (Just white, Nothing)     -> renderBoard $ placeQueen 'W' white emptyBoard
    (Nothing, Just black)     -> renderBoard $ placeQueen 'B' black emptyBoard
    (Just white, Just black)  -> renderBoard $ placeQueen 'W' white $ placeQueen 'B' black emptyBoard

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (aX, aY) (bX, bY) =
  aX == bX || aY == bY || abs(aX - bX) == abs(aY - bY)
