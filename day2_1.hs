import System.IO (readFile)
import Data.List (tails)

 
parseFile :: FilePath -> IO [[Int]]
parseFile filePath = do
    contents <- readFile filePath
    return $ map (map read . words) (lines contents)

 
isIncreasing :: [Int] -> Bool
isIncreasing xs = all (\(x, y) -> (y - x) >= 1 && (y - x) <= 3) (zip xs (tail xs))

 
isDecreasing :: [Int] -> Bool
isDecreasing xs = all (\(x, y) -> (x - y) >= 1 && (x - y) <= 3) (zip xs (tail xs))

-- part 1
isSafe :: [Int] -> Bool
isSafe xs = isIncreasing xs || isDecreasing xs  
subsequencesWithOneRemoved :: [Int] -> [[Int]]
subsequencesWithOneRemoved xs = [ take i xs ++ drop (i + 1) xs | i <- [0..length xs - 1] ]

-- Check if a report is safe by removing one element (Problem Dampener)
isSafeWithRemoval :: [Int] -> Bool
isSafeWithRemoval xs = any isSafe (subsequencesWithOneRemoved xs)
 
countSafe :: [[Int]] -> Int
countSafe = length . filter isSafe
 
countSafeWithDampener :: [[Int]] -> Int
countSafeWithDampener = length . filter isSafeWithRemoval
 
main :: IO ()
main = do
 
    lists <- parseFile "input2.txt"
 
    let c1 = countSafe lists
    print c1
 
    -- part 2 
    let c2 = countSafeWithDampener lists
    print c2 
 