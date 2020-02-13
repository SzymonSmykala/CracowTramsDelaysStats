echo "Chech if stop exists"

read stop_to_check
cd "$(dirname "$0")"
result=$(python3 ../TTSSProxy/aggregator.py -e $stop_to_check)

if [ $result == "True" ]
then
    echo "Tram stop $stop_to_check exists"
    time_to_check_in_minutes=0
    
    time_to_check_in_second=$(($time_to_check_in_minutes*60))
    # time_to_check_in_minutes=1

    START_TIME=$SECONDS
    ELAPSED_TIME=$(($SECONDS - $START_TIME))
    
    while [  $ELAPSED_TIME -le $time_to_check_in_second ]
    do
        ELAPSED_TIME=$(($SECONDS - $START_TIME))
        sleep 5
        n=$(($ELAPSED_TIME%5))
        if (( n == 0 ))
        then
            echo "$ELAPSED_TIME"
        fi
    done 
result=$(python3 ../TTSSProxy/aggregator.py -r $stop_to_check)
perl ../StatisticAggregator/statisticAggregator.pl $stop_to_check.data

else
    echo "Tram stop $stop_to_check doesn't exists"

fi