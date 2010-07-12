require 'socket'
require 'rbconfig'
module Rserve
  VERSION = '0.2.5'
  ON_WINDOWS=RbConfig::CONFIG['arch']=~/mswin|mingw/
end


require 'rserve/withnames'
require 'rserve/withattributes'


require 'rserve/protocol'
require 'rserve/packet'
require 'rserve/talk'
require 'rserve/rexp'
require 'rserve/engine'
require 'rserve/session'
require 'rserve/connection'
require 'rserve/rlist'
require 'rserve/rfactor'


