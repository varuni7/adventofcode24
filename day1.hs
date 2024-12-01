import System.IO (readFile)
import Data.List (transpose , sort)
import qualified Data.Map as Map

-- Function to parse the input file
parseFile :: FilePath -> IO ([Int], [Int])
parseFile filePath = do
    contents <- readFile filePath
    let rows = map (map read . words) (lines contents) :: [[Int]]
    let [col1, col2] = transpose rows
    return (col1, col2)
 
frequency :: [Int] -> Map.Map Int Int -- why is making a frequency dict in haskell so difficult! 
frequency = foldr (\x acc -> Map.insertWith (+) x 1 acc) Map.empty

-- Function to calculate similarity score for Int lists
similarityScore :: [Int] -> [Int] -> Int
similarityScore leftList rightList = sum $ map (\x -> x * (Map.findWithDefault 0 x freqMap)) leftList
    where
        freqMap = frequency rightList  -- Frequency map for the right list

main :: IO ()
main = do
 
    (l1, l2) <- parseFile "input0.txt"
    let sorted_l1 = sort l1 
    print sorted_l1 
    let sorted_l2 = sort l2 
    print sorted_l2
    let pairs = zip sorted_l1 sorted_l2
    print pairs
    let absDifferences = map (\(x, y) -> abs (y - x)) pairs
    print absDifferences
    print (sum absDifferences)

    -- 2nd part 


    let leftList = sorted_l1
    let rightList = sorted_l2
    print (similarityScore leftList rightList)
 
     
    


