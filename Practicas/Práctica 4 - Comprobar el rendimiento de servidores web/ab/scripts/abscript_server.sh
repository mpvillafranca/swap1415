#!/bin/bash

TESTS=5

# Declaring the URLs of the server one and the web farm
declare -A URLS=(["server_1"]="http://192.168.10.101/index.php")

# Deleting previous .dat if exists 
for id in ${!URLS[@]} 
do
	if [ -a "./ab-$id-TestTime.dat" ]; then rm ./ab-$id-TestTime.dat; fi
	if [ -a "./ab-$id-FailedRequests.dat" ]; then rm ./ab-$id-FailedRequests.dat; fi
	if [ -a "./ab-$id-RequestsPerSecond.dat" ]; then rm ./ab-$id-RequestsPerSecond.dat; fi
	if [ -a "./ab-$id-TimePerRequest.dat" ]; then rm ./ab-$id-TimePerRequest.dat; fi
done

test_time1=()
failed_requests1=()
requests_per_second1=()
time_per_request1=()
output1=""

for((test=1;test<=$TESTS;test++)) 
do
	output1=`ab -n 100 -c 10 http://192.168.10.101/index.php`
	test_time1+=(`echo "$output1" | egrep "Time taken for tests:" | tr -s ' ' | cut -d" " -f5`)
	failed_requests1+=(`echo "$output1" | egrep "Failed requests:" | tr -s ' ' | cut -d" " -f3`)
	requests_per_second1+=(`echo "$output1" | egrep "Requests per second:" | tr -s ' ' | cut -d" " -f4`)
	time_per_request1+=(`echo "$output1" | egrep "Time per request:" | egrep "\(mean\)" | tr -s ' ' | cut -d" " -f4`)	
done

echo ${test_time1[@]} >> ./ab-server_1-TestTime.dat
echo ${failed_requests1[@]} >> ./ab-server_1-FailedRequests.dat
echo ${requests_per_second1[@]} >> ./ab-server_1-RequestsPerSecond.dat
echo ${time_per_request1[@]} >> ./ab-server_1-TimePerRequest.dat
