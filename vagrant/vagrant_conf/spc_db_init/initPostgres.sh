#!/bin/bash
echo "Running postgres init script for spc4mlx"
cd /usr/lib/postgresql/8.4/bin
su postgres << psql
createdb spc4mlx2
psql -c "CREATE USER spc4mlx2 WITH PASSWORD 'A12FGec7776';"
psql -d spc4mlx2
grant all privileges on database spc4mlx2 to spc4mlx2;
psql
