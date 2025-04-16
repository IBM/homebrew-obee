# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Step by step:  https://mvogelgesang.com/blog/20240419/creating-a-simple-homebrew-formula/

class Obee < Formula
    desc "A tiny shell script that is installable via homebrew. Start ollama and open-webui TBD"
    homepage "https://github.com/IBM/homebrew-obee"
    url "https://github.com/IBM/homebrew-obee/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "7e83eda679ab93cc068214a91e20f82862f4573e95847537007cc423a8f63daa"
    license "apache-2"

    def install
      # here we are installing the shell script and giving it an alias of "obee"
      bin.install "src/run.sh" => "obee"
    end

    test do
      # this is a simple test that checks if the script is working as expected
      system "#{bin}/obee", "start"
    end
  end