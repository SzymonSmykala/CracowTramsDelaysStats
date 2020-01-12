import json

import requests # TODO: must be installed

from Aggregator import backend_endpoints


class StopInfoDataController(object):
    @staticmethod
    def get_stop_data(stop_id: int):
        url = backend_endpoints.BackendEndpoints.stop_data + str(stop_id)
        response = requests.get(url)
        return json.loads(response.text)
