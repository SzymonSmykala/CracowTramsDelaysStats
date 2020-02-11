import sys

from Aggregator.Controllers.StopsDataController import StopsDataController

if __name__ == '__main__':

    user_arguments = sys.argv[1:]
    if user_arguments[0] == "-e":
        stop_name = user_arguments[1]
        stops = StopsDataController()
        result = stops.check_if_stop_exists(stop_name)
        print(result)
