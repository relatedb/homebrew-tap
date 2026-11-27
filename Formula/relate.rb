class Relate < Formula
  desc "Embedded openCypher graph database in a single binary"
  homepage "https://relatedb.ai/"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.4.0/relate-darwin-arm64"
      sha256 "21b53ec8b11691f6465c0c12b79801585191b52f599bba888e933134b2af5e8a"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.4.0/relate-darwin-amd64"
      sha256 "113f61a90ff16d46798de4bd86d07de05c71d24c41a391da8f3677627a14b5eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/relatedb/relate/releases/download/v1.4.0/relate-linux-arm64"
      sha256 "34c88985c3214e9dfb2ed3fdafb6da5b82f9d352c84ae154ffaf37d332aa6a81"
    end
    on_intel do
      url "https://github.com/relatedb/relate/releases/download/v1.4.0/relate-linux-amd64"
      sha256 "7f39bb3a11fe68955ec5ec7ea7783bb2429e8b48dfa0bd55afbf2aefa6ba74ad"
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
