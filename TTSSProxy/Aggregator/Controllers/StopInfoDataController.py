import json

import requests # TODO: must be installed

import backend_endpoints
from Aggregator.DTO.StopInfoData import StopInfoData
from Aggregator.DTO.Vehicle import Vehicle


class StopInfoDataController(object):
    @staticmethod
    def get_stop_data(stop_id: int):
        url = backend_endpoints.BackendEndpoints.stop_data + str(stop_id)
        response = requests.get(url)
        objects = json.loads(response.text)

        return StopInfoDataController.deserialize_stop(objects)

    @staticmethod
    def deserialize_stop(objects):
        stop = StopInfoData(objects["stopShortName"], objects["stopName"])
        for value in objects["actual"]:
            actual_time = ""
            if "actualTime" in value:
                actual_time = value["actualTime"]
            stop.add_vehicle(Vehicle(value["direction"], value["patternText"], value["status"], value["plannedTime"],
                                     value["tripId"], actual_time))
        return stop

