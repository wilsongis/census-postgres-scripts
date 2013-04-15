#!/bin/bash

# Make a data directory in ephemeral stoage
sudo mkdir /mnt/tmp
sudo chown ubuntu /mnt/tmp

# Grab the 2011 ACS 5 year
cd /mnt/tmp
curl -O "http://www2.census.gov/acs2011_5yr/summaryfile/2007-2011_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/All_Geographies_Not_Tracts_Block_Groups.tar.gz"
tar -xvzf All_Geographies_Not_Tracts_Block_Groups.tar.gz
curl -O "http://www2.census.gov/acs2011_5yr/summaryfile/2007-2011_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/Tracts_Block_Groups_Only.tar.gz"
tar -xvzf Tracts_Block_Groups_Only.tar.gz
curl -O "http://www2.census.gov/acs2011_5yr/summaryfile/2007-2011_ACSSF_All_In_2_Giant_Files(Experienced-Users-Only)/2011_ACS_Geography_Files.zip"
sudo apt-get -y install unzip
unzip 2011_ACS_Geography_Files.zip

# Let the Postgres user access this data
chmod 777 /mnt/tmp/geog /mnt/tmp/group1 /mnt/tmp/group2
chmod 644 /mnt/tmp/geog/* /mnt/tmp/group1/* /mnt/tmp/group2/*