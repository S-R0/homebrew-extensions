# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Swoole Extension
class SwooleAT74 < AbstractPhp74Extension
  init
  desc "Swoole PHP extension"
  homepage "https://github.com/swoole/swoole-src"
  url "https://github.com/swoole/swoole-src/archive/v4.6.1.tar.gz"
  sha256 "d4c9b1c3966faeee996344920554993885465377e40fa5ebb4e716593072eb57"
  head "https://github.com/swoole/swoole-src.git"
  license "Apache-2.0"

  bottle do
    root_url "https://dl.bintray.com/shivammathur/extensions"
    cellar :any
    sha256 "508f24a1c23ec26aa4a7e8b809c740a67a128266b695eba41ad8d5436bd3ee10" => :big_sur
    sha256 "a3ff60f0550a2e2feccadd08a3387d50dbc29e938fd09db161b12e6069686a1e" => :catalina
  end

  def install
    safe_phpize
    system "./configure"
    system "make"
    prefix.install "modules/#{module_name}.so"
    write_config_file
  end
end
