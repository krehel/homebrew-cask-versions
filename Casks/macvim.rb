class Macvim < Cask
  version '7.4-73'

  if MacOS.version < :mavericks
    sha256 '7f573fb9693052a86845c0a9cbb0b3c3c33ee23294f9d8111187377e4d89f72c'
    url 'https://github.com/eee19/macvim/releases/download/snapshot-73/MacVim-snapshot-73-Mountain-Lion.tbz'
  else
    sha256 '557c60f3487ab68426cf982c86270f2adfd15e8a4d535f762e6d55602754d224'
    url 'https://github.com/b4winckler/macvim/releases/download/snapshot-73/MacVim-snapshot-73-Mavericks.tbz'
    appcast 'http://b4winckler.github.com/macvim/appcast/stable.xml'
  end

  homepage 'http://code.google.com/p/macvim/'
  license :oss

  app 'MacVim-snapshot-73/MacVim.app'
  binary 'MacVim-snapshot-73/mvim'
  zap :delete => [
                  '~/Library/Preferences/org.vim.MacVim.LSSharedFileList.plist',
                  '~/Library/Preferences/org.vim.MacVim.plist',
                 ]

  caveats do
    files_in_usr_local
    <<-EOS.undent
      Note that homebrew also provides a compiled macvim Formula that links its
      binary to /usr/local/bin/mvim. It's not recommended to install both the
      Cask and the Formula of MacVim.
    EOS
  end
end
