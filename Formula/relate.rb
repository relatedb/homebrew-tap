class Relate < Formula
  desc "Embedded openCypher graph database in a single binary"
  homepage "https://relatedb.ai/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.3.0/relate-darwin-arm64"
      sha256 "b1d2d2f59fca696b0c2df35364c8a198a317b6fa733f0b8ff21b8fdcb7e30bc6"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.3.0/relate-darwin-amd64"
      sha256 "9595ab272616dc2e4143c7fcbbb95da0e482e043168033aafdaf91efa9d16249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.3.0/relate-linux-arm64"
      sha256 "a8b5d3727787d42daad37fea7e4e1f176d15a8a6c3cf082cb2eb57920bbcd86e"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.3.0/relate-linux-amd64"
      sha256 "a278193a61c03e514d61469b1dc12ad440dc96a8ded4f70e05012514e714b281"
    end
  end

  def install
    libexec.install cached_download => "relate"
    chmod 0755, libexec/"relate"
    (libexec/".relate-package-managed").write <<~JSON
      {"manager":"homebrew","upgrade":"brew upgrade relate"}
    JSON
    bin.install_symlink libexec/"relate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/relate --version")
  end
end
