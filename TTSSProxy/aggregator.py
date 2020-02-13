# Szymon Smykala
import sys

from Aggregator.Controllers.StopInfoDataController import StopInfoDataController
from Aggregator.Controllers.StopsDataController import StopsDataController

if sys.argv[1] == "-h" or sys.argv == "--help":
    print("******************************************************")
    print("This script pulls data from http://ttss.krakow.pl and saves it in *.data file")
    print("!!! This is not full program. Use /Client/client.sh instead !!!!!")
    print("Arguments: ")
    print("-h, --help -> Displays help")
    print("-e tramStopName -> checks if tram stop exists, returns True or False")
    print("-r tramStopName -> pulls current data about provided tram stop")
    print("******************************************************")

if __name__ == '__main__':

    user_arguments = sys.argv[1:]

    if user_arguments[0] == "-e":
        stop_name = user_arguments[1]
        stops = StopsDataController()
        result = stops.check_if_stop_exists(stop_name)
        print(result)
    if user_arguments[0] == '-r':
        stop_name = user_arguments[1]
        stops_controller = StopsDataController()
        stop_id = stops_controller.get_stop_id(stop_name)
        stop_info_controller = StopInfoDataController()
        stop_data = stop_info_controller.get_stop_data(stop_id)
        print(stop_data.to_string())
        file = open(f"{stop_name}.data", 'a')
        file.write(stop_data.to_string())
