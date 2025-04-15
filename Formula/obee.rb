# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Step by step:  https://mvogelgesang.com/blog/20240419/creating-a-simple-homebrew-formula/

class Obee < Formula
    desc "A tiny shell script that is installable via homebrew. Start ollama and open-webui TBD"
    homepage "https://github.com/vedem1192/homebrew-obee"
    url "https://github.com/vedem1192/homebrew-obee/archive/refs/tags/v0.0.1-alpha-0.tar.gz"
    sha256 "0c87370f2dba538a35c595f043247252081200b210936a32f0cde0bfd6eea58f"
    license ""
  
    def install
      # here we are installing the shell script and giving it an alias of "obee"
      bin.install "src/run.sh" => "obee"
    end
  
    test do
      # this is a simple test that checks if the script is working as expected
      system "#{bin}/obee", "start"
    end
  end