import json

import requests

from Aggregator.DTO.Stop import Stop
from backend_endpoints import BackendEndpoints


class StopsDataController(object):
    @staticmethod
    def check_if_stop_exists(stop_name):
        url = BackendEndpoints.all_stops_data
        response = requests.get(url)
        objects = json.loads(response.text)
        list = StopsDataController.deserialize(objects)
        for stop in list:
            if stop.stop_name == stop_name:
                return True
        return False

    @staticmethod
    def deserialize(objects):
        stops = objects["stops"]
        result = []
        for obj in stops:
            result.append(Stop(obj["shortName"], obj["name"]))
        return result
