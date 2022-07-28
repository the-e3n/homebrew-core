class Splinter < Formula
    desc "A cross-platform and language indepedent db migration tool"
    homepage "https://github.com/squareboat/splinter#readme"
    url "https://github.com/squareboat/splinter/archive/refs/tags/v0.0.3.tar.gz"
    sha256 "22d225d2ec5b7a471ecdb775f161fcddc227c3966c00ef505f32ac2e20971648"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      homeDir = Dir::home()
      print "Installing Splinter...\n"
      print "Version: #{version}\n"
      system "go", "build", "-o", "splinter"
      bin.install "splinter"
  
    end
  
    test do
      binFile =File.exist?("#{bin}/splinter")
      assert binFile, "Splinter binary not found"
      output = `#{bin}/splinter --help`
      if output.include? "migration" 
        return true
      end
      return false
    end
  end
  