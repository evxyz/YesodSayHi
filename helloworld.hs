{-- Yesod is built on top of the Web Application Interface (WAI), allowing it to run on FastCGI, SCGI, Warp, or even as a desktop application using the Webkit library.--}
{-- Warning: In the use of `warpDebug'
             (imported from Yesod, but defined in Yesod.Core.Dispatch):
             Deprecated: "Please use warp instead" --}

{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses, TemplateHaskell, OverloadedStrings #-}

import Yesod 

data HelloWorld = HelloWorld 

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET 
|]

instance Yesod HelloWorld 

getHomeR :: Handler RepHtml 
getHomeR = defaultLayout [whamlet|<h2>Hello World!</h2>|] 
main :: IO () 
main = warp 3000 HelloWorld 

