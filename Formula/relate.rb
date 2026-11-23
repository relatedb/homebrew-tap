class Relate < Formula
  desc "Embedded openCypher graph database in a single binary"
  homepage "https://relatedb.ai/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.2.0/relate-darwin-arm64"
      sha256 "347511ff84392579a3554da3c3ab690d9e0bcf33a8697949d00b2bd05f123c90"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.2.0/relate-darwin-amd64"
      sha256 "0cb4f8704db83b761ed4e2c44706769d1ea44fff338d0d42a44909508b580b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.2.0/relate-linux-arm64"
      sha256 "e73f39b2f0442b76f8a5e01194ff6ed69a8dd2637427c4f97ae9d4ae8f288859"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.2.0/relate-linux-amd64"
      sha256 "03e05e7cf25eec498e328837a3b6636c7a4807410b989e4b72948f1ebc8a99a5"
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
