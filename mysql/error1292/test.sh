
function o() {
  echo "\033[32m$1\033[0m"
}

o "sh case.sh mysql:5.6 default"
sh case.sh mysql:5.6 default
o "sh case.sh mysql:5.6 allconf"
sh case.sh mysql:5.6 allconf
o "sh case.sh mysql:5.6 without_nozerodate"
sh case.sh mysql:5.6 without_nozerodate


o "sh case.sh mysql:5.7 default"
sh case.sh mysql:5.7 default
o "sh case.sh mysql:5.7 allconf"
sh case.sh mysql:5.7 allconf
o "sh case.sh mysql:5.7 without_nozerodate"
sh case.sh mysql:5.7 without_nozerodate



o "sh case.sh mysql:8.0 default"
sh case.sh mysql:8.0 default
o "sh case.sh mysql:8.0 allconf"
sh case.sh mysql:8.0 allconf
o "sh case.sh mysql:8.0 without_nozerodate"
sh case.sh mysql:8.0 without_nozerodate


o "sh case.sh mariadb:10.5 default"
sh case.sh mariadb:10.5 default
o "sh case.sh mariadb:10.5 allconf"
sh case.sh mariadb:10.5 allconf
o "sh case.sh mariadb:10.5 without_nozerodate"
sh case.sh mariadb:10.5 without_nozerodate

