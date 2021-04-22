# typed: false
# frozen_string_literal: true

require File.expand_path("../Abstract/abstract-php-extension", __dir__)

# Class for Swoole Extension
class SwooleAT81 < AbstractPhpExtension
  init
  desc "Swoole PHP extension"
  homepage "https://github.com/swoole/swoole-src"
  url "https://github.com/swoole/swoole-src/archive/v4.6.5.tar.gz"
  sha256 "c93f6a0623b90ca6a6c96f481e6a817f2930b4a582ca0388575b51aa4fb91d38"
  head "https://github.com/swoole/swoole-src.git"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/shivammathur/extensions"
    rebuild 1
    sha256 cellar: :any, arm64_big_sur: "685f36b0bc738d50381d607793275bc5efb31b213676b50432afd9ea2e7a1cac"
    sha256 cellar: :any, big_sur:       "b5a4bd33caa80b58d51dcfe25a7946f321f5a0eccc22f035d8416f3cb897f538"
    sha256 cellar: :any, catalina:      "0c98a284d4631dbb335840bf1b961e91636682235bc96f261df67cfe3faf367b"
  end

  def install
    patch_spl_symbols
    safe_phpize
    system "./configure"
    system "make"
    prefix.install "modules/#{extension}.so"
    write_config_file
  end
end
