module Paths_memcached (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,1], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/usr/local/bin"
libdir     = "/usr/local/lib/memcached-0.1/ghc-6.10.1"
datadir    = "/usr/local/share/memcached-0.1"
libexecdir = "/usr/local/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "memcached_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "memcached_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "memcached_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "memcached_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
