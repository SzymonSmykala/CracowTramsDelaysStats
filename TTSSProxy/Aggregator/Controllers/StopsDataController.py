from Aggregator.backend_endpoints import BackendEndpoints


class StopsDataController(object):
    def check_if_stop_exists(self, stop_name):
        url = BackendEndpoints.all_stops_data
        try
