instalando el cliente de postgresql:
sudo apt-get install -y postgresql-client pwgen libpq-dev  libaio-dev perl-devel libdbi-perl


mkdir -p /home/lnunez/usm/oracle/

sudo unzip /home/lnunez/usm/oracle/instantclient-basic-linux.x64-11.2.0.4.0.zip -d /usr/local/
sudo unzip /home/lnunez/usm/oracle/instantclient-sdk-linux.x64-11.2.0.4.0.zip -d /usr/local/
sudo unzip /home/lnunez/usm/oracle/instantclient-sqlplus-linux.x64-11.2.0.4.0.zip -d /usr/local/
sudo ln -s /usr/local/instantclient_11_2 /usr/local/instantclient
sudo ln -s /usr/local/instantclient/libclntsh.so.11.1 /usr/local/instantclient/libclntsh.so
sudo ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus

export ORACLE_HOME=/usr/local/instantclient
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/instantclient

echo 'export ORACLE_HOME=/usr/local/instantclient' >> ~/.bashrc 
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/instantclient
' >> ~/.bashrc 

mkdir -p /home/lnunez/usm/postgresql

docker run -d --name="postgresql" \
             -p 127.0.0.1:5438:5432 \
             -v /home/lnunez/usm/postgresql:/data \
             -e USER="super" \
             -e DB="viajes_realizados" \
             -e PASS="usm" \
             paintedfox/postgresql
mkdir -p /home/lnunez/usm/chimuchina/
cd /home/lnunez/usm/chimuchina/
git clone https://github.com/darold/ora2pg.git; cd ora2pg; perl Makefile.PL; make; sudo make install; cd..

wget http://search.cpan.org/CPAN/authors/id/P/PY/PYTHIAN/DBD-Oracle-1.74.tar.gz
tar xvzf DBD-Oracle-1.74.tar.gz
cd DBD-Oracle-1.74/
perl Makefile.PL; make; sudo make install; cd..


wget http://search.cpan.org/CPAN/authors/id/T/TU/TURNSTEP/DBD-Pg-3.7.0.tar.gz
tar xvzf DBD-Pg-3.7.0.tar.gz
cd DBD-Pg-3.7.0
perl Makefile.PL
make; sudo make install 
make
make install




