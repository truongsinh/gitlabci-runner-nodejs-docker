# Download Ruby and compile it
mkdir /tmp/ruby && cd /tmp/ruby && curl -s http://ftp.ruby-lang.org/pub/ruby/ruby-2.0-stable.tar.bz2 | tar xj --strip-components=1
cd /tmp/ruby && ./configure --disable-install-rdoc --silent && make && sudo make install
rm -rf /tmp/ruby

# don't install ruby rdocs or ri:
echo "gem: --no-rdoc --no-ri" >> /usr/local/etc/gemrc
