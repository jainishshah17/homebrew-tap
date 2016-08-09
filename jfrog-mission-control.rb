class JfrogMissionControl < Formula
  desc "JFrog Mission Control"
  homepage "https://jfrog.com"
  url "https://jainishshah17:2f4212a487954c0e2b6714273cfd2d9e09e19577@dl.bintray.com/jfrog/jfrog-mission-control/jfrog-mission-control-1.3.zip"
  version "1.3"
  sha256 "d4176465a284fd9f90119747cdfc124ae7ae3908a88a81881a04e714c51ad3e6"
  depends_on :java => "1.8+"
  def install
    rm_f Dir["bin/*.bat"]
    inreplace "bin/mission-control.sh",
    'export MC_HOME="$(cd "$(dirname "${MCBINDIR}")" && pwd)"',
    "export MC_HOME=#{libexec}"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mission-control.sh"
  end
  def post_install
    # Create persistent data directory.
    # directory being directly under MC_HOME.
    # Therefore, we symlink the data dir to var.
    data = var/"mission-control"
    data.mkpath
    libexec.install_symlink data => "data"
  end
  test do
    system "false"
  end
end
