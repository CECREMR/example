docker run --name test-mysql -v $PWD/db:/db -v $PWD/conf/$2/conf.d:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=test  -d $1

MYSQL="docker exec -it test-mysql mysql -uroot -ptest -Bse"


function o() {
  echo "\033[36m[EXEC SQL]$1\033[0m"
}
until ${MYSQL} "show processlist"; do
    sleep 2;
done

o "show databases"
${MYSQL} "show databases"

o 'DROP DATABASE IF EXISTS `test`; CREATE DATABASE `test`'
${MYSQL} 'DROP DATABASE IF EXISTS `test`; CREATE DATABASE `test`'

if [[ $2 != '' ]]; then
  o "set @@sql_mode='$2'"
fi

o "select @@sql_mode"
${MYSQL} "select @@sql_mode"

o "source /db/create_table_test.sql"
${MYSQL} "source /db/create_table_test.sql"

o "show create table test.test;"
${MYSQL} "show create table test.test;"

o "insert test.test value(1, '0000-00-00 00:00:00')"
${MYSQL} "insert test.test value(1, '0000-00-00 00:00:00') \G"

o "insert test.test value(2, '1970-01-01 00:00:00')"
${MYSQL} "insert test.test value(2, '1970-01-01 00:00:00') \G"

o "insert test.test value(3, '1970-01-01 00:00:01')"
${MYSQL} "insert test.test value(3, '1970-01-01 00:00:01') \G"

o "select * from test.test \G"
${MYSQL} "select * from test.test \G"

o "show create table test.test_datetime;"
${MYSQL} "show create table test.test_datetime;"

o "insert test.test_datetime value(1, '0000-00-00 00:00:00')"
${MYSQL} "insert test.test_datetime value(1, '0000-00-00 00:00:00') \G"

o "insert test.test_datetime value(2, '1970-01-01 00:00:00')"
${MYSQL} "insert test.test_datetime value(2, '1970-01-01 00:00:00') \G"

o "insert test.test_datetime value(3, '1970-01-01 00:00:01')"
${MYSQL} "insert test.test_datetime value(3, '1970-01-01 00:00:01') \G"

o "select * from test.test_datetime \G"
${MYSQL} "select * from test.test_datetime \G"

docker stop test-mysql
docker rm test-mysql

