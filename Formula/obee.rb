# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Step by step:  https://mvogelgesang.com/blog/20240419/creating-a-simple-homebrew-formula/

class Obee < Formula
    desc "A tiny shell script that is installable via homebrew. Start ollama and open-webui TBD"
    homepage "https://github.com/vedem1192/obee-tool"
    url "https://github.com/vedem1192/obee-tool/archive/refs/tags/beta.tar.gz"
    version "v0.0.1"
    sha256 "8045fdd705d1667fdc5c645a447f97dcff04004ae539ec88914e5417c84ea1f0"
    license ""
  
    def install
      # here we are installing the shell script and giving it an alias of "obee"
      bin.install "src/run.sh" => "obee"
    end
  
    test do
      # this is a simple test that checks if the script is working as expected
      system "#{bin}/obee", "load"
    end
  end