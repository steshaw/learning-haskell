import Data.List (sortBy, groupBy)
import Data.Ord (comparing)

(|>) = flip ($)

clusterBy :: Ord b => (a -> b) -> [a] -> [[a]]
clusterBy f xs = xs
  |> sortBy (\a b -> f a `compare` f b)
  |> groupBy (\a b -> f a == f b)

antWords = words "the tan ant gets some fat"

eg1 = antWords |> clusterBy length

eg2 = antWords |> clusterBy head

eg3 = antWords |> clusterBy last
