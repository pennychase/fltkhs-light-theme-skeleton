{-# LANGUAGE ImplicitParams, OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light

buttonCb :: (?assets :: Assets) => Ref Button -> IO ()
buttonCb b' = do
  l' <- getLabel b'
  if (l' == "Hello world")
    then setLabel b' "Goodbye world"
    else setLabel b' "Hello world"

ui :: (?assets :: Assets) => IO ()
ui = do
 window <- windowNew
           (Size (Width 600) (Height 400))
           Nothing
           Nothing
 begin window
 b' <- buttonNew
        (Rectangle (Position (X 225) (Y 180)) (Size (Width 150) (Height 40)))
        (Just "Hello world")
 setLabelsize b' (FontSize 12)
 setCallback b' buttonCb
 end window
 showWidget window

main :: IO ()
main = do
  assets <- configureTheme
  let ?assets = assets
  ui
  FL.run
  FL.flush

replMain :: IO ()
replMain = do
  assets <- configureTheme
  let ?assets = assets
  ui
  FL.replRun
