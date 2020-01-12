from Aggregator.StopInfoDataController import StopInfoDataController

if __name__ == '__main__':
    stopdata = StopInfoDataController()
    data = stopdata.get_stop_data(130)
    print(data.to_string())

