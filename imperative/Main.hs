--
-- Hacked by Steven Shaw to accept filename as arg.
--

-- Main module for Imp parser and interpreter.
-- Developed for use in COMP3610
-- Clem Baker-Finch

module Main (main) where

import IO
import Scanner
import Parser
import Interpreter
import System (getArgs)
import Control.Monad (forM_)
import Control.Arrow ((>>>), (&&&))

printTokens :: [Token] -> IO ()
printTokens tokens = do
  putStrLn "scanner: "
  putStr "  "; print tokens
  (map (id &&& unscan) tokens) `forM_` \(token, unscan) -> do
    putStr "  "; putStr unscan; putStr "\t\t\t"; print token

main :: IO ()
main = do
  [filename] <- getArgs
  input <- readFile filename
  let tokens = scan input
  printTokens tokens
  let result = eval (parse tokens) arid
  putStrLn "eval ==>"
  putStr (show result)
