# Script to retrieve data usage of NextCloud users
#
# Setting variables
nc_dir=/data/sites/web/louscornerbe/subsites/nc.louscorner.be/nextcloud
days=1

users=$(php $nc_dir/occ user:list|awk '{print $2}'|cut -d: -f1)

# starting Script
#
echo "Data usage for Nextcloud users, for the last $days days"
echo "-------------------------------------------------------"
#
# Loop throug users and get latest data upload
for i in $users;
        do
                echo -e "user $i\n";
                find $nc_dir/data/$i -type f -mtime -$days -printf %Td/%Tm/%TY-%TH:%TM\\t%P\\n;
                echo "";
        done
