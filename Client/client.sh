echo "Chech if stop exists"

read stop_to_check

result=$(python3 ../TTSSProxy/aggregator.py -e $stop_to_check)

if [ $result == "True" ]
then
    echo "Tram stop $stop_to_check exists"
    time_to_check_in_minutes=2
    
    time_to_check_in_second=10

    START_TIME=$SECONDS
    ELAPSED_TIME=$(($SECONDS - $START_TIME))
    
    while [  $ELAPSED_TIME -le $time_to_check_in_second ]
    do
        ELAPSED_TIME=$(($SECONDS - $START_TIME))
        echo "$ELAPSED_TIME"
    done 


else
    echo "Tram stop $stop_to_check doesn't exists"

fi