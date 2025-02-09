class Nap < Formula
  desc "Code snippets in your terminal"
  homepage "https://github.com/maaslalani/nap"
  url "https://github.com/maaslalani/nap/archive/v0.1.1.tar.gz"
  sha256 "2954577d2bd99c1114989d31e994d7bef0f1c934795fc559b7c90f6370d9f98b"
  license "MIT"
  head "https://github.com/maaslalani/nap.git", branch: "main"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "f0ed819808bb795ecfce79d5415ea928d48b3f4cd9d716ef26e0e48a4f88067b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b9a201267139b6f4d72d65a5651b981efba2fd74d0583221b87071ec34ad1051"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "misc/Untitled Snippet.go", shell_output("#{bin}/nap list")
  end
end
