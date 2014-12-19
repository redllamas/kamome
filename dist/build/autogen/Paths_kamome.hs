module Paths_kamome (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sam/.cabal/bin"
libdir     = "/Users/sam/.cabal/lib/x86_64-osx-ghc-7.8.3/kamome-0.1.0.0"
datadir    = "/Users/sam/.cabal/share/x86_64-osx-ghc-7.8.3/kamome-0.1.0.0"
libexecdir = "/Users/sam/.cabal/libexec"
sysconfdir = "/Users/sam/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "kamome_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "kamome_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "kamome_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "kamome_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "kamome_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
