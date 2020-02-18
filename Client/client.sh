#!/bin/bash
# Szymon Smykala

help=$1

if [ -z "$1" ]
then
    help="z"
fi

if [ $help == "-h" ] || [ $help == "--help" ]
then
    echo "*********************************************************************************"
    echo "This script analyses averange delays of each line on provided tram stop in Krakow"
    echo "Data is pulled from http://www.ttss.krakow.pl"
    echo "Arguments: -h, --help  -> Displays Help"
    echo "Run script without arguments and follow the instructions"
    echo "*********************************************************************************"

    exit 0
fi 

echo "Write stop name. For example: (Ruczaj, Norymberska)" 

read stop_to_check
cd "$(dirname "$0")"
echo "Checking if $stop_to_check exists..."
result=$(python3 ../TTSSProxy/aggregator.py -e "$stop_to_check")

if [ $result == "True" ]
then
    echo "Tram stop $stop_to_check exists"
    echo "How much time in minutes would you explore this stop? (Data is pulled every minute) Write 0 if you don't want to wait."
    read time_to_check_in_minutes
    
    time_to_check_in_second=$(($time_to_check_in_minutes*60))

    START_TIME=$SECONDS
    ELAPSED_TIME=$(($SECONDS - $START_TIME))
    
    while [  $ELAPSED_TIME -le $time_to_check_in_second ]
    do
        ELAPSED_TIME=$(($SECONDS - $START_TIME))
        n=$(($ELAPSED_TIME%5))
        if (( n == 0 ))
        then
            echo "$ELAPSED_TIME seconds elapsed"
        fi

        m=$(($ELAPSED_TIME%60))

        if (( m == 0 ))
        then
            echo "Pulling Data..."
            result=$(python3 ../TTSSProxy/aggregator.py -r "$stop_to_check")
        fi
        sleep 1
    done 
    
    perl ../StatisticAggregator/statisticAggregator.pl "$stop_to_check".data

    echo 
    echo "Delete datafile $stop_to_check.data? (y/n)"
    read delete_answer
    if [ $delete_answer == "y" ]
    then
        rm "$stop_to_check".data
    fi

else
    echo "Tram stop $stop_to_check doesn't exists"
fi