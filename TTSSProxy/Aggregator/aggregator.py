from Aggregator.Controllers.StopInfoDataController import StopInfoDataController
from Aggregator.Controllers.StopsDataController import StopsDataController

if __name__ == '__main__':
    stopdata = StopInfoDataController()

    stops = StopsDataController()
    stops.check_if_stop_exists(130)
    data = stopdata.get_stop_data(130)
    print(data.to_string())

