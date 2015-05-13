#!/bin/bash

TESTS=5

# Declaring the URLs of the server one and the web farm
declare -A URLS=(["farm"]="http://192.168.10.103/index.php")

# Deleting previous .dat if exists 
for id in ${!URLS[@]} 
do
	if [ -a "./ab-$id-TestTime.dat" ]; then rm ./ab-$id-TestTime.dat; fi
	if [ -a "./ab-$id-FailedRequests.dat" ]; then rm ./ab-$id-FailedRequests.dat; fi
	if [ -a "./ab-$id-RequestsPerSecond.dat" ]; then rm ./ab-$id-RequestsPerSecond.dat; fi
	if [ -a "./ab-$id-TimePerRequest.dat" ]; then rm ./ab-$id-TimePerRequest.dat; fi
done

test_time2=()
failed_requests2=()
requests_per_second2=()
time_per_request2=()
output2=""

for((test=1;test<=$TESTS;test++)) 
do
	output2=`ab -n 100 -c 10 http://192.168.10.103/index.php`
	test_time2+=(`echo "$output2" | egrep "Time taken for tests:" | tr -s ' ' | cut -d" " -f5`)
	failed_requests2+=(`echo "$output2" | egrep "Failed requests:" | tr -s ' ' | cut -d" " -f3`)
	requests_per_second2+=(`echo "$output2" | egrep "Requests per second:" | tr -s ' ' | cut -d" " -f4`)
	time_per_request2+=(`echo "$output2" | egrep "Time per request:" | egrep "\(mean\)" | tr -s ' ' | cut -d" " -f4`)
	
done

echo ${test_time2[@]} >> ./ab-farm-TestTime.dat
echo ${failed_requests2[@]} >> ./ab-farm-FailedRequests.dat
echo ${requests_per_second2[@]} >> ./ab-farm-RequestsPerSecond.dat
echo ${time_per_request2[@]} >> ./ab-farm-TimePerRequest.dat
