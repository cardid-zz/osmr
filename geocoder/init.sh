OSMFILE=$1
PGDIR=$2
THREADS=$3

mkdir -p /$PGDIR && \

chown postgres:postgres /$PGDIR && \

export  PGDATA=/$PGDIR  && \
sudo -u postgres /usr/lib/postgresql/11/bin/initdb -D /$PGDIR && \
sudo -u postgres /usr/lib/postgresql/11/bin/pg_ctl -D /$PGDIR start && \
sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='nominatim'" | grep -q 1 || sudo -u postgres createuser -s nominatim && \
sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='www-data'" | grep -q 1 || sudo -u postgres createuser -SDR www-data && \
sudo -u postgres psql postgres -c "DROP DATABASE IF EXISTS nominatim" && \
useradd -m -p password1234 nominatim && \
chown -R nominatim:nominatim ./src && \
sudo -u nominatim ./src/build/utils/setup.php --osm-file $OSMFILE --all --threads $THREADS && \
sudo -u postgres /usr/lib/postgresql/11/bin/pg_ctl -D /$PGDIR stop && \
sudo chown -R postgres:postgres /$PGDIR
